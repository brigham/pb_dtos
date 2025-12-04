// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roles_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RolesDto _$RolesDtoFromJson(Map<String, dynamic> json) => RolesDto(
  name: json['name'] as String? ?? '',
  permissions:
      (json['permissions'] as List<dynamic>?)
          ?.map((e) => RelationDto<PermissionsDto>.fromJson(e as String))
          .toList() ??
      const [],
  id: json['id'] as String? ?? "",
  expand: json['expand'] == null
      ? null
      : RolesExpandDto.fromJson(json['expand'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RolesDtoToJson(RolesDto instance) => <String, dynamic>{
  'name': ?Dto.optionalStringToJson(instance.name),
  'permissions': instance.permissions.map((e) => e.toJson()).toList(),
  'id': ?Dto.optionalStringToJson(instance.id),
};
