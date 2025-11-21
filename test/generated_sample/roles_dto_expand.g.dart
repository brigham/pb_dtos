// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_dto_expand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RolesExpandDto _$RolesExpandDtoFromJson(Map<String, dynamic> json) =>
    RolesExpandDto(
      permissions:
          (json['permissions'] as List<dynamic>?)
              ?.map((e) => PermissionsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      usersViaRoles:
          (json['users_via_roles'] as List<dynamic>?)
              ?.map((e) => UsersDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );
