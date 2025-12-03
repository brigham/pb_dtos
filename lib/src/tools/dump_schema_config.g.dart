// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dump_schema_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DumpSchemaConfig _$DumpSchemaConfigFromJson(Map<String, dynamic> json) =>
    DumpSchemaConfig(
      pocketbaseUrl: json['pocketbaseUrl'] as String?,
      launch: json['launch'] == null
          ? null
          : LaunchConfig.fromJson(json['launch'] as Map<String, dynamic>),
      outputDir: json['outputDir'] as String,
      credentials: json['credentials'] == null
          ? null
          : CredentialsConfig.fromJson(
              json['credentials'] as Map<String, dynamic>,
            ),
      suffix: json['suffix'] as String?,
      verbose: json['verbose'] as bool? ?? false,
    );

Map<String, dynamic> _$DumpSchemaConfigToJson(DumpSchemaConfig instance) =>
    <String, dynamic>{
      'pocketbaseUrl': instance.pocketbaseUrl,
      'launch': instance.launch,
      'outputDir': instance.outputDir,
      'credentials': instance.credentials,
      'suffix': instance.suffix,
      'verbose': instance.verbose,
    };
