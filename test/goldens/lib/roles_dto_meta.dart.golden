import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'roles_dto.dart';
import 'roles_dto_filter.dart';
import 'roles_dto_expand.dart';
import 'roles_dto_sort.dart';
import 'roles_dto_field_select.dart';

class RolesDtoMeta
    extends
        DtoMeta<
          RolesDto,
          RolesDtoFilter,
          RolesDtoExpand<RolesDto>,
          RolesDtoSort<RolesDto>,
          RolesDtoFieldSelect<RolesDto>
        > {
  const RolesDtoMeta();

  @override
  final String collectionName = 'roles';

  @override
  RolesDto fromRecord(RecordModel model) => RolesDto.fromRecord(model);

  @override
  RolesDtoExpand<RolesDto> expansions() => RolesDtoExpand();

  @override
  RolesDtoFieldSelect<RolesDto> fields() => RolesDtoFieldSelect();

  @override
  RolesDtoFilter filter() => RolesDtoFilter();

  @override
  RolesDtoSort<RolesDto> sort() => RolesDtoSort();
}
