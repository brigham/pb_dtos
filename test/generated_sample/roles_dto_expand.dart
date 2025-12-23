import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_expand.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'users_dto.dart';
import 'permissions_dto.dart';
import 'roles_dto.dart';
import 'users_dto_expand.dart';
import 'permissions_dto_expand.dart';

part 'roles_dto_expand.freezed.dart';
part 'roles_dto_expand.g.dart';

enum RolesDtoExpandEnum<V>
    implements DtoExpandEnum<RolesDto>, DtoFilterableField<RolesDto, V> {
  permissions<RelationDto<PermissionsDto>>("permissions"),
  usersViaRoles<RelationDto<UsersDto>>("users_via_roles");

  const RolesDtoExpandEnum(this.pbName);

  @override
  final String pbName;
}

class RolesDtoExpand<D extends Dto<D>> extends DtoExpandBase<D, RolesDto> {
  RolesDtoExpand() : super.root();

  RolesDtoExpand.from(super.delegate);

  void call() {
    finish();
  }

  PermissionsDtoExpand<RolesDto> get permissions =>
      PermissionsDtoExpand.from(addRelation(RolesDtoFieldEnum.permissions));

  UsersDtoExpand<RolesDto> get usersViaRoles =>
      UsersDtoExpand.from(addRelation(RolesDtoExpandEnum.usersViaRoles));
}

@freezed
@JsonSerializable(createToJson: false)
class RolesExpandDto with _$RolesExpandDto {
  RolesExpandDto({this.permissions, this.usersViaRoles});

  @override
  final List<PermissionsDto>? permissions;
  @JsonKey(name: 'users_via_roles')
  @override
  final List<UsersDto>? usersViaRoles;

  factory RolesExpandDto.fromJson(Map<String, dynamic> json) =>
      _$RolesExpandDtoFromJson(json);
}
