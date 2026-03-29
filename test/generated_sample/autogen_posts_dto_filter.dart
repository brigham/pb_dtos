import 'package:pb_dtos/pb/dto/dto_filter.dart';
import 'package:pb_dtos/pb/dto/filter_expression.dart';
import 'autogen_posts_dto.dart';

class AutogenPostsDtoFilter
    extends DtoFilterBase<AutogenPostsDto, AutogenPostsDtoFilter> {
  @override
  AutogenPostsDtoFilter empty() => AutogenPostsDtoFilter();

  ComparisonBuilder<AutogenPostsDto, String> get slug =>
      ComparisonBuilder.field(AutogenPostsDtoFieldEnum.slug, add);
  ComparisonBuilder<AutogenPostsDto, String> get title =>
      ComparisonBuilder.field(AutogenPostsDtoFieldEnum.title, add);
  ComparisonBuilder<AutogenPostsDto, String> get id =>
      ComparisonBuilder.field(AutogenPostsDtoFieldEnum.id, add);

  // Back relations
}
