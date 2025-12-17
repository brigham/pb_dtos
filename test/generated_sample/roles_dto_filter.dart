import 'package:pb_dtos/pb/dto/dto_filter.dart';
import 'package:pb_dtos/pb/dto/filter_operand.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'roles_dto.dart';
import 'roles_dto_expand.dart';
import 'users_dto_comparison_builder.dart';
import 'permissions_dto_comparison_builder.dart';

class RolesDtoFilter extends DtoFilterBase<RolesDto, RolesDtoFilter> {
  @override
  RolesDtoFilter empty() => RolesDtoFilter();

  ComparisonBuilder<RolesDto, String> name() =>
      ComparisonBuilder.field(RolesDtoFieldEnum.name_, add);
  PermissionsDtoMultirelComparisonBuilder<RolesDto> permissions() =>
      PermissionsDtoMultirelComparisonBuilder(
        SoloFieldPath(RolesDtoFieldEnum.permissions),
        add,
      );
  ComparisonBuilder<RolesDto, String> id() =>
      ComparisonBuilder.field(RolesDtoFieldEnum.id, add);

  // Back relations
  UsersDtoMultirelComparisonBuilder<RolesDto> usersViaRoles() =>
      UsersDtoMultirelComparisonBuilder<RolesDto>(
        SoloFieldPath(RolesDtoExpandEnum.usersViaRoles),
        add,
      );
}
