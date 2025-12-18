import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'follows_dto.dart';
import 'follows_dto_filter.dart';
import 'follows_dto_expand.dart';
import 'follows_dto_sort.dart';
import 'follows_dto_field_select.dart';

class FollowsDtoMeta
    extends
        DtoMeta<
          FollowsDto,
          FollowsDtoFilter,
          FollowsDtoExpand<FollowsDto>,
          FollowsDtoSort<FollowsDto>,
          FollowsDtoFieldSelect<FollowsDto>
        > {
  const FollowsDtoMeta();

  @override
  final String collectionName = 'follows';

  @override
  FollowsDto fromRecord(RecordModel model) => FollowsDto.fromRecord(model);

  @override
  FollowsDtoExpand<FollowsDto> expansions() => FollowsDtoExpand();

  @override
  FollowsDtoFieldSelect<FollowsDto> fields() => FollowsDtoFieldSelect();

  @override
  FollowsDtoFilter filter() => FollowsDtoFilter();

  @override
  FollowsDtoSort<FollowsDto> sort() => FollowsDtoSort();
}
