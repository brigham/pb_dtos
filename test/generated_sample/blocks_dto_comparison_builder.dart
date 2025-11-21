import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'blocks_dto.dart';
import 'users_dto_comparison_builder.dart';

class BlocksDtoComparisonBuilder<D extends Dto<D>>
    extends RelationComparisonBuilder<D, BlocksDto> {
  BlocksDtoComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  UsersDtoComparisonBuilder<D> blocker() => UsersDtoComparisonBuilder(
    fieldPath.extend(BlocksDtoFieldEnum.blocker),
    handler,
  );
  UsersDtoComparisonBuilder<D> blocked() => UsersDtoComparisonBuilder(
    fieldPath.extend(BlocksDtoFieldEnum.blocked),
    handler,
  );
  TerminalRelationComparisonBuilder<D, BlocksTypeEnum> type() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(BlocksDtoFieldEnum.type),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> id() =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(BlocksDtoFieldEnum.id),
        handler,
      );

  // Back relations
}

class BlocksDtoMultirelComparisonBuilder<D extends Dto<D>>
    extends MultirelComparisonBuilder<D, BlocksDto> {
  BlocksDtoMultirelComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  UsersDtoMultirelComparisonBuilder<D> blocker() =>
      UsersDtoMultirelComparisonBuilder(
        fieldPath.extend(BlocksDtoFieldEnum.blocker),
        handler,
      );
  UsersDtoMultirelComparisonBuilder<D> blocked() =>
      UsersDtoMultirelComparisonBuilder(
        fieldPath.extend(BlocksDtoFieldEnum.blocked),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, BlocksTypeEnum> type() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(BlocksDtoFieldEnum.type),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> id() =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(BlocksDtoFieldEnum.id),
        handler,
      );

  // Back relations
}
