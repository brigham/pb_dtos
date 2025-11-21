import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'roles_dto.dart';
import 'users_dto_field_select.dart';
import 'permissions_dto_field_select.dart';
import 'roles_dto_expand.dart';

class RolesDtoFieldSelect<D extends Dto<D>>
    extends DtoRootFieldSelect<RolesDto> {
  RolesDtoFieldSelect() : super.root();

  ModifiableStringField name() {
    $addField(RolesDtoFieldEnum.name_);
    return ModifiableStringField($parts, $nextIndex);
  }

  void permissions() => $addField(RolesDtoFieldEnum.permissions);

  ModifiableStringField id() {
    $addField(RolesDtoFieldEnum.id);
    return ModifiableStringField($parts, $nextIndex);
  }

  ({
    PermissionsDtoNestedFieldSelect<RolesDto> Function() permissions,

    UsersDtoNestedFieldSelect<RolesDto> Function() usersViaRoles,
  })
  expand() => (
    permissions: () {
      $addRelation(RolesDtoFieldEnum.permissions);
      return PermissionsDtoNestedFieldSelect($parts, $nextIndex);
    },

    usersViaRoles: () {
      $addRelation(RolesDtoExpandEnum.usersViaRoles);
      return UsersDtoNestedFieldSelect($parts, $nextIndex);
    },
  );
}

class RolesDtoNestedFieldSelect<D extends Dto<D>>
    extends DtoNestedFieldSelect<D, RolesDto> {
  RolesDtoNestedFieldSelect(super.$parts, super.index);

  void name() => $addField(RolesDtoFieldEnum.name_);

  PermissionsDtoNestedFieldSelect<RolesDto> permissions() {
    $addRelation(RolesDtoFieldEnum.permissions);
    return PermissionsDtoNestedFieldSelect($parts, $nextIndex);
  }

  void id() => $addField(RolesDtoFieldEnum.id);

  UsersDtoNestedFieldSelect<RolesDto> usersViaRoles() {
    $addRelation(RolesDtoExpandEnum.usersViaRoles);
    return UsersDtoNestedFieldSelect($parts, $nextIndex);
  }
}
