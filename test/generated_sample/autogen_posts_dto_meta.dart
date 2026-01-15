import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'autogen_posts_dto.dart';
import 'autogen_posts_dto_filter.dart';
import 'package:pb_dtos/pb/dto/dto_expand.dart';
import 'autogen_posts_dto_sort.dart';
import 'autogen_posts_dto_field_select.dart';

class AutogenPostsDtoExpand<D extends Dto<D>>
    extends DtoExpandBase<D, AutogenPostsDto> {
  AutogenPostsDtoExpand() : super.root();
}

class AutogenPostsDtoMeta
    extends
        DtoMeta<
          AutogenPostsDto,
          AutogenPostsDtoFilter,
          AutogenPostsDtoExpand<AutogenPostsDto>,
          AutogenPostsDtoSort<AutogenPostsDto>,
          AutogenPostsDtoFieldSelect<AutogenPostsDto>
        > {
  const AutogenPostsDtoMeta();

  @override
  final String collectionName = 'autogen_posts';

  @override
  AutogenPostsDto fromRecord(RecordModel model) =>
      AutogenPostsDto.fromRecord(model);

  @override
  AutogenPostsDtoExpand<AutogenPostsDto> expansions() =>
      AutogenPostsDtoExpand();

  @override
  AutogenPostsDtoFieldSelect<AutogenPostsDto> fields() =>
      AutogenPostsDtoFieldSelect();

  @override
  AutogenPostsDtoFilter filter() => AutogenPostsDtoFilter();

  @override
  AutogenPostsDtoSort<AutogenPostsDto> sort() => AutogenPostsDtoSort();
}
