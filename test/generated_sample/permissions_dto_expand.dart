import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_expand.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'permissions_dto.dart';
import 'roles_dto.dart';
import 'roles_dto_expand.dart';

part 'permissions_dto_expand.freezed.dart';
part 'permissions_dto_expand.g.dart';

enum PermissionsDtoExpandEnum<V>
    implements
        DtoExpandEnum<PermissionsDto>,
        DtoFilterableField<PermissionsDto, V> {
  rolesViaPermissions<RelationDto<RolesDto>>("roles_via_permissions");

  const PermissionsDtoExpandEnum(this.pbName);

  @override
  final String pbName;
}

class PermissionsDtoExpand<D extends Dto<D>>
    extends DtoExpandBase<D, PermissionsDto> {
  PermissionsDtoExpand() : super.root();

  PermissionsDtoExpand.from(super.delegate);

  void call() {
    finish();
  }

  RolesDtoExpand<PermissionsDto> get rolesViaPermissions => RolesDtoExpand.from(
    addRelation(PermissionsDtoExpandEnum.rolesViaPermissions),
  );
}

@freezed
@JsonSerializable(createToJson: false)
class PermissionsExpandDto with _$PermissionsExpandDto {
  PermissionsExpandDto({this.rolesViaPermissions});

  @JsonKey(name: 'roles_via_permissions')
  @override
  final List<RolesDto>? rolesViaPermissions;

  factory PermissionsExpandDto.fromJson(Map<String, dynamic> json) =>
      _$PermissionsExpandDtoFromJson(json);
}
