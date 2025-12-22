// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_profiles_dto_expand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivateProfilesExpandDto _$PrivateProfilesExpandDtoFromJson(
  Map<String, dynamic> json,
) => PrivateProfilesExpandDto(
  user: json['user'] == null
      ? null
      : UsersDto.fromJson(json['user'] as Map<String, dynamic>),
);
