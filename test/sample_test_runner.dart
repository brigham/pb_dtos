import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

void fail(String message) => throw Exception(message);

Future<Process> _startPocketBase() async {
  // Start PocketBase.
  print('Starting PocketBase...');
  var pbProcess = await Process.start(
    p.join(Directory.current.path, 'bin', 'start_pocketbase.sh'),
    ['--config=test/test_schema', '--port=8698'],
  );
  // Pipe server output to the console for debugging
  pbProcess.stdout.transform(SystemEncoding().decoder).listen(print);
  pbProcess.stderr.transform(SystemEncoding().decoder).listen(print);

  return pbProcess;
}

Future<void> preWork() async {
  // Wait for the server to be healthy by polling the health endpoint.
  print('Waiting for PocketBase to become healthy...');
  var pocketBaseUri = 'http://127.0.0.1:8698';
  final healthCheckUrl = Uri.parse('$pocketBaseUri/api/health');
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

  final configFile = File('test/test_schema/pb_dto_gen.yaml');

  // Run the generator from the project root, passing the temp config path.
  print('Running DTO generator...');
  final generatorScript = p.join(
    Directory.current.path,
    'bin',
    'dump_schema.dart',
  );
  final result = await Process.run(
    'dart',
    ['run', generatorScript, '--config=${configFile.path}'],
    environment: {'PB_CREDS': 'test@example.com:1234567890'},
    stdoutEncoding: .getByName("UTF-8"),
    stderrEncoding: .getByName("UTF-8"),
  );

  if (result.exitCode != 0) {
    print('Generator stdout:\n${result.stdout}');
    print('Generator stderr:\n${result.stderr}');
    fail('Generator failed with exit code ${result.exitCode}');
  }
  print('Generator finished successfully.');

  print('Running build_runner.');
  final buildRunnerResult = await Process.run('dart', [
    'run',
    'build_runner',
    'build',
  ]);
  if (buildRunnerResult.exitCode != 0) {
    print('build_runner stdout:\n${buildRunnerResult.stdout}');
    print('build_runner stderr:\n${buildRunnerResult.stderr}');
    fail('build_runner failed with exit code ${buildRunnerResult.exitCode}');
  }
  print('build_runner finished successfully.');

  print('Running dart fix.');
  final fixResult = await Process.run(
    'dart',
    ['fix', '--apply', 'lib/src/sample'],
    stdoutEncoding: .getByName("UTF-8"),
    stderrEncoding: .getByName("UTF-8"),
  );
  if (fixResult.exitCode != 0) {
    print('fix stdout:\n${fixResult.stdout}');
    print('fix stderr:\n${fixResult.stderr}');
    fail('fix failed with exit code ${fixResult.exitCode}');
  }
  print('dart fix finished successfully.');
}

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption(
      'coverage-path',
      help: 'Enable coverage and specify the output lcov file path.',
    );
  final argResults = parser.parse(arguments);

  Process pbProcess = await _startPocketBase();
  await preWork();

  int exitCode;
  try {
    // Launch the tests
    final testArgs = ["test", "--tags", "postgen", "--run-skipped"];
    if (argResults.wasParsed('coverage-path')) {
      testArgs.add('--coverage-path=${argResults['coverage-path']}');
    }
    Process tests = await Process.start("dart", testArgs);
    tests.stdout.transform(SystemEncoding().decoder).listen(print);
    tests.stderr.transform(SystemEncoding().decoder).listen(print);
    exitCode = await tests.exitCode;
  } finally {
    pbProcess.kill(ProcessSignal.sigkill);
  }
  exit(exitCode);
}
