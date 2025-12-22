// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_profiles_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrivateProfilesDto _$PrivateProfilesDtoFromJson(Map<String, dynamic> json) =>
    PrivateProfilesDto(
      id: json['id'] as String? ?? "",
      user: json['user'] == null
          ? const RelationDto<UsersDto>("")
          : RelationDto<UsersDto>.fromJson(json['user'] as String),
      note: json['note'] as String? ?? "",
      expand: json['expand'] == null
          ? null
          : PrivateProfilesExpandDto.fromJson(
              json['expand'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PrivateProfilesDtoToJson(PrivateProfilesDto instance) =>
    <String, dynamic>{
      'id': ?Dto.optionalStringToJson(instance.id),
      'user': instance.user.toJson(),
      'note': ?Dto.optionalStringToJson(instance.note),
    };
