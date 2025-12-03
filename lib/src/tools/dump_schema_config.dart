import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/src/tools/credentials_config.dart';
import 'package:pb_obtain/pb_obtain.dart';

part 'dump_schema_config.freezed.dart';
part 'dump_schema_config.g.dart';

@freezed
@JsonSerializable()
class DumpSchemaConfig with _$DumpSchemaConfig {
  @override
  final String? pocketbaseUrl;

  @override
  final LaunchConfig? launch;

  @override
  final String outputDir;

  @override
  final CredentialsConfig? credentials;

  @override
  final String? suffix;

  @override
  final bool verbose;

  DumpSchemaConfig({
    this.pocketbaseUrl,
    this.launch,
    required this.outputDir,
    this.credentials,
    this.suffix,
    this.verbose = false,
  });

  factory DumpSchemaConfig.fromJson(Map<String, dynamic> json) =>
      _$DumpSchemaConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DumpSchemaConfigToJson(this);
}
