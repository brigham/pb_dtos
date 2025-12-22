import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_sort.dart';
import 'users_dto.dart';
import 'roles_dto_sort.dart';
import 'follows_dto_sort.dart';
import 'friends_dto_sort.dart';
import 'blocks_dto_sort.dart';
import 'posts_dto_sort.dart';
import 'private_profiles_dto_sort.dart';
import 'users_dto_expand.dart';

class UsersDtoSort<D extends Dto<D>> extends DtoSortBase<D, UsersDto> {
  UsersDtoSort() : super.root();

  UsersDtoSort.from(super.delegate);

  void call({bool desc = false}) {
    finish(desc);
  }

  void id({bool desc = false}) => addField(UsersDtoFieldEnum.id, desc);

  void password({bool desc = false}) =>
      addField(UsersDtoFieldEnum.password, desc);

  void email({bool desc = false}) => addField(UsersDtoFieldEnum.email, desc);

  void emailVisibility({bool desc = false}) =>
      addField(UsersDtoFieldEnum.emailVisibility, desc);

  void verified({bool desc = false}) =>
      addField(UsersDtoFieldEnum.verified, desc);

  void name({bool desc = false}) => addField(UsersDtoFieldEnum.name_, desc);

  void avatar({bool desc = false}) => addField(UsersDtoFieldEnum.avatar, desc);

  RolesDtoSort<UsersDto> get roles =>
      RolesDtoSort.from(addRelation(UsersDtoFieldEnum.roles));

  void birthday({bool desc = false}) =>
      addField(UsersDtoFieldEnum.birthday, desc);

  void homepage({bool desc = false}) =>
      addField(UsersDtoFieldEnum.homepage, desc);

  void metadata({bool desc = false}) =>
      addField(UsersDtoFieldEnum.metadata, desc);

  void biography({bool desc = false}) =>
      addField(UsersDtoFieldEnum.biography, desc);

  void hometown({bool desc = false}) =>
      addField(UsersDtoFieldEnum.hometown, desc);

  void zodiac({bool desc = false}) => addField(UsersDtoFieldEnum.zodiac, desc);

  void created({bool desc = false}) =>
      addField(UsersDtoFieldEnum.created, desc);

  void updated({bool desc = false}) =>
      addField(UsersDtoFieldEnum.updated, desc);

  FollowsDtoSort<UsersDto> get followsViaFollower =>
      FollowsDtoSort.from(addRelation(UsersDtoExpandEnum.followsViaFollower));
  FollowsDtoSort<UsersDto> get followsViaFollowing =>
      FollowsDtoSort.from(addRelation(UsersDtoExpandEnum.followsViaFollowing));
  FriendsDtoSort<UsersDto> get friendsViaRequester =>
      FriendsDtoSort.from(addRelation(UsersDtoExpandEnum.friendsViaRequester));
  FriendsDtoSort<UsersDto> get friendsViaAccepter =>
      FriendsDtoSort.from(addRelation(UsersDtoExpandEnum.friendsViaAccepter));
  BlocksDtoSort<UsersDto> get blocksViaBlocker =>
      BlocksDtoSort.from(addRelation(UsersDtoExpandEnum.blocksViaBlocker));
  BlocksDtoSort<UsersDto> get blocksViaBlocked =>
      BlocksDtoSort.from(addRelation(UsersDtoExpandEnum.blocksViaBlocked));
  PostsDtoSort<UsersDto> get postsViaPoster =>
      PostsDtoSort.from(addRelation(UsersDtoExpandEnum.postsViaPoster));
  PostsDtoSort<UsersDto> get postsViaTagged =>
      PostsDtoSort.from(addRelation(UsersDtoExpandEnum.postsViaTagged));
  PrivateProfilesDtoSort<UsersDto> get privateProfilesViaUser =>
      PrivateProfilesDtoSort.from(
        addRelation(UsersDtoExpandEnum.privateProfilesViaUser),
      );
}
