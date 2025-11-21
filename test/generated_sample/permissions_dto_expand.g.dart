// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions_dto_expand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionsExpandDto _$PermissionsExpandDtoFromJson(
  Map<String, dynamic> json,
) => PermissionsExpandDto(
  rolesViaPermissions:
      (json['roles_via_permissions'] as List<dynamic>?)
          ?.map((e) => RolesDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      null,
);
