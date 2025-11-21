import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'users_dto.dart';

class UsersDtoMeta extends DtoMeta<UsersDto> {
  const UsersDtoMeta();

  @override
  final String collectionName = 'users';

  @override
  UsersDto fromRecord(RecordModel model) => UsersDto.fromRecord(model);
}
