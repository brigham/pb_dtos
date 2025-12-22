// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_profiles_patch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivateProfilesPatchDto _$PrivateProfilesPatchDtoFromJson(
  Map<String, dynamic> json,
) => PrivateProfilesPatchDto(
  user: json['user'] == null
      ? null
      : RelationDto<UsersDto>.fromJson(json['user'] as String),
  note: json['note'] as String?,
);

Map<String, dynamic> _$PrivateProfilesPatchDtoToJson(
  PrivateProfilesPatchDto instance,
) => <String, dynamic>{
  'user': ?instance.user?.toJson(),
  'note': ?instance.note,
};
