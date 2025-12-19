import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_sort.dart';
import 'follows_dto.dart';
import 'users_dto_sort.dart';

class FollowsDtoSort<D extends Dto<D>> extends DtoSortBase<D, FollowsDto> {
  FollowsDtoSort() : super.root();

  FollowsDtoSort.from(super.delegate);

  void call({bool desc = false}) {
    finish(desc);
  }

  UsersDtoSort<FollowsDto> get follower =>
      UsersDtoSort.from(addRelation(FollowsDtoFieldEnum.follower));

  UsersDtoSort<FollowsDto> get following =>
      UsersDtoSort.from(addRelation(FollowsDtoFieldEnum.following));

  void id({bool desc = false}) => addField(FollowsDtoFieldEnum.id, desc);
}
