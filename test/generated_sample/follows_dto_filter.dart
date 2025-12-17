import 'package:pb_dtos/pb/dto/dto_filter.dart';
import 'package:pb_dtos/pb/dto/filter_operand.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'follows_dto.dart';
import 'users_dto_comparison_builder.dart';

class FollowsDtoFilter extends DtoFilterBase<FollowsDto, FollowsDtoFilter> {
  @override
  FollowsDtoFilter empty() => FollowsDtoFilter();

  UsersDtoComparisonBuilder<FollowsDto> follower() => UsersDtoComparisonBuilder(
    SoloFieldPath(FollowsDtoFieldEnum.follower),
    add,
  );
  UsersDtoComparisonBuilder<FollowsDto> following() =>
      UsersDtoComparisonBuilder(
        SoloFieldPath(FollowsDtoFieldEnum.following),
        add,
      );
  ComparisonBuilder<FollowsDto, String> id() =>
      ComparisonBuilder.field(FollowsDtoFieldEnum.id, add);

  // Back relations
}
