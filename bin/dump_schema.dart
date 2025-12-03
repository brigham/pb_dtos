import 'dart:io';

import 'package:args/args.dart';
import 'package:pb_dtos/src/tools/dump_schema.dart';
import 'package:pb_dtos/src/tools/dump_schema_config.dart';
import 'package:pb_obtain/config.dart';

class _DumpSchemaConfigBuilder extends ConfigBuilder<DumpSchemaConfig> {
  _DumpSchemaConfigBuilder(): super('pb_dto_gen.yaml');

  @override
  void addOptions(ArgParser parser) {
    DumpSchemaConfig.addOptions(parser);
  }

  @override
  DumpSchemaConfig configFromJson(Map json) =>
      DumpSchemaConfig.fromJson(json);

  @override
  ({DumpSchemaConfig? config, bool pickedAny}) merge(
    DumpSchemaConfig? config,
    ArgResults results,
  ) {
    return DumpSchemaConfig.merge(config, results);
  }

  @override
  Map<String, dynamic> toJson(DumpSchemaConfig config) => config.toJson();
}

void main(List<String> arguments) async {
  var builder = _DumpSchemaConfigBuilder();
  var config = builder.buildConfig(arguments);

  if ((config.pocketbaseUrl == null) == (config.launch == null)) {
    print(
      "Error: One and only one of 'pocketbase_url' and 'pocketbase_spec' must be specified in the config file",
    );
    exit(1);
  }

  await dumpSchema(config);
}
