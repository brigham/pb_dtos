import 'package:pb_dtos/pb/dto/dto_filter.dart';
import 'package:pb_dtos/pb/dto/filter_operand.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'friends_dto.dart';
import 'users_dto_comparison_builder.dart';

class FriendsDtoFilter extends DtoFilter<FriendsDto> {
  UsersDtoComparisonBuilder<FriendsDto> requester() =>
      UsersDtoComparisonBuilder(
        SoloFieldPath(FriendsDtoFieldEnum.requester),
        add,
      );
  UsersDtoComparisonBuilder<FriendsDto> accepter() => UsersDtoComparisonBuilder(
    SoloFieldPath(FriendsDtoFieldEnum.accepter),
    add,
  );
  ComparisonBuilder<FriendsDto, FriendsStateEnum> state() =>
      ComparisonBuilder.field(FriendsDtoFieldEnum.state, add);
  ComparisonBuilder<FriendsDto, String> id() =>
      ComparisonBuilder.field(FriendsDtoFieldEnum.id, add);

  // Back relations
}
