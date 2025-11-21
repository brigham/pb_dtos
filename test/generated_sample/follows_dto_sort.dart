import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_sort.dart';
import 'follows_dto.dart';
import 'users_dto_sort.dart';

class FollowsDtoSort<D extends Dto<D>> extends DtoSort<D, FollowsDto> {
  FollowsDtoSort() : super.root();

  FollowsDtoSort.from(super.delegate);

  UsersDtoSort<FollowsDto> follower({bool desc = false}) =>
      UsersDtoSort.from(addRelation(FollowsDtoFieldEnum.follower, desc));

  UsersDtoSort<FollowsDto> following({bool desc = false}) =>
      UsersDtoSort.from(addRelation(FollowsDtoFieldEnum.following, desc));

  void id({bool desc = false}) => addField(FollowsDtoFieldEnum.id, desc);
}
