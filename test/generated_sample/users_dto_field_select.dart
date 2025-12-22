import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'users_dto.dart';
import 'roles_dto_field_select.dart';
import 'follows_dto_field_select.dart';
import 'friends_dto_field_select.dart';
import 'blocks_dto_field_select.dart';
import 'posts_dto_field_select.dart';
import 'private_profiles_dto_field_select.dart';
import 'users_dto_expand.dart';

class UsersDtoFieldSelect<D extends Dto<D>>
    extends DtoFieldSelectBase<UsersDto> {
  UsersDtoFieldSelect() : super();

  UsersDtoFieldSelect.nested(super.$parts, super.$fieldChain) : super.nested();

  ModifiableStringField get id => $addModifiableField(UsersDtoFieldEnum.id);

  void password() => $addField(UsersDtoFieldEnum.password);

  void email() => $addField(UsersDtoFieldEnum.email);

  void emailVisibility() => $addField(UsersDtoFieldEnum.emailVisibility);

  void verified() => $addField(UsersDtoFieldEnum.verified);

  ModifiableStringField get name =>
      $addModifiableField(UsersDtoFieldEnum.name_);

  void avatar() => $addField(UsersDtoFieldEnum.avatar);

  void roles() => $addField(UsersDtoFieldEnum.roles);

  void birthday() => $addField(UsersDtoFieldEnum.birthday);

  void homepage() => $addField(UsersDtoFieldEnum.homepage);

  void metadata() => $addField(UsersDtoFieldEnum.metadata);

  void biography() => $addField(UsersDtoFieldEnum.biography);

  void hometown() => $addField(UsersDtoFieldEnum.hometown);

  void zodiac() => $addField(UsersDtoFieldEnum.zodiac);

  void created() => $addField(UsersDtoFieldEnum.created);

  void updated() => $addField(UsersDtoFieldEnum.updated);

  UsersDtoExpandDtoFieldSelect<UsersDto> get expand =>
      $addExpand<UsersDto, UsersDtoExpandDtoFieldSelect<UsersDto>>(
        UsersDtoExpandDtoFieldSelect.new,
      );
}

class UsersDtoExpandDtoFieldSelect<D extends Dto<D>>
    extends DtoFieldSelectBase<UsersDto> {
  UsersDtoExpandDtoFieldSelect(super.$parts, super.$fieldChain)
    : super.nested();

  RolesDtoFieldSelect<UsersDto> get roles =>
      $addRelation(RolesDtoFieldSelect.nested, UsersDtoFieldEnum.roles);

  FollowsDtoFieldSelect<UsersDto> get followsViaFollower => $addRelation(
    FollowsDtoFieldSelect.nested,
    UsersDtoExpandEnum.followsViaFollower,
  );
  FollowsDtoFieldSelect<UsersDto> get followsViaFollowing => $addRelation(
    FollowsDtoFieldSelect.nested,
    UsersDtoExpandEnum.followsViaFollowing,
  );
  FriendsDtoFieldSelect<UsersDto> get friendsViaRequester => $addRelation(
    FriendsDtoFieldSelect.nested,
    UsersDtoExpandEnum.friendsViaRequester,
  );
  FriendsDtoFieldSelect<UsersDto> get friendsViaAccepter => $addRelation(
    FriendsDtoFieldSelect.nested,
    UsersDtoExpandEnum.friendsViaAccepter,
  );
  BlocksDtoFieldSelect<UsersDto> get blocksViaBlocker => $addRelation(
    BlocksDtoFieldSelect.nested,
    UsersDtoExpandEnum.blocksViaBlocker,
  );
  BlocksDtoFieldSelect<UsersDto> get blocksViaBlocked => $addRelation(
    BlocksDtoFieldSelect.nested,
    UsersDtoExpandEnum.blocksViaBlocked,
  );
  PostsDtoFieldSelect<UsersDto> get postsViaPoster => $addRelation(
    PostsDtoFieldSelect.nested,
    UsersDtoExpandEnum.postsViaPoster,
  );
  PostsDtoFieldSelect<UsersDto> get postsViaTagged => $addRelation(
    PostsDtoFieldSelect.nested,
    UsersDtoExpandEnum.postsViaTagged,
  );
  PrivateProfilesDtoFieldSelect<UsersDto> get privateProfilesViaUser =>
      $addRelation(
        PrivateProfilesDtoFieldSelect.nested,
        UsersDtoExpandEnum.privateProfilesViaUser,
      );
}
