import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/file_dto.dart';
import 'package:pb_dtos/pb/dto/geopoint_dto.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'users_dto.dart';
import 'users_dto_expand.dart';
import 'roles_dto_comparison_builder.dart';
import 'follows_dto_comparison_builder.dart';
import 'friends_dto_comparison_builder.dart';
import 'blocks_dto_comparison_builder.dart';
import 'posts_dto_comparison_builder.dart';
import 'private_profiles_dto_comparison_builder.dart';

class UsersDtoComparisonBuilder<D extends Dto<D>>
    extends RelationComparisonBuilder<D, UsersDto> {
  UsersDtoComparisonBuilder(super.fieldPath, super.handler) : super.fieldPath();

  TerminalRelationComparisonBuilder<D, String> get id =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.id),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> get password =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.password),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> get email =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.email),
        handler,
      );
  TerminalRelationComparisonBuilder<D, bool> get emailVisibility =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.emailVisibility),
        handler,
      );
  TerminalRelationComparisonBuilder<D, bool> get verified =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.verified),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> get name =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.name_),
        handler,
      );
  TerminalRelationComparisonBuilder<D, FileDto> get avatar =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.avatar),
        handler,
      );
  RolesDtoMultirelComparisonBuilder<D> get roles =>
      RolesDtoMultirelComparisonBuilder(
        fieldPath.extend(UsersDtoFieldEnum.roles),
        handler,
      );
  TerminalRelationComparisonBuilder<D, DateTime> get birthday =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.birthday),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> get homepage =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.homepage),
        handler,
      );
  TerminalRelationComparisonBuilder<D, dynamic> get metadata =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.metadata),
        handler,
      );
  TerminalRelationComparisonBuilder<D, dynamic> get biography =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.biography),
        handler,
      );
  TerminalRelationComparisonBuilder<D, GeopointDto> get hometown =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.hometown),
        handler,
      );
  TerminalRelationComparisonBuilder<D, UsersZodiacEnum> get zodiac =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.zodiac),
        handler,
      );
  TerminalRelationComparisonBuilder<D, DateTime> get created =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.created),
        handler,
      );
  TerminalRelationComparisonBuilder<D, DateTime> get updated =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.updated),
        handler,
      );

  // Back relations
  FollowsDtoMultirelComparisonBuilder<D> get followsViaFollower =>
      FollowsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.followsViaFollower),
        handler,
      );
  FollowsDtoMultirelComparisonBuilder<D> get followsViaFollowing =>
      FollowsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.followsViaFollowing),
        handler,
      );
  FriendsDtoMultirelComparisonBuilder<D> get friendsViaRequester =>
      FriendsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.friendsViaRequester),
        handler,
      );
  FriendsDtoMultirelComparisonBuilder<D> get friendsViaAccepter =>
      FriendsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.friendsViaAccepter),
        handler,
      );
  BlocksDtoMultirelComparisonBuilder<D> get blocksViaBlocker =>
      BlocksDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.blocksViaBlocker),
        handler,
      );
  BlocksDtoMultirelComparisonBuilder<D> get blocksViaBlocked =>
      BlocksDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.blocksViaBlocked),
        handler,
      );
  PostsDtoMultirelComparisonBuilder<D> get postsViaPoster =>
      PostsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.postsViaPoster),
        handler,
      );
  PostsDtoMultirelComparisonBuilder<D> get postsViaTagged =>
      PostsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.postsViaTagged),
        handler,
      );
  PrivateProfilesDtoComparisonBuilder<D> get privateProfilesViaUser =>
      PrivateProfilesDtoComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.privateProfilesViaUser),
        handler,
      );
}

class UsersDtoMultirelComparisonBuilder<D extends Dto<D>>
    extends MultirelComparisonBuilder<D, UsersDto> {
  UsersDtoMultirelComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  TerminalMultivalRelationComparisonBuilder<D, String> get id =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.id),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get password =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.password),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get email =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.email),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, bool> get emailVisibility =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.emailVisibility),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, bool> get verified =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.verified),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get name =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.name_),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, FileDto> get avatar =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.avatar),
        handler,
      );
  RolesDtoMultirelComparisonBuilder<D> get roles =>
      RolesDtoMultirelComparisonBuilder(
        fieldPath.extend(UsersDtoFieldEnum.roles),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, DateTime> get birthday =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.birthday),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get homepage =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.homepage),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, dynamic> get metadata =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.metadata),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, dynamic> get biography =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.biography),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, GeopointDto> get hometown =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.hometown),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, UsersZodiacEnum> get zodiac =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.zodiac),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, DateTime> get created =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.created),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, DateTime> get updated =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.updated),
        handler,
      );

  // Back relations
  FollowsDtoMultirelComparisonBuilder<D> get followsViaFollower =>
      FollowsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.followsViaFollower),
        handler,
      );
  FollowsDtoMultirelComparisonBuilder<D> get followsViaFollowing =>
      FollowsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.followsViaFollowing),
        handler,
      );
  FriendsDtoMultirelComparisonBuilder<D> get friendsViaRequester =>
      FriendsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.friendsViaRequester),
        handler,
      );
  FriendsDtoMultirelComparisonBuilder<D> get friendsViaAccepter =>
      FriendsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.friendsViaAccepter),
        handler,
      );
  BlocksDtoMultirelComparisonBuilder<D> get blocksViaBlocker =>
      BlocksDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.blocksViaBlocker),
        handler,
      );
  BlocksDtoMultirelComparisonBuilder<D> get blocksViaBlocked =>
      BlocksDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.blocksViaBlocked),
        handler,
      );
  PostsDtoMultirelComparisonBuilder<D> get postsViaPoster =>
      PostsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.postsViaPoster),
        handler,
      );
  PostsDtoMultirelComparisonBuilder<D> get postsViaTagged =>
      PostsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.postsViaTagged),
        handler,
      );
  PrivateProfilesDtoMultirelComparisonBuilder<D> get privateProfilesViaUser =>
      PrivateProfilesDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.privateProfilesViaUser),
        handler,
      );
}
