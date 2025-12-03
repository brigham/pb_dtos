// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credentials_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialsConfig _$CredentialsConfigFromJson(Map json) =>
    $checkedCreate('CredentialsConfig', json, ($checkedConvert) {
      $checkKeys(json, allowedKeys: const ['email', 'password']);
      final val = CredentialsConfig(
        email: $checkedConvert('email', (v) => v as String),
        password: $checkedConvert('password', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$CredentialsConfigToJson(CredentialsConfig instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
