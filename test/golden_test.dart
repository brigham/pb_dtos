import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:test/test.dart';

void main() {
  group('Golden tests', () {
    late final Directory tempDir;
    late final String tempGenPath;
    late final Directory goldenDir;
    Process? pbProcess;
    var testFailed = false;

    setUpAll(() async {
      tempDir = Directory.systemTemp.createTempSync('golden_test_');
      tempGenPath = p.join(tempDir.path, 'gen');
      goldenDir = Directory(p.join('test', 'goldens'));
      print('Temp directory for generated files: ${tempDir.path}');

      // Start PocketBase.
      print('Starting PocketBase...');
      pbProcess = await Process.start(
        p.join(Directory.current.path, 'bin', 'start_pocketbase.sh'),
        ['--config=test/test_schema'],
      );

      // Pipe server output to the console for debugging
      pbProcess!.stdout.transform(SystemEncoding().decoder).listen(print);
      pbProcess!.stderr.transform(SystemEncoding().decoder).listen(print);

      // Wait for the server to be healthy by polling the health endpoint.
      print('Waiting for PocketBase to become healthy...');
      final healthCheckUrl = Uri.parse('http://127.0.0.1:8696/api/health');
      var serverReady = false;
      for (var i = 0; i < 20; i++) {
        // 20-second timeout
        try {
          final response = await http.get(healthCheckUrl);
          if (response.statusCode == 200) {
            print('PocketBase is healthy.');
            serverReady = true;
            break;
          }
        } catch (e) {
          // Ignore connection errors
        }
        await Future.delayed(const Duration(seconds: 1));
      }

      if (!serverReady) {
        fail('PocketBase server did not become healthy in time.');
      }
      await Future.delayed(const Duration(seconds: 3));

      // Create a temporary config file
      final configFile = File(p.join(tempDir.path, 'pb_dto_gen.yaml'));
      await configFile.writeAsString('''
pocketbase_url: http://127.0.0.1:8696
output_dir: ${p.join(tempGenPath, 'lib')}
test_output_dir: ${p.join(tempGenPath, 'test')}
''');
      print('Created temp config file at ${configFile.path}');

      // Run the generator from the project root, passing the temp config path.
      print('Running DTO generator...');
      final generatorScript = p.join(
        Directory.current.path,
        'bin',
        'dump_schema.dart',
      );
      final result = await Process.run(
        'dart',
        [
          'run',
          generatorScript,
          '--config=${configFile.path}',
          '--suffix=.golden',
        ],
        environment: {'PB_CREDS': 'test@example.com:1234567890'},
      );

      if (result.exitCode != 0) {
        print('Generator stdout:\n${result.stdout}');
        print('Generator stderr:\n${result.stderr}');
        fail('Generator failed with exit code ${result.exitCode}');
      }
      print('Generator finished successfully.');
    });

    tearDownAll(() {
      print('Stopping PocketBase...');
      pbProcess?.kill(ProcessSignal.sigkill);
      if (!testFailed) {
        print('Deleting temp directory: ${tempDir.path}');
        tempDir.deleteSync(recursive: true);
      } else {
        print(
          'Skipping deletion of temp directory due to test failure: ${tempDir.path}',
        );
      }
    });

    test('Generated DTOs match golden files', () {
      try {
        final generatedFiles = Directory(tempGenPath)
            .listSync(recursive: true)
            .whereType<File>()
            .map((f) => f.path)
            .toList();
        final goldenFiles = Directory(goldenDir.path)
            .listSync(recursive: true)
            .whereType<File>()
            .map((f) => f.path)
            .toList();

        final generatedRelative = generatedFiles
            .map((f) => p.relative(f, from: tempGenPath))
            .toSet();
        final goldenRelative = goldenFiles
            .map((f) => p.relative(f, from: goldenDir.path))
            .toSet();

        final missingFiles = goldenRelative.difference(generatedRelative);
        final newFiles = generatedRelative.difference(goldenRelative);

        var filesMatch = missingFiles.isEmpty && newFiles.isEmpty;

        if (!filesMatch) {
          final message = StringBuffer();
          message.writeln('Golden files do not match the generated files.');
          if (missingFiles.isNotEmpty) {
            message.writeln(
              '\nMissing files (present in goldens but not generated):',
            );
            for (var f in missingFiles) {
              message.writeln(' - $f');
            }
          }
          if (newFiles.isNotEmpty) {
            message.writeln(
              '\nNew files (generated but not present in goldens):',
            );
            for (var f in newFiles) {
              message.writeln(' - $f');
            }
          }
          final updateCommand =
              'rm -rf ${goldenDir.path}/* && cp -r $tempGenPath/* ${goldenDir.path}/';
          message.writeln(
            '\nTo update the golden files, run the following command:\n\n'
            '  $updateCommand\n',
          );
          fail(message.toString());
        }

        // Compare file contents
        for (final relativePath in goldenRelative) {
          final goldenFile = File(p.join(goldenDir.path, relativePath));
          final generatedFile = File(p.join(tempGenPath, relativePath));

          if (goldenFile.readAsStringSync() !=
              generatedFile.readAsStringSync()) {
            filesMatch = false;
            print('Mismatch found in file: $relativePath');
          }
        }

        if (!filesMatch) {
          final updateCommand =
              'rm -rf ${goldenDir.path}/* && cp -r $tempGenPath/* ${goldenDir.path}/';
          final diffCommand = 'diff -r ${goldenDir.path} $tempGenPath';
          fail(
            'Golden file contents do not match generated files.\n\n'
            'To see the differences, run:\n'
            '  $diffCommand\n\n'
            'To update the golden files, run:\n'
            '  $updateCommand\n',
          );
        }

        expect(
          filesMatch,
          isTrue,
          reason: 'Generated files should match golden files.',
        );
      } catch (e) {
        testFailed = true;
        rethrow;
      }
    });
  });
}
