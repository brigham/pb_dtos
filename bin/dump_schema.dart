import 'dart:io';

import 'package:args/args.dart';
import 'package:pb_dtos/src/tools/dump_schema.dart';
import 'package:pb_dtos/src/tools/dump_schema_config.dart';
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
  final dumpSchemaConfig = DumpSchemaConfig.fromJson(configDir);
  if ((dumpSchemaConfig.pocketbaseUrl == null) ==
      (dumpSchemaConfig.launch == null)) {
    print(
      "Error: One and only one of 'pocketbase_url' and 'pocketbase_spec' must be specified in the config file",
    );
    exit(1);
  }

  await dumpSchema(dumpSchemaConfig);
}
