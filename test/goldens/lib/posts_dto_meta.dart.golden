import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'posts_dto.dart';
import 'posts_dto_filter.dart';
import 'posts_dto_expand.dart';
import 'posts_dto_sort.dart';
import 'posts_dto_field_select.dart';

class PostsDtoMeta
    extends
        DtoMeta<
          PostsDto,
          PostsDtoFilter,
          PostsDtoExpand<PostsDto>,
          PostsDtoSort<PostsDto>,
          PostsDtoFieldSelect<PostsDto>
        > {
  const PostsDtoMeta();

  @override
  final String collectionName = 'posts';

  @override
  PostsDto fromRecord(RecordModel model) => PostsDto.fromRecord(model);

  @override
  PostsDtoExpand<PostsDto> expansions() => PostsDtoExpand();

  @override
  PostsDtoFieldSelect<PostsDto> fields() => PostsDtoFieldSelect();

  @override
  PostsDtoFilter filter() => PostsDtoFilter();

  @override
  PostsDtoSort<PostsDto> sort() => PostsDtoSort();
}
