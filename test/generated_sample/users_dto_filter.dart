import 'package:pb_dtos/pb/dto/dto_filter.dart';
import 'package:pb_dtos/pb/dto/file_dto.dart';
import 'package:pb_dtos/pb/dto/geopoint_dto.dart';
import 'package:pb_dtos/pb/dto/filter_operand.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'users_dto.dart';
import 'users_dto_expand.dart';
import 'roles_dto_comparison_builder.dart';
import 'follows_dto_comparison_builder.dart';
import 'friends_dto_comparison_builder.dart';
import 'blocks_dto_comparison_builder.dart';
import 'posts_dto_comparison_builder.dart';
import 'private_profiles_dto_comparison_builder.dart';

class UsersDtoFilter extends DtoFilterBase<UsersDto, UsersDtoFilter> {
  @override
  UsersDtoFilter empty() => UsersDtoFilter();

  ComparisonBuilder<UsersDto, String> get id =>
      ComparisonBuilder.field(UsersDtoFieldEnum.id, add);
  ComparisonBuilder<UsersDto, String> get password =>
      ComparisonBuilder.field(UsersDtoFieldEnum.password, add);
  ComparisonBuilder<UsersDto, String> get email =>
      ComparisonBuilder.field(UsersDtoFieldEnum.email, add);
  ComparisonBuilder<UsersDto, bool> get emailVisibility =>
      ComparisonBuilder.field(UsersDtoFieldEnum.emailVisibility, add);
  ComparisonBuilder<UsersDto, bool> get verified =>
      ComparisonBuilder.field(UsersDtoFieldEnum.verified, add);
  ComparisonBuilder<UsersDto, String> get name =>
      ComparisonBuilder.field(UsersDtoFieldEnum.name_, add);
  ComparisonBuilder<UsersDto, FileDto> get avatar =>
      ComparisonBuilder.field(UsersDtoFieldEnum.avatar, add);
  RolesDtoMultirelComparisonBuilder<UsersDto> get roles =>
      RolesDtoMultirelComparisonBuilder(
        SoloFieldPath(UsersDtoFieldEnum.roles),
        add,
      );
  ComparisonBuilder<UsersDto, DateTime> get birthday =>
      ComparisonBuilder.field(UsersDtoFieldEnum.birthday, add);
  ComparisonBuilder<UsersDto, String> get homepage =>
      ComparisonBuilder.field(UsersDtoFieldEnum.homepage, add);
  ComparisonBuilder<UsersDto, dynamic> get metadata =>
      ComparisonBuilder.field(UsersDtoFieldEnum.metadata, add);
  ComparisonBuilder<UsersDto, dynamic> get biography =>
      ComparisonBuilder.field(UsersDtoFieldEnum.biography, add);
  ComparisonBuilder<UsersDto, GeopointDto> get hometown =>
      ComparisonBuilder.field(UsersDtoFieldEnum.hometown, add);
  ComparisonBuilder<UsersDto, UsersZodiacEnum> get zodiac =>
      ComparisonBuilder.field(UsersDtoFieldEnum.zodiac, add);
  ComparisonBuilder<UsersDto, DateTime> get created =>
      ComparisonBuilder.field(UsersDtoFieldEnum.created, add);
  ComparisonBuilder<UsersDto, DateTime> get updated =>
      ComparisonBuilder.field(UsersDtoFieldEnum.updated, add);

  // Back relations
  FollowsDtoMultirelComparisonBuilder<UsersDto> get followsViaFollower =>
      FollowsDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.followsViaFollower),
        add,
      );
  FollowsDtoMultirelComparisonBuilder<UsersDto> get followsViaFollowing =>
      FollowsDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.followsViaFollowing),
        add,
      );
  FriendsDtoMultirelComparisonBuilder<UsersDto> get friendsViaRequester =>
      FriendsDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.friendsViaRequester),
        add,
      );
  FriendsDtoMultirelComparisonBuilder<UsersDto> get friendsViaAccepter =>
      FriendsDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.friendsViaAccepter),
        add,
      );
  BlocksDtoMultirelComparisonBuilder<UsersDto> get blocksViaBlocker =>
      BlocksDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.blocksViaBlocker),
        add,
      );
  BlocksDtoMultirelComparisonBuilder<UsersDto> get blocksViaBlocked =>
      BlocksDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.blocksViaBlocked),
        add,
      );
  PostsDtoMultirelComparisonBuilder<UsersDto> get postsViaPoster =>
      PostsDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.postsViaPoster),
        add,
      );
  PostsDtoMultirelComparisonBuilder<UsersDto> get postsViaTagged =>
      PostsDtoMultirelComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.postsViaTagged),
        add,
      );
  PrivateProfilesDtoComparisonBuilder<UsersDto> get privateProfilesViaUser =>
      PrivateProfilesDtoComparisonBuilder<UsersDto>(
        SoloFieldPath(UsersDtoExpandEnum.privateProfilesViaUser),
        add,
      );
}
