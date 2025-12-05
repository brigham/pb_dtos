import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_expand.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'users_dto.dart';
import 'roles_dto.dart';
import 'follows_dto.dart';
import 'friends_dto.dart';
import 'blocks_dto.dart';
import 'posts_dto.dart';
import 'roles_dto_expand.dart';
import 'follows_dto_expand.dart';
import 'friends_dto_expand.dart';
import 'blocks_dto_expand.dart';
import 'posts_dto_expand.dart';

part 'users_dto_expand.freezed.dart';
part 'users_dto_expand.g.dart';

enum UsersDtoExpandEnum<V>
    implements DtoExpandEnum<UsersDto>, DtoTypedField<UsersDto, V> {
  roles<RelationDto<RolesDto>>("roles"),
  followsViaFollower<RelationDto<FollowsDto>>("follows_via_follower"),
  followsViaFollowing<RelationDto<FollowsDto>>("follows_via_following"),
  friendsViaRequester<RelationDto<FriendsDto>>("friends_via_requester"),
  friendsViaAccepter<RelationDto<FriendsDto>>("friends_via_accepter"),
  blocksViaBlocker<RelationDto<BlocksDto>>("blocks_via_blocker"),
  blocksViaBlocked<RelationDto<BlocksDto>>("blocks_via_blocked"),
  postsViaPoster<RelationDto<PostsDto>>("posts_via_poster"),
  postsViaTagged<RelationDto<PostsDto>>("posts_via_tagged");

  const UsersDtoExpandEnum(this.pbName);

  @override
  final String pbName;

  @override
  DtoFieldSettings? get settings => null;
}

class UsersDtoExpand<D extends Dto<D>> extends DtoExpand<D, UsersDto> {
  UsersDtoExpand() : super.root();

  UsersDtoExpand.from(super.delegate);

  RolesDtoExpand<UsersDto> roles() =>
      RolesDtoExpand.from(addRelation(UsersDtoFieldEnum.roles));

  FollowsDtoExpand<UsersDto> followsViaFollower() =>
      FollowsDtoExpand.from(addRelation(UsersDtoExpandEnum.followsViaFollower));
  FollowsDtoExpand<UsersDto> followsViaFollowing() => FollowsDtoExpand.from(
    addRelation(UsersDtoExpandEnum.followsViaFollowing),
  );
  FriendsDtoExpand<UsersDto> friendsViaRequester() => FriendsDtoExpand.from(
    addRelation(UsersDtoExpandEnum.friendsViaRequester),
  );
  FriendsDtoExpand<UsersDto> friendsViaAccepter() =>
      FriendsDtoExpand.from(addRelation(UsersDtoExpandEnum.friendsViaAccepter));
  BlocksDtoExpand<UsersDto> blocksViaBlocker() =>
      BlocksDtoExpand.from(addRelation(UsersDtoExpandEnum.blocksViaBlocker));
  BlocksDtoExpand<UsersDto> blocksViaBlocked() =>
      BlocksDtoExpand.from(addRelation(UsersDtoExpandEnum.blocksViaBlocked));
  PostsDtoExpand<UsersDto> postsViaPoster() =>
      PostsDtoExpand.from(addRelation(UsersDtoExpandEnum.postsViaPoster));
  PostsDtoExpand<UsersDto> postsViaTagged() =>
      PostsDtoExpand.from(addRelation(UsersDtoExpandEnum.postsViaTagged));
}

@freezed
@JsonSerializable(createToJson: false)
class UsersExpandDto with _$UsersExpandDto {
  UsersExpandDto({
    this.roles,
    this.followsViaFollower,
    this.followsViaFollowing,
    this.friendsViaRequester,
    this.friendsViaAccepter,
    this.blocksViaBlocker,
    this.blocksViaBlocked,
    this.postsViaPoster,
    this.postsViaTagged,
  });

  @override
  final List<RolesDto>? roles;
  @JsonKey(name: 'follows_via_follower')
  @override
  final List<FollowsDto>? followsViaFollower;
  @JsonKey(name: 'follows_via_following')
  @override
  final List<FollowsDto>? followsViaFollowing;
  @JsonKey(name: 'friends_via_requester')
  @override
  final List<FriendsDto>? friendsViaRequester;
  @JsonKey(name: 'friends_via_accepter')
  @override
  final List<FriendsDto>? friendsViaAccepter;
  @JsonKey(name: 'blocks_via_blocker')
  @override
  final List<BlocksDto>? blocksViaBlocker;
  @JsonKey(name: 'blocks_via_blocked')
  @override
  final List<BlocksDto>? blocksViaBlocked;
  @JsonKey(name: 'posts_via_poster')
  @override
  final List<PostsDto>? postsViaPoster;
  @JsonKey(name: 'posts_via_tagged')
  @override
  final List<PostsDto>? postsViaTagged;

  factory UsersExpandDto.fromJson(Map<String, dynamic> json) =>
      _$UsersExpandDtoFromJson(json);
}
