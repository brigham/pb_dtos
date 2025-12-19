import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_sort.dart';
import 'friends_dto.dart';
import 'users_dto_sort.dart';

class FriendsDtoSort<D extends Dto<D>> extends DtoSortBase<D, FriendsDto> {
  FriendsDtoSort() : super.root();

  FriendsDtoSort.from(super.delegate);

  void call({bool desc = false}) {
    finish(desc);
  }

  UsersDtoSort<FriendsDto> get requester =>
      UsersDtoSort.from(addRelation(FriendsDtoFieldEnum.requester));

  UsersDtoSort<FriendsDto> get accepter =>
      UsersDtoSort.from(addRelation(FriendsDtoFieldEnum.accepter));

  void state({bool desc = false}) => addField(FriendsDtoFieldEnum.state, desc);

  void id({bool desc = false}) => addField(FriendsDtoFieldEnum.id, desc);
}
