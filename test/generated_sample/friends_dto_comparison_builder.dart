import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'friends_dto.dart';
import 'users_dto_comparison_builder.dart';

class FriendsDtoComparisonBuilder<D extends Dto<D>>
    extends RelationComparisonBuilder<D, FriendsDto> {
  FriendsDtoComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  UsersDtoComparisonBuilder<D> get requester => UsersDtoComparisonBuilder(
    fieldPath.extend(FriendsDtoFieldEnum.requester),
    handler,
  );
  UsersDtoComparisonBuilder<D> get accepter => UsersDtoComparisonBuilder(
    fieldPath.extend(FriendsDtoFieldEnum.accepter),
    handler,
  );
  TerminalRelationComparisonBuilder<D, FriendsStateEnum> get state =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(FriendsDtoFieldEnum.state),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> get id =>
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

  UsersDtoMultirelComparisonBuilder<D> get requester =>
      UsersDtoMultirelComparisonBuilder(
        fieldPath.extend(FriendsDtoFieldEnum.requester),
        handler,
      );
  UsersDtoMultirelComparisonBuilder<D> get accepter =>
      UsersDtoMultirelComparisonBuilder(
        fieldPath.extend(FriendsDtoFieldEnum.accepter),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, FriendsStateEnum> get state =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(FriendsDtoFieldEnum.state),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get id =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(FriendsDtoFieldEnum.id),
        handler,
      );

  // Back relations
}
