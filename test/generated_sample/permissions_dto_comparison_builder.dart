import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'permissions_dto.dart';
import 'permissions_dto_expand.dart';
import 'roles_dto_comparison_builder.dart';

class PermissionsDtoComparisonBuilder<D extends Dto<D>>
    extends RelationComparisonBuilder<D, PermissionsDto> {
  PermissionsDtoComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  TerminalRelationComparisonBuilder<D, String> get name =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PermissionsDtoFieldEnum.name_),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> get id =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PermissionsDtoFieldEnum.id),
        handler,
      );

  // Back relations
  RolesDtoMultirelComparisonBuilder<D> get rolesViaPermissions =>
      RolesDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(PermissionsDtoExpandEnum.rolesViaPermissions),
        handler,
      );
}

class PermissionsDtoMultirelComparisonBuilder<D extends Dto<D>>
    extends MultirelComparisonBuilder<D, PermissionsDto> {
  PermissionsDtoMultirelComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  TerminalMultivalRelationComparisonBuilder<D, String> get name =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PermissionsDtoFieldEnum.name_),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get id =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PermissionsDtoFieldEnum.id),
        handler,
      );

  // Back relations
  RolesDtoMultirelComparisonBuilder<D> get rolesViaPermissions =>
      RolesDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(PermissionsDtoExpandEnum.rolesViaPermissions),
        handler,
      );
}
