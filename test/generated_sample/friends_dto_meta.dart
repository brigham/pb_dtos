import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'friends_dto.dart';

class FriendsDtoMeta extends DtoMeta<FriendsDto> {
  const FriendsDtoMeta();

  @override
  final String collectionName = 'friends';

  @override
  FriendsDto fromRecord(RecordModel model) => FriendsDto.fromRecord(model);
}
