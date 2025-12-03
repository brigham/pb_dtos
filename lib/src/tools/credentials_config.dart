import 'package:freezed_annotation/freezed_annotation.dart';

part 'credentials_config.freezed.dart';
part 'credentials_config.g.dart';

@freezed
@JsonSerializable()
class CredentialsConfig with _$CredentialsConfig {
  @override
  final String email;
  @override
  final String password;

  CredentialsConfig({required this.email, required this.password});

  factory CredentialsConfig.fromJson(Map<String, dynamic> json) =>
      _$CredentialsConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialsConfigToJson(this);
}
