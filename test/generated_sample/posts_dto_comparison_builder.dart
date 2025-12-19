import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/file_dto.dart';
import 'package:pb_dtos/pb/dto/geopoint_dto.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'posts_dto.dart';
import 'users_dto_comparison_builder.dart';

class PostsDtoComparisonBuilder<D extends Dto<D>>
    extends RelationComparisonBuilder<D, PostsDto> {
  PostsDtoComparisonBuilder(super.fieldPath, super.handler) : super.fieldPath();

  UsersDtoComparisonBuilder<D> get poster => UsersDtoComparisonBuilder(
    fieldPath.extend(PostsDtoFieldEnum.poster),
    handler,
  );
  TerminalRelationComparisonBuilder<D, String> get message =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.message),
        handler,
      );
  TerminalRelationComparisonBuilder<D, FileDto> get photo =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.photo),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> get link =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.link),
        handler,
      );
  TerminalRelationComparisonBuilder<D, GeopointDto> get location =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.location),
        handler,
      );
  TerminalRelationComparisonBuilder<D, num> get reviewStars =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.reviewStars),
        handler,
      );
  UsersDtoMultirelComparisonBuilder<D> get tagged =>
      UsersDtoMultirelComparisonBuilder(
        fieldPath.extend(PostsDtoFieldEnum.tagged),
        handler,
      );
  TerminalRelationComparisonBuilder<D, bool> get draft =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.draft),
        handler,
      );
  TerminalRelationComparisonBuilder<D, DateTime> get scheduled =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.scheduled),
        handler,
      );
  TerminalRelationComparisonBuilder<D, PostsVisibilityEnum> get visibility =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.visibility),
        handler,
      );
  TerminalRelationComparisonBuilder<D, DateTime> get created =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.created),
        handler,
      );
  TerminalRelationComparisonBuilder<D, dynamic> get metadata =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.metadata),
        handler,
      );
  TerminalRelationComparisonBuilder<D, String> get id =>
      TerminalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.id),
        handler,
      );

  // Back relations
}

class PostsDtoMultirelComparisonBuilder<D extends Dto<D>>
    extends MultirelComparisonBuilder<D, PostsDto> {
  PostsDtoMultirelComparisonBuilder(super.fieldPath, super.handler)
    : super.fieldPath();

  UsersDtoMultirelComparisonBuilder<D> get poster =>
      UsersDtoMultirelComparisonBuilder(
        fieldPath.extend(PostsDtoFieldEnum.poster),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get message =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.message),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, FileDto> get photo =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.photo),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get link =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.link),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, GeopointDto> get location =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.location),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, num> get reviewStars =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.reviewStars),
        handler,
      );
  UsersDtoMultirelComparisonBuilder<D> get tagged =>
      UsersDtoMultirelComparisonBuilder(
        fieldPath.extend(PostsDtoFieldEnum.tagged),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, bool> get draft =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.draft),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, DateTime> get scheduled =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.scheduled),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, PostsVisibilityEnum>
  get visibility => TerminalMultivalRelationComparisonBuilder(
    fieldPath.terminate(PostsDtoFieldEnum.visibility),
    handler,
  );
  TerminalMultivalRelationComparisonBuilder<D, DateTime> get created =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.created),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, dynamic> get metadata =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.metadata),
        handler,
      );
  TerminalMultivalRelationComparisonBuilder<D, String> get id =>
      TerminalMultivalRelationComparisonBuilder(
        fieldPath.terminate(PostsDtoFieldEnum.id),
        handler,
      );

  // Back relations
}
