import 'package:pb_dtos/pb/dto/dto_filter.dart';
import 'package:pb_dtos/pb/dto/filter_operand.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'permissions_dto.dart';
import 'permissions_dto_expand.dart';
import 'roles_dto_comparison_builder.dart';

class PermissionsDtoFilter extends DtoFilter<PermissionsDto> {
  ComparisonBuilder<PermissionsDto, String> name() =>
      ComparisonBuilder.field(PermissionsDtoFieldEnum.name_, add);
  ComparisonBuilder<PermissionsDto, String> id() =>
      ComparisonBuilder.field(PermissionsDtoFieldEnum.id, add);

  // Back relations
  RolesDtoMultirelComparisonBuilder<PermissionsDto> rolesViaPermissions() =>
      RolesDtoMultirelComparisonBuilder<PermissionsDto>(
        SoloFieldPath(PermissionsDtoExpandEnum.rolesViaPermissions),
        add,
      );
}
