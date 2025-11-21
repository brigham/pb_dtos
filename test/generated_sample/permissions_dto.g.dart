// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PermissionsDto _$PermissionsDtoFromJson(Map<String, dynamic> json) =>
    PermissionsDto(
      name: json['name'] as String,
      id: json['id'] as String? ?? "",
      expand: json['expand'] == null
          ? null
          : PermissionsExpandDto.fromJson(
              json['expand'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$PermissionsDtoToJson(PermissionsDto instance) =>
    <String, dynamic>{
      'name': ?Dto.optionalStringToJson(instance.name),
      'id': ?Dto.optionalStringToJson(instance.id),
    };
