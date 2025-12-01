import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:dcli/dcli.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;
import 'package:pb_dtos/src/tools/dump_schema.dart';
import 'package:pb_dtos/src/tools/obtain_pocketbase.dart';
import 'package:pb_dtos/src/tools/start_pocketbase.dart';

void fail(String message) => throw Exception(message);

Future<Process> _startPocketBase() async {
  // Get PocketBase.
  var obtainConfig = ObtainPocketBaseConfig(
    githubTag: "v0.29.3",
    downloadPath: p.join(env['HOME']!, 'develop', 'pocketbase'),
  );
  var executable = await obtainPocketBase(obtainConfig);

  // Start PocketBase.
  print('Starting PocketBase...');
  var launchConfig = LaunchPocketBaseConfig(
    configurationDirectory: "test/test_schema",
    pocketBaseExecutable: executable,
    pocketBasePort: 8698,
    detached: true,
  );
  return await launchPocketbase(launchConfig);
}

Future<void> preWork() async {
  // Wait for the server to be healthy by polling the health endpoint.
  print('Waiting for PocketBase to become healthy...');
  bool serverReady = await _isPocketBaseRunning();

  if (!serverReady) {
    fail('PocketBase server did not become healthy in time.');
  }
  await Future.delayed(const Duration(seconds: 3));

  // Run the generator from the project root
  print('Running DTO generator...');
  final generatorConfig = DumpSchemaConfig(
    dtoOutputDir: 'test/generated_sample',
    pocketBaseSetup: PocketBaseUrl(url: "http://127.0.0.1:8698"),
    credentials: PocketBaseCredentials(
      email: "test@example.com",
      password: "1234567890",
    ),
  );

  await dumpSchema(generatorConfig);
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
    ['fix', '--apply', 'test/generated_sample'],
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

Future<bool> _isPocketBaseRunning() async {
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
  return serverReady;
}

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addOption(
      'coverage-path',
      help: 'Enable coverage and specify the output lcov file path.',
    );
  final argResults = parser.parse(arguments);

  if (await _isPocketBaseRunning()) {
    stderr.writeln(
      "An instance of PocketBase is already running. Please kill it and try again.",
    );
    exit(2);
  }
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
