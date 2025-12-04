// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersDto _$UsersDtoFromJson(Map<String, dynamic> json) => UsersDto(
  id: json['id'] as String? ?? "",
  password: json['password'] as String? ?? "",
  email: json['email'] as String? ?? '',
  emailVisibility: json['emailVisibility'] as bool? ?? false,
  verified: json['verified'] as bool? ?? false,
  name: json['name'] as String? ?? "",
  avatar: json['avatar'] == null
      ? null
      : FileDto.fromJson(json['avatar'] as String),
  roles:
      (json['roles'] as List<dynamic>?)
          ?.map((e) => RelationDto<RolesDto>.fromJson(e as String))
          .toList() ??
      const [],
  birthday: json['birthday'] == null
      ? null
      : DateTime.parse(json['birthday'] as String),
  created: json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String),
  updated: json['updated'] == null
      ? null
      : DateTime.parse(json['updated'] as String),
  expand: json['expand'] == null
      ? null
      : UsersExpandDto.fromJson(json['expand'] as Map<String, dynamic>),
  passwordConfirm: json['passwordConfirm'] as String?,
);

Map<String, dynamic> _$UsersDtoToJson(UsersDto instance) => <String, dynamic>{
  'id': ?Dto.optionalStringToJson(instance.id),
  'password': ?Dto.optionalStringToJson(instance.password),
  'email': ?Dto.optionalStringToJson(instance.email),
  'emailVisibility': ?Dto.optionalBoolToJson(instance.emailVisibility),
  'verified': ?Dto.optionalBoolToJson(instance.verified),
  'name': ?Dto.optionalStringToJson(instance.name),
  'avatar': ?instance.avatar?.toJson(),
  'roles': instance.roles.map((e) => e.toJson()).toList(),
  'birthday': ?instance.birthday?.toIso8601String(),
  'created': ?instance.created?.toIso8601String(),
  'updated': ?instance.updated?.toIso8601String(),
  'passwordConfirm': ?instance.passwordConfirm,
};
