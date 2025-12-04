// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dump_schema_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DumpSchemaConfig _$DumpSchemaConfigFromJson(Map json) =>
    $checkedCreate('DumpSchemaConfig', json, ($checkedConvert) {
      $checkKeys(
        json,
        allowedKeys: const [
          'pocketbaseUrl',
          'launch',
          'outputDir',
          'credentials',
          'suffix',
          'verbose',
          'debug',
        ],
      );
      final val = DumpSchemaConfig(
        pocketbaseUrl: $checkedConvert('pocketbaseUrl', (v) => v as String?),
        launch: $checkedConvert(
          'launch',
          (v) => v == null ? null : LaunchConfig.fromJson(v as Map),
        ),
        outputDir: $checkedConvert('outputDir', (v) => v as String),
        credentials: $checkedConvert(
          'credentials',
          (v) => v == null ? null : CredentialsConfig.fromJson(v as Map),
        ),
        suffix: $checkedConvert('suffix', (v) => v as String?),
        verbose: $checkedConvert('verbose', (v) => v as bool? ?? false),
        debug: $checkedConvert('debug', (v) => v as bool? ?? false),
      );
      return val;
    });

Map<String, dynamic> _$DumpSchemaConfigToJson(DumpSchemaConfig instance) =>
    <String, dynamic>{
      'pocketbaseUrl': instance.pocketbaseUrl,
      'launch': instance.launch,
      'outputDir': instance.outputDir,
      'credentials': instance.credentials,
      'suffix': instance.suffix,
      'verbose': instance.verbose,
      'debug': instance.debug,
    };
