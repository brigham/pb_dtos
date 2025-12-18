import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'permissions_dto.dart';
import 'permissions_dto_filter.dart';
import 'permissions_dto_expand.dart';
import 'permissions_dto_sort.dart';
import 'permissions_dto_field_select.dart';

class PermissionsDtoMeta
    extends
        DtoMeta<
          PermissionsDto,
          PermissionsDtoFilter,
          PermissionsDtoExpand<PermissionsDto>,
          PermissionsDtoSort<PermissionsDto>,
          PermissionsDtoFieldSelect<PermissionsDto>
        > {
  const PermissionsDtoMeta();

  @override
  final String collectionName = 'permissions';

  @override
  PermissionsDto fromRecord(RecordModel model) =>
      PermissionsDto.fromRecord(model);

  @override
  PermissionsDtoExpand<PermissionsDto> expansions() => PermissionsDtoExpand();

  @override
  PermissionsDtoFieldSelect<PermissionsDto> fields() =>
      PermissionsDtoFieldSelect();

  @override
  PermissionsDtoFilter filter() => PermissionsDtoFilter();

  @override
  PermissionsDtoSort<PermissionsDto> sort() => PermissionsDtoSort();
}
