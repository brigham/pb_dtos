import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_sort.dart';
import 'friends_dto.dart';
import 'users_dto_sort.dart';

class FriendsDtoSort<D extends Dto<D>> extends DtoSort<D, FriendsDto> {
  FriendsDtoSort() : super.root();

  FriendsDtoSort.from(super.delegate);

  UsersDtoSort<FriendsDto> requester({bool desc = false}) =>
      UsersDtoSort.from(addRelation(FriendsDtoFieldEnum.requester, desc));

  UsersDtoSort<FriendsDto> accepter({bool desc = false}) =>
      UsersDtoSort.from(addRelation(FriendsDtoFieldEnum.accepter, desc));

  void state({bool desc = false}) => addField(FriendsDtoFieldEnum.state, desc);

  void id({bool desc = false}) => addField(FriendsDtoFieldEnum.id, desc);
}
