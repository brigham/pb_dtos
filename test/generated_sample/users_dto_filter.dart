import 'package:pb_dtos/pb/dto/dto_filter.dart';
import 'package:pb_dtos/pb/dto/file_dto.dart';
import 'package:pb_dtos/pb/dto/filter_operand.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'users_dto.dart';
import 'users_dto_expand.dart';
import 'roles_dto_comparison_builder.dart';
import 'follows_dto_comparison_builder.dart';
import 'friends_dto_comparison_builder.dart';
import 'blocks_dto_comparison_builder.dart';
import 'posts_dto_comparison_builder.dart';

class UsersDtoFilter extends DtoFilter<UsersDto> {
  ComparisonBuilder<UsersDto, String> id() =>
      ComparisonBuilder.field(UsersDtoFieldEnum.id, add);
  ComparisonBuilder<UsersDto, String> password() =>
      ComparisonBuilder.field(UsersDtoFieldEnum.password, add);
  ComparisonBuilder<UsersDto, String> email() =>
      ComparisonBuilder.field(UsersDtoFieldEnum.email, add);
  ComparisonBuilder<UsersDto, bool> emailVisibility() =>
      ComparisonBuilder.field(UsersDtoFieldEnum.emailVisibility, add);
  ComparisonBuilder<UsersDto, bool> verified() =>
      ComparisonBuilder.field(UsersDtoFieldEnum.verified, add);
  ComparisonBuilder<UsersDto, String> name() =>
      ComparisonBuilder.field(UsersDtoFieldEnum.name_, add);
  ComparisonBuilder<UsersDto, FileDto> avatar() =>
      ComparisonBuilder.field(UsersDtoFieldEnum.avatar, add);
  RolesDtoMultirelComparisonBuilder<UsersDto> roles() =>
      RolesDtoMultirelComparisonBuilder(
        SoloFieldPath(UsersDtoFieldEnum.roles),
        add,
      );
  ComparisonBuilder<UsersDto, DateTime> birthday() =>
      ComparisonBuilder.field(UsersDtoFieldEnum.birthday, add);
  ComparisonBuilder<UsersDto, DateTime> created() =>
      ComparisonBuilder.field(UsersDtoFieldEnum.created, add);
  ComparisonBuilder<UsersDto, DateTime> updated() =>
      ComparisonBuilder.field(UsersDtoFieldEnum.updated, add);

  // Back relations
  FollowsDtoMultirelComparisonBuilder<UsersDto> followsViaFollower() =>
      FollowsDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.followsViaFollower),
        add,
      );
  FollowsDtoMultirelComparisonBuilder<UsersDto> followsViaFollowing() =>
      FollowsDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.followsViaFollowing),
        add,
      );
  FriendsDtoMultirelComparisonBuilder<UsersDto> friendsViaRequester() =>
      FriendsDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.friendsViaRequester),
        add,
      );
  FriendsDtoMultirelComparisonBuilder<UsersDto> friendsViaAccepter() =>
      FriendsDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.friendsViaAccepter),
        add,
      );
  BlocksDtoMultirelComparisonBuilder<UsersDto> blocksViaBlocker() =>
      BlocksDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.blocksViaBlocker),
        add,
      );
  BlocksDtoMultirelComparisonBuilder<UsersDto> blocksViaBlocked() =>
      BlocksDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.blocksViaBlocked),
        add,
      );
  PostsDtoMultirelComparisonBuilder<UsersDto> postsViaPoster() =>
      PostsDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.postsViaPoster),
        add,
      );
  PostsDtoMultirelComparisonBuilder<UsersDto> postsViaTagged() =>
      PostsDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.postsViaTagged),
        add,
      );
}
