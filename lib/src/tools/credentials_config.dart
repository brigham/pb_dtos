import 'package:freezed_annotation/freezed_annotation.dart';

part 'credentials_config.freezed.dart';
part 'credentials_config.g.dart';

@freezed
@JsonSerializable(anyMap: true, checked: true, disallowUnrecognizedKeys: true)
class CredentialsConfig with _$CredentialsConfig {
  @override
  final String email;
  @override
  final String password;

  void validate() {
    if (email.isEmpty) {
      throw ArgumentError.value(email, 'email', 'cannot be empty');
    }
    if (password.isEmpty) {
      throw ArgumentError.value(password, 'password', 'cannot be empty');
    }
  }

  CredentialsConfig({required this.email, required this.password});

  factory CredentialsConfig.fromJson(Map<dynamic, dynamic> json) =>
      _$CredentialsConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialsConfigToJson(this);
}
