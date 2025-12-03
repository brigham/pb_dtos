import 'dart:async';
import 'dart:io';

import 'package:dcli/dcli.dart';
import 'package:path/path.dart' as p;
import 'package:pb_dtos/src/tools/credentials_config.dart';
import 'package:pb_dtos/src/tools/dump_schema.dart';
import 'package:pb_dtos/src/tools/dump_schema_config.dart';
import 'package:pb_obtain/pb_obtain.dart';
import 'package:test/test.dart';

void main() {
  group('Golden tests', () {
    late final Directory tempDir;
    late final String tempGenPath;
    late final Directory goldenDir;
    PocketBaseProcess? pbProcess;
    var testFailed = false;

    Future<void> start() async {
      tempDir = Directory.systemTemp.createTempSync('golden_test_');
      tempGenPath = p.join(tempDir.path, 'gen');
      goldenDir = Directory(p.join('test', 'goldens'));
      print('Temp directory for generated files: ${tempDir.path}');

      // Start PocketBase.
      var launchConfig = LaunchConfig.obtain(
        templateDir: "test/test_schema",
        obtain: ObtainConfig(
          githubTag: "v0.29.3",
          downloadDir: p.join(env['HOME']!, 'develop', 'pocketbase'),
        ),
        port: 8696,
        detached: false,
      );
      pbProcess = await launch(launchConfig);

      // Run the generator from the project root
      print('Running DTO generator...');
      final generatorConfig = DumpSchemaConfig(
        outputDir: p.join(tempGenPath, 'lib'),
        pocketbaseUrl: "http://127.0.0.1:8696",
        suffix: '.golden',
        credentials: CredentialsConfig(
          email: "test@example.com",
          password: "1234567890",
        ),
      );

      await dumpSchema(generatorConfig);
      print('Generator finished successfully.');
    }

    Future<void> stop() async {
      print('Stopping PocketBase...');
      var process = pbProcess;
      if (process != null) {
        expect(
          await process.stop(),
          isTrue,
          reason: "Could not stop PocketBase server.",
        );
      }
      if (!testFailed) {
        print('Deleting temp directory: ${tempDir.path}');
        tempDir.deleteSync(recursive: true);
      } else {
        print(
          'Skipping deletion of temp directory due to test failure: ${tempDir.path}',
        );
      }
    }

    test('Generated DTOs match golden files', () async {
      try {
        await start();

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
      } finally {
        await stop();
      }
    });
  });
}
