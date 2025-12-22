import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'private_profiles_dto.dart';
import 'users_dto_comparison_builder.dart';

class PrivateProfilesDtoComparisonBuilder<D extends Dto<D>>
    extends RelationComparisonBuilder<D, PrivateProfilesDto> {
  PrivateProfilesDtoComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  TerminalRelationComparisonBuilder<D, String> get id =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PrivateProfilesDtoFieldEnum.id),
        handler,
      );
  UsersDtoComparisonBuilder<D> get user => UsersDtoComparisonBuilder(
    fieldPath.extend(PrivateProfilesDtoFieldEnum.user),
    handler,
  );
  TerminalRelationComparisonBuilder<D, String> get note =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PrivateProfilesDtoFieldEnum.note),
        handler,
      );

  // Back relations
}

class PrivateProfilesDtoMultirelComparisonBuilder<D extends Dto<D>>
    extends MultirelComparisonBuilder<D, PrivateProfilesDto> {
  PrivateProfilesDtoMultirelComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  TerminalMultivalRelationComparisonBuilder<D, String> get id =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PrivateProfilesDtoFieldEnum.id),
        handler,
      );
  UsersDtoMultirelComparisonBuilder<D> get user =>
      UsersDtoMultirelComparisonBuilder(
        fieldPath.extend(PrivateProfilesDtoFieldEnum.user),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get note =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PrivateProfilesDtoFieldEnum.note),
        handler,
      );

  // Back relations
}
