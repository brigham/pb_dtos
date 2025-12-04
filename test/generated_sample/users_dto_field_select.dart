import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'users_dto.dart';
import 'roles_dto_field_select.dart';
import 'follows_dto_field_select.dart';
import 'friends_dto_field_select.dart';
import 'blocks_dto_field_select.dart';
import 'posts_dto_field_select.dart';
import 'users_dto_expand.dart';

class UsersDtoFieldSelect<D extends Dto<D>>
    extends DtoRootFieldSelect<UsersDto> {
  UsersDtoFieldSelect() : super.root();

  ModifiableStringField id() {
    $addField(UsersDtoFieldEnum.id);
    return ModifiableStringField($parts, $nextIndex);
  }

  void password() => $addField(UsersDtoFieldEnum.password);

  void email() => $addField(UsersDtoFieldEnum.email);

  void emailVisibility() => $addField(UsersDtoFieldEnum.emailVisibility);

  void verified() => $addField(UsersDtoFieldEnum.verified);

  ModifiableStringField name() {
    $addField(UsersDtoFieldEnum.name_);
    return ModifiableStringField($parts, $nextIndex);
  }

  void avatar() => $addField(UsersDtoFieldEnum.avatar);

  void roles() => $addField(UsersDtoFieldEnum.roles);

  void birthday() => $addField(UsersDtoFieldEnum.birthday);

  void created() => $addField(UsersDtoFieldEnum.created);

  void updated() => $addField(UsersDtoFieldEnum.updated);

  ({
    RolesDtoNestedFieldSelect<UsersDto> Function() roles,

    FollowsDtoNestedFieldSelect<UsersDto> Function() followsViaFollower,
    FollowsDtoNestedFieldSelect<UsersDto> Function() followsViaFollowing,
    FriendsDtoNestedFieldSelect<UsersDto> Function() friendsViaRequester,
    FriendsDtoNestedFieldSelect<UsersDto> Function() friendsViaAccepter,
    BlocksDtoNestedFieldSelect<UsersDto> Function() blocksViaBlocker,
    BlocksDtoNestedFieldSelect<UsersDto> Function() blocksViaBlocked,
    PostsDtoNestedFieldSelect<UsersDto> Function() postsViaPoster,
    PostsDtoNestedFieldSelect<UsersDto> Function() postsViaTagged,
  })
  expand() => (
    roles: () {
      $addRelation(UsersDtoFieldEnum.roles);
      return RolesDtoNestedFieldSelect($parts, $nextIndex);
    },

    followsViaFollower: () {
      $addRelation(UsersDtoExpandEnum.followsViaFollower);
      return FollowsDtoNestedFieldSelect($parts, $nextIndex);
    },
    followsViaFollowing: () {
      $addRelation(UsersDtoExpandEnum.followsViaFollowing);
      return FollowsDtoNestedFieldSelect($parts, $nextIndex);
    },
    friendsViaRequester: () {
      $addRelation(UsersDtoExpandEnum.friendsViaRequester);
      return FriendsDtoNestedFieldSelect($parts, $nextIndex);
    },
    friendsViaAccepter: () {
      $addRelation(UsersDtoExpandEnum.friendsViaAccepter);
      return FriendsDtoNestedFieldSelect($parts, $nextIndex);
    },
    blocksViaBlocker: () {
      $addRelation(UsersDtoExpandEnum.blocksViaBlocker);
      return BlocksDtoNestedFieldSelect($parts, $nextIndex);
    },
    blocksViaBlocked: () {
      $addRelation(UsersDtoExpandEnum.blocksViaBlocked);
      return BlocksDtoNestedFieldSelect($parts, $nextIndex);
    },
    postsViaPoster: () {
      $addRelation(UsersDtoExpandEnum.postsViaPoster);
      return PostsDtoNestedFieldSelect($parts, $nextIndex);
    },
    postsViaTagged: () {
      $addRelation(UsersDtoExpandEnum.postsViaTagged);
      return PostsDtoNestedFieldSelect($parts, $nextIndex);
    },
  );
}

class UsersDtoNestedFieldSelect<D extends Dto<D>>
    extends DtoNestedFieldSelect<D, UsersDto> {
  UsersDtoNestedFieldSelect(super.$parts, super.index);

  void id() => $addField(UsersDtoFieldEnum.id);

  void password() => $addField(UsersDtoFieldEnum.password);

  void email() => $addField(UsersDtoFieldEnum.email);

  void emailVisibility() => $addField(UsersDtoFieldEnum.emailVisibility);

  void verified() => $addField(UsersDtoFieldEnum.verified);

  void name() => $addField(UsersDtoFieldEnum.name_);

  void avatar() => $addField(UsersDtoFieldEnum.avatar);

  RolesDtoNestedFieldSelect<UsersDto> roles() {
    $addRelation(UsersDtoFieldEnum.roles);
    return RolesDtoNestedFieldSelect($parts, $nextIndex);
  }

  void birthday() => $addField(UsersDtoFieldEnum.birthday);

  void created() => $addField(UsersDtoFieldEnum.created);

  void updated() => $addField(UsersDtoFieldEnum.updated);

  FollowsDtoNestedFieldSelect<UsersDto> followsViaFollower() {
    $addRelation(UsersDtoExpandEnum.followsViaFollower);
    return FollowsDtoNestedFieldSelect($parts, $nextIndex);
  }

  FollowsDtoNestedFieldSelect<UsersDto> followsViaFollowing() {
    $addRelation(UsersDtoExpandEnum.followsViaFollowing);
    return FollowsDtoNestedFieldSelect($parts, $nextIndex);
  }

  FriendsDtoNestedFieldSelect<UsersDto> friendsViaRequester() {
    $addRelation(UsersDtoExpandEnum.friendsViaRequester);
    return FriendsDtoNestedFieldSelect($parts, $nextIndex);
  }

  FriendsDtoNestedFieldSelect<UsersDto> friendsViaAccepter() {
    $addRelation(UsersDtoExpandEnum.friendsViaAccepter);
    return FriendsDtoNestedFieldSelect($parts, $nextIndex);
  }

  BlocksDtoNestedFieldSelect<UsersDto> blocksViaBlocker() {
    $addRelation(UsersDtoExpandEnum.blocksViaBlocker);
    return BlocksDtoNestedFieldSelect($parts, $nextIndex);
  }

  BlocksDtoNestedFieldSelect<UsersDto> blocksViaBlocked() {
    $addRelation(UsersDtoExpandEnum.blocksViaBlocked);
    return BlocksDtoNestedFieldSelect($parts, $nextIndex);
  }

  PostsDtoNestedFieldSelect<UsersDto> postsViaPoster() {
    $addRelation(UsersDtoExpandEnum.postsViaPoster);
    return PostsDtoNestedFieldSelect($parts, $nextIndex);
  }

  PostsDtoNestedFieldSelect<UsersDto> postsViaTagged() {
    $addRelation(UsersDtoExpandEnum.postsViaTagged);
    return PostsDtoNestedFieldSelect($parts, $nextIndex);
  }
}
