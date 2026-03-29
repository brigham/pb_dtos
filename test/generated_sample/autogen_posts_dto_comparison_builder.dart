import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'autogen_posts_dto.dart';

class AutogenPostsDtoComparisonBuilder<D extends Dto<D>>
    extends RelationComparisonBuilder<D, AutogenPostsDto> {
  AutogenPostsDtoComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  TerminalRelationComparisonBuilder<D, String> get slug =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(AutogenPostsDtoFieldEnum.slug),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> get title =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(AutogenPostsDtoFieldEnum.title),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> get id =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(AutogenPostsDtoFieldEnum.id),
        handler,
      );

  // Back relations
}

class AutogenPostsDtoMultirelComparisonBuilder<D extends Dto<D>>
    extends MultirelComparisonBuilder<D, AutogenPostsDto> {
  AutogenPostsDtoMultirelComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  TerminalMultivalRelationComparisonBuilder<D, String> get slug =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(AutogenPostsDtoFieldEnum.slug),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get title =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(AutogenPostsDtoFieldEnum.title),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get id =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(AutogenPostsDtoFieldEnum.id),
        handler,
      );

  // Back relations
}
