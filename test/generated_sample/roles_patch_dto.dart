import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'package:pb_dtos/pb/dto/patch_dto.dart';
import 'permissions_dto.dart';
import 'roles_dto.dart';
import 'package:http/http.dart' as http;

part 'roles_patch_dto.freezed.dart';
part 'roles_patch_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RolesPatchDto with _$RolesPatchDto implements PatchDto<RolesDto> {
  RolesPatchDto({
    this.name,
    this.permissions,
    this.permissionsRemovals,
    this.permissionsPrefix,
    this.permissionsSuffix,
  });

  @override
  String? name;

  @override
  List<RelationDto<PermissionsDto>>? permissions;

  @override
  @JsonKey(name: 'permissions-')
  List<RelationDto<PermissionsDto>>? permissionsRemovals;

  @override
  @JsonKey(name: '+permissions')
  List<RelationDto<PermissionsDto>>? permissionsPrefix;

  @override
  @JsonKey(name: 'permissions+')
  List<RelationDto<PermissionsDto>>? permissionsSuffix;

  @override
  Map<String, dynamic> toJson() => _$RolesPatchDtoToJson(this);

  @override
  List<Future<http.MultipartFile>> toFiles() => const [];
}
