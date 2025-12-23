import 'dart:async';
import 'dart:io';

import 'package:args/args.dart';
import 'package:dcli/dcli.dart';
import 'package:path/path.dart' as p;
import 'package:pb_dtos/src/tools/credentials_config.dart';
import 'package:pb_dtos/src/tools/dump_schema.dart';
import 'package:pb_dtos/src/tools/dump_schema_config.dart';
import 'package:pb_obtain/pb_obtain.dart';

void fail(String message) => throw Exception(message);

Future<PocketBaseProcess> _startPocketBase() async {
  // Start PocketBase.
  print('Starting PocketBase...');
  var launchConfig = LaunchConfig.obtain(
    templateDir: 'test/test_schema',
    obtain: ObtainConfig(
      githubTag: 'v0.29.3',
      downloadDir: p.join(env['HOME']!, 'develop', 'pocketbase'),
    ),
    stdout: '/dev/null',
    port: 8698,
    detached: false,
  );
  return await launch(launchConfig);
}

Future<void> preWork() async {
  // Run the generator from the project root
  print('Running DTO generator...');
  final generatorConfig = DumpSchemaConfig(
    outputDir: 'test/generated_sample',
    pocketbaseUrl: 'http://127.0.0.1:8698',
    credentials: CredentialsConfig(
      email: 'test@example.com',
      password: '1234567890',
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
    stdoutEncoding: .getByName('UTF-8'),
    stderrEncoding: .getByName('UTF-8'),
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

  PocketBaseProcess pbProcess = await _startPocketBase();

  int exitCode;
  try {
    await preWork();
    // Launch the tests
    final testArgs = ['test', '--tags', 'postgen', '--run-skipped'];
    if (argResults.wasParsed('coverage-path')) {
      testArgs.add('--coverage-path=${argResults['coverage-path']}');
    }
    testArgs.addAll(argResults.rest);
    Process tests = await Process.start('dart', testArgs);
    tests.stdout.transform(SystemEncoding().decoder).listen(print);
    tests.stderr.transform(SystemEncoding().decoder).listen(print);
    exitCode = await tests.exitCode;
  } finally {
    await pbProcess.stop();
  }
  exit(exitCode);
}
