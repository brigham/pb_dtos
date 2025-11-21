// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_patch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersPatchDto _$UsersPatchDtoFromJson(Map<String, dynamic> json) =>
    UsersPatchDto(
      password: json['password'] as String?,
      tokenKey: json['tokenKey'] as String?,
      email: json['email'] as String?,
      emailVisibility: json['emailVisibility'] as bool?,
      verified: json['verified'] as bool?,
      name: json['name'] as String?,
      avatar: json['avatar'] == null
          ? null
          : FileDto.fromJson(json['avatar'] as String),
      roles: (json['roles'] as List<dynamic>?)
          ?.map((e) => RelationDto<RolesDto>.fromJson(e as String))
          .toList(),
      rolesRemovals: (json['roles-'] as List<dynamic>?)
          ?.map((e) => RelationDto<RolesDto>.fromJson(e as String))
          .toList(),
      rolesPrefix: (json['+roles'] as List<dynamic>?)
          ?.map((e) => RelationDto<RolesDto>.fromJson(e as String))
          .toList(),
      rolesSuffix: (json['roles+'] as List<dynamic>?)
          ?.map((e) => RelationDto<RolesDto>.fromJson(e as String))
          .toList(),
      birthday: json['birthday'] == null
          ? null
          : DateTime.parse(json['birthday'] as String),
    );

Map<String, dynamic> _$UsersPatchDtoToJson(UsersPatchDto instance) =>
    <String, dynamic>{
      'password': ?instance.password,
      'tokenKey': ?instance.tokenKey,
      'email': ?instance.email,
      'emailVisibility': ?instance.emailVisibility,
      'verified': ?instance.verified,
      'name': ?instance.name,
      'avatar': ?instance.avatar?.toJson(),
      'roles': ?instance.roles?.map((e) => e.toJson()).toList(),
      'roles-': ?instance.rolesRemovals?.map((e) => e.toJson()).toList(),
      '+roles': ?instance.rolesPrefix?.map((e) => e.toJson()).toList(),
      'roles+': ?instance.rolesSuffix?.map((e) => e.toJson()).toList(),
      'birthday': ?instance.birthday?.toIso8601String(),
    };
