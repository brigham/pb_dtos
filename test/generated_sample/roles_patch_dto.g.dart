// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_patch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RolesPatchDto _$RolesPatchDtoFromJson(Map<String, dynamic> json) =>
    RolesPatchDto(
      name: json['name'] as String?,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => RelationDto<PermissionsDto>.fromJson(e as String))
          .toList(),
      permissionsRemovals: (json['permissions-'] as List<dynamic>?)
          ?.map((e) => RelationDto<PermissionsDto>.fromJson(e as String))
          .toList(),
      permissionsPrefix: (json['+permissions'] as List<dynamic>?)
          ?.map((e) => RelationDto<PermissionsDto>.fromJson(e as String))
          .toList(),
      permissionsSuffix: (json['permissions+'] as List<dynamic>?)
          ?.map((e) => RelationDto<PermissionsDto>.fromJson(e as String))
          .toList(),
    );

Map<String, dynamic> _$RolesPatchDtoToJson(
  RolesPatchDto instance,
) => <String, dynamic>{
  'name': ?instance.name,
  'permissions': ?instance.permissions?.map((e) => e.toJson()).toList(),
  'permissions-': ?instance.permissionsRemovals
      ?.map((e) => e.toJson())
      .toList(),
  '+permissions': ?instance.permissionsPrefix?.map((e) => e.toJson()).toList(),
  'permissions+': ?instance.permissionsSuffix?.map((e) => e.toJson()).toList(),
};
