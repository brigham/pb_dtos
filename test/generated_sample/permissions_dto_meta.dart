import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'permissions_dto.dart';

class PermissionsDtoMeta extends DtoMeta<PermissionsDto> {
  const PermissionsDtoMeta();

  @override
  final String collectionName = 'permissions';

  @override
  PermissionsDto fromRecord(RecordModel model) =>
      PermissionsDto.fromRecord(model);
}
