import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'follows_dto.dart';
import 'users_dto_comparison_builder.dart';

class FollowsDtoComparisonBuilder<D extends Dto<D>>
    extends RelationComparisonBuilder<D, FollowsDto> {
  FollowsDtoComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  UsersDtoComparisonBuilder<D> get follower => UsersDtoComparisonBuilder(
    fieldPath.extend(FollowsDtoFieldEnum.follower),
    handler,
  );
  UsersDtoComparisonBuilder<D> get following => UsersDtoComparisonBuilder(
    fieldPath.extend(FollowsDtoFieldEnum.following),
    handler,
  );
  TerminalRelationComparisonBuilder<D, String> get id =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(FollowsDtoFieldEnum.id),
        handler,
      );

  // Back relations
}

class FollowsDtoMultirelComparisonBuilder<D extends Dto<D>>
    extends MultirelComparisonBuilder<D, FollowsDto> {
  FollowsDtoMultirelComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  UsersDtoMultirelComparisonBuilder<D> get follower =>
      UsersDtoMultirelComparisonBuilder(
        fieldPath.extend(FollowsDtoFieldEnum.follower),
        handler,
      );
  UsersDtoMultirelComparisonBuilder<D> get following =>
      UsersDtoMultirelComparisonBuilder(
        fieldPath.extend(FollowsDtoFieldEnum.following),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get id =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(FollowsDtoFieldEnum.id),
        handler,
      );

  // Back relations
}
