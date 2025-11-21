import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'roles_dto.dart';

class RolesDtoMeta extends DtoMeta<RolesDto> {
  const RolesDtoMeta();

  @override
  final String collectionName = 'roles';

  @override
  RolesDto fromRecord(RecordModel model) => RolesDto.fromRecord(model);
}
