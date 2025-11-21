import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'permissions_dto.dart';
import 'roles_dto_field_select.dart';
import 'permissions_dto_expand.dart';

class PermissionsDtoFieldSelect<D extends Dto<D>>
    extends DtoRootFieldSelect<PermissionsDto> {
  PermissionsDtoFieldSelect() : super.root();

  ModifiableStringField name() {
    $addField(PermissionsDtoFieldEnum.name_);
    return ModifiableStringField($parts, $nextIndex);
  }

  ModifiableStringField id() {
    $addField(PermissionsDtoFieldEnum.id);
    return ModifiableStringField($parts, $nextIndex);
  }

  ({RolesDtoNestedFieldSelect<PermissionsDto> Function() rolesViaPermissions})
  expand() => (
    rolesViaPermissions: () {
      $addRelation(PermissionsDtoExpandEnum.rolesViaPermissions);
      return RolesDtoNestedFieldSelect($parts, $nextIndex);
    },
  );
}

class PermissionsDtoNestedFieldSelect<D extends Dto<D>>
    extends DtoNestedFieldSelect<D, PermissionsDto> {
  PermissionsDtoNestedFieldSelect(super.$parts, super.index);

  void name() => $addField(PermissionsDtoFieldEnum.name_);

  void id() => $addField(PermissionsDtoFieldEnum.id);

  RolesDtoNestedFieldSelect<PermissionsDto> rolesViaPermissions() {
    $addRelation(PermissionsDtoExpandEnum.rolesViaPermissions);
    return RolesDtoNestedFieldSelect($parts, $nextIndex);
  }
}
