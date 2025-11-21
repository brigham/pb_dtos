import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'friends_dto.dart';
import 'users_dto_comparison_builder.dart';

class FriendsDtoComparisonBuilder<D extends Dto<D>>
    extends RelationComparisonBuilder<D, FriendsDto> {
  FriendsDtoComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  UsersDtoComparisonBuilder<D> requester() => UsersDtoComparisonBuilder(
    fieldPath.extend(FriendsDtoFieldEnum.requester),
    handler,
  );
  UsersDtoComparisonBuilder<D> accepter() => UsersDtoComparisonBuilder(
    fieldPath.extend(FriendsDtoFieldEnum.accepter),
    handler,
  );
  TerminalRelationComparisonBuilder<D, FriendsStateEnum> state() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(FriendsDtoFieldEnum.state),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> id() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(FriendsDtoFieldEnum.id),
        handler,
      );

  // Back relations
}

class FriendsDtoMultirelComparisonBuilder<D extends Dto<D>>
    extends MultirelComparisonBuilder<D, FriendsDto> {
  FriendsDtoMultirelComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  UsersDtoMultirelComparisonBuilder<D> requester() =>
      UsersDtoMultirelComparisonBuilder(
        fieldPath.extend(FriendsDtoFieldEnum.requester),
        handler,
      );
  UsersDtoMultirelComparisonBuilder<D> accepter() =>
      UsersDtoMultirelComparisonBuilder(
        fieldPath.extend(FriendsDtoFieldEnum.accepter),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, FriendsStateEnum> state() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(FriendsDtoFieldEnum.state),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> id() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(FriendsDtoFieldEnum.id),
        handler,
      );

  // Back relations
}
