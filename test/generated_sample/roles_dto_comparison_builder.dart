import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'roles_dto.dart';
import 'roles_dto_expand.dart';
import 'users_dto_comparison_builder.dart';
import 'permissions_dto_comparison_builder.dart';

class RolesDtoComparisonBuilder<D extends Dto<D>>
    extends RelationComparisonBuilder<D, RolesDto> {
  RolesDtoComparisonBuilder(super.fieldPath, super.handler) : super.fieldPath();

  TerminalRelationComparisonBuilder<D, String> get name =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(RolesDtoFieldEnum.name_),
        handler,
      );
  PermissionsDtoMultirelComparisonBuilder<D> get permissions =>
      PermissionsDtoMultirelComparisonBuilder(
        fieldPath.extend(RolesDtoFieldEnum.permissions),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> get id =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(RolesDtoFieldEnum.id),
        handler,
      );

  // Back relations
  UsersDtoMultirelComparisonBuilder<D> get usersViaRoles =>
      UsersDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(RolesDtoExpandEnum.usersViaRoles),
        handler,
      );
}

class RolesDtoMultirelComparisonBuilder<D extends Dto<D>>
    extends MultirelComparisonBuilder<D, RolesDto> {
  RolesDtoMultirelComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  TerminalMultivalRelationComparisonBuilder<D, String> get name =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(RolesDtoFieldEnum.name_),
        handler,
      );
  PermissionsDtoMultirelComparisonBuilder<D> get permissions =>
      PermissionsDtoMultirelComparisonBuilder(
        fieldPath.extend(RolesDtoFieldEnum.permissions),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get id =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(RolesDtoFieldEnum.id),
        handler,
      );

  // Back relations
  UsersDtoMultirelComparisonBuilder<D> get usersViaRoles =>
      UsersDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(RolesDtoExpandEnum.usersViaRoles),
        handler,
      );
}
