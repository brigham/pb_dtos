import 'package:pb_dtos/pb/dto/dto_filter.dart';
import 'package:pb_dtos/pb/dto/file_dto.dart';
import 'package:pb_dtos/pb/dto/geopoint_dto.dart';
import 'package:pb_dtos/pb/dto/filter_operand.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'posts_dto.dart';
import 'users_dto_comparison_builder.dart';

class PostsDtoFilter extends DtoFilterBase<PostsDto, PostsDtoFilter> {
  @override
  PostsDtoFilter empty() => PostsDtoFilter();

  UsersDtoComparisonBuilder<PostsDto> get poster =>
      UsersDtoComparisonBuilder(SoloFieldPath(PostsDtoFieldEnum.poster), add);
  ComparisonBuilder<PostsDto, String> get message =>
      ComparisonBuilder.field(PostsDtoFieldEnum.message, add);
  ComparisonBuilder<PostsDto, FileDto> get photo =>
      ComparisonBuilder.field(PostsDtoFieldEnum.photo, add);
  ComparisonBuilder<PostsDto, String> get link =>
      ComparisonBuilder.field(PostsDtoFieldEnum.link, add);
  ComparisonBuilder<PostsDto, GeopointDto> get location =>
      ComparisonBuilder.field(PostsDtoFieldEnum.location, add);
  ComparisonBuilder<PostsDto, num> get reviewStars =>
      ComparisonBuilder.field(PostsDtoFieldEnum.reviewStars, add);
  UsersDtoMultirelComparisonBuilder<PostsDto> get tagged =>
      UsersDtoMultirelComparisonBuilder(
        SoloFieldPath(PostsDtoFieldEnum.tagged),
        add,
      );
  ComparisonBuilder<PostsDto, bool> get draft =>
      ComparisonBuilder.field(PostsDtoFieldEnum.draft, add);
  ComparisonBuilder<PostsDto, DateTime> get scheduled =>
      ComparisonBuilder.field(PostsDtoFieldEnum.scheduled, add);
  ComparisonBuilder<PostsDto, PostsVisibilityEnum> get visibility =>
      ComparisonBuilder.field(PostsDtoFieldEnum.visibility, add);
  ComparisonBuilder<PostsDto, DateTime> get created =>
      ComparisonBuilder.field(PostsDtoFieldEnum.created, add);
  ComparisonBuilder<PostsDto, dynamic> get metadata =>
      ComparisonBuilder.field(PostsDtoFieldEnum.metadata, add);
  ComparisonBuilder<PostsDto, String> get id =>
      ComparisonBuilder.field(PostsDtoFieldEnum.id, add);

  // Back relations
}
