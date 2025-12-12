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

class UsersDtoComparisonBuilder<D extends Dto<D>>
    extends RelationComparisonBuilder<D, UsersDto> {
  UsersDtoComparisonBuilder(super.fieldPath, super.handler) : super.fieldPath();

  TerminalRelationComparisonBuilder<D, String> id() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.id),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> password() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.password),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> email() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.email),
        handler,
      );
  TerminalRelationComparisonBuilder<D, bool> emailVisibility() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.emailVisibility),
        handler,
      );
  TerminalRelationComparisonBuilder<D, bool> verified() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.verified),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> name() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.name_),
        handler,
      );
  TerminalRelationComparisonBuilder<D, FileDto> avatar() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.avatar),
        handler,
      );
  RolesDtoMultirelComparisonBuilder<D> roles() =>
      RolesDtoMultirelComparisonBuilder(
        fieldPath.extend(UsersDtoFieldEnum.roles),
        handler,
      );
  TerminalRelationComparisonBuilder<D, DateTime> birthday() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.birthday),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> homepage() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.homepage),
        handler,
      );
  TerminalRelationComparisonBuilder<D, dynamic> metadata() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.metadata),
        handler,
      );
  TerminalRelationComparisonBuilder<D, dynamic> biography() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.biography),
        handler,
      );
  TerminalRelationComparisonBuilder<D, GeopointDto> hometown() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.hometown),
        handler,
      );
  TerminalRelationComparisonBuilder<D, UsersZodiacEnum> zodiac() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.zodiac),
        handler,
      );
  TerminalRelationComparisonBuilder<D, DateTime> created() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.created),
        handler,
      );
  TerminalRelationComparisonBuilder<D, DateTime> updated() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.updated),
        handler,
      );

  // Back relations
  FollowsDtoMultirelComparisonBuilder<D> followsViaFollower() =>
      FollowsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.followsViaFollower),
        handler,
      );
  FollowsDtoMultirelComparisonBuilder<D> followsViaFollowing() =>
      FollowsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.followsViaFollowing),
        handler,
      );
  FriendsDtoMultirelComparisonBuilder<D> friendsViaRequester() =>
      FriendsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.friendsViaRequester),
        handler,
      );
  FriendsDtoMultirelComparisonBuilder<D> friendsViaAccepter() =>
      FriendsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.friendsViaAccepter),
        handler,
      );
  BlocksDtoMultirelComparisonBuilder<D> blocksViaBlocker() =>
      BlocksDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.blocksViaBlocker),
        handler,
      );
  BlocksDtoMultirelComparisonBuilder<D> blocksViaBlocked() =>
      BlocksDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.blocksViaBlocked),
        handler,
      );
  PostsDtoMultirelComparisonBuilder<D> postsViaPoster() =>
      PostsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.postsViaPoster),
        handler,
      );
  PostsDtoMultirelComparisonBuilder<D> postsViaTagged() =>
      PostsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.postsViaTagged),
        handler,
      );
}

class UsersDtoMultirelComparisonBuilder<D extends Dto<D>>
    extends MultirelComparisonBuilder<D, UsersDto> {
  UsersDtoMultirelComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  TerminalMultivalRelationComparisonBuilder<D, String> id() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.id),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> password() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.password),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> email() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.email),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, bool> emailVisibility() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.emailVisibility),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, bool> verified() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.verified),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> name() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.name_),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, FileDto> avatar() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.avatar),
        handler,
      );
  RolesDtoMultirelComparisonBuilder<D> roles() =>
      RolesDtoMultirelComparisonBuilder(
        fieldPath.extend(UsersDtoFieldEnum.roles),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, DateTime> birthday() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.birthday),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> homepage() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.homepage),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, dynamic> metadata() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.metadata),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, dynamic> biography() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.biography),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, GeopointDto> hometown() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.hometown),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, UsersZodiacEnum> zodiac() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.zodiac),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, DateTime> created() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.created),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, DateTime> updated() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(UsersDtoFieldEnum.updated),
        handler,
      );

  // Back relations
  FollowsDtoMultirelComparisonBuilder<D> followsViaFollower() =>
      FollowsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.followsViaFollower),
        handler,
      );
  FollowsDtoMultirelComparisonBuilder<D> followsViaFollowing() =>
      FollowsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.followsViaFollowing),
        handler,
      );
  FriendsDtoMultirelComparisonBuilder<D> friendsViaRequester() =>
      FriendsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.friendsViaRequester),
        handler,
      );
  FriendsDtoMultirelComparisonBuilder<D> friendsViaAccepter() =>
      FriendsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.friendsViaAccepter),
        handler,
      );
  BlocksDtoMultirelComparisonBuilder<D> blocksViaBlocker() =>
      BlocksDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.blocksViaBlocker),
        handler,
      );
  BlocksDtoMultirelComparisonBuilder<D> blocksViaBlocked() =>
      BlocksDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.blocksViaBlocked),
        handler,
      );
  PostsDtoMultirelComparisonBuilder<D> postsViaPoster() =>
      PostsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.postsViaPoster),
        handler,
      );
  PostsDtoMultirelComparisonBuilder<D> postsViaTagged() =>
      PostsDtoMultirelComparisonBuilder<D>(
        fieldPath.extend(UsersDtoExpandEnum.postsViaTagged),
        handler,
      );
}
