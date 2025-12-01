import 'dart:io';

import 'package:args/args.dart';
import 'package:pb_dtos/src/tools/dump_schema.dart';
import 'package:pb_obtain/pb_obtain.dart';
import 'package:yaml/yaml.dart';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addFlag('verbose', abbr: 'v', help: 'Show verbose output.')
    ..addOption(
      'suffix',
      abbr: 's',
      defaultsTo: '',
      help:
          'Suffix to append to generated files. Useful to avoid IDEs treating goldens as real Dart files.',
    )
    ..addOption(
      'config',
      help: 'Path to the config file.',
      defaultsTo: 'pb_dto_gen.yaml',
    );

  final argResults = parser.parse(arguments);

  final configFile = File(argResults['config'] as String);
  if (!configFile.existsSync()) {
    print('Error: Config file not found at ${configFile.path}');
    exit(1);
  }
  final configDir = loadYaml(configFile.readAsStringSync());
  final pocketbaseUrl = configDir['pocketbase_url'] as String?;
  final pocketbaseSpec = configDir['pocketbase_spec'] as YamlMap?;
  if ((pocketbaseUrl == null) == (pocketbaseSpec == null)) {
    print(
      "Error: One and only one of 'pocketbase_url' and 'pocketbase_spec' must be specified in the config file",
    );
    exit(1);
  }
  final outputDir = configDir['output_dir'] as String;

  PocketBaseSetup pocketBaseSetup;
  if (pocketbaseUrl != null) {
    pocketBaseSetup = PocketBaseUrl(url: pocketbaseUrl);
  } else if (pocketbaseSpec != null) {
    var pocketbaseConfig = pocketbaseSpec['config'] as String;
    var pocketbaseExecutable = pocketbaseSpec['executable'] as String?;
    var obtainSpec = pocketbaseSpec['obtain'] as YamlMap?;
    if ((pocketbaseExecutable == null) == (obtainSpec == null)) {
      print(
        "Error: One and only one of 'executable' and 'obtain' must be specified in the config file",
      );
      exit(1);
    }
    ObtainConfig? obtainConfig;
    if (obtainSpec != null) {
      var pocketbaseVersion = obtainSpec['version'] as String;
      var pocketbaseDownloadDirectory = obtainSpec['release_dir'] as String;
      obtainConfig = ObtainConfig(
        githubTag: pocketbaseVersion,
        downloadDir: pocketbaseDownloadDirectory,
      );
    }
    var pocketbasePort = pocketbaseSpec['port'] as int;
    pocketBaseSetup = PocketBaseSpec(
      pocketbaseExecutable != null
          ? LaunchConfig.executable(
              templateDir: pocketbaseConfig,
              executable: ExecutableConfig(path: pocketbaseExecutable),
              port: pocketbasePort,
              detached: true,
            )
          : LaunchConfig.obtain(
              templateDir: pocketbaseConfig,
              port: pocketbasePort,
              detached: true,
              obtain: obtainConfig!,
            ),
    );
  } else {
    exit(1);
  }
  PocketBaseCredentials? credentials;
  var credentialsYaml = configDir['credentials'] as YamlMap?;
  if (credentialsYaml != null) {
    credentials = PocketBaseCredentials(
      email: credentialsYaml['email'] as String,
      password: credentialsYaml['password'] as String,
    );
  }
  final dumpSchemaConfig = DumpSchemaConfig(
    verbose: argResults['verbose'],
    suffix: argResults['suffix'],
    pocketBaseSetup: pocketBaseSetup,
    dtoOutputDir: outputDir,
    credentials: credentials,
  );

  await dumpSchema(dumpSchemaConfig);
}
