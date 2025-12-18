import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'blocks_dto.dart';
import 'blocks_dto_filter.dart';
import 'blocks_dto_expand.dart';
import 'blocks_dto_sort.dart';
import 'blocks_dto_field_select.dart';

class BlocksDtoMeta
    extends
        DtoMeta<
          BlocksDto,
          BlocksDtoFilter,
          BlocksDtoExpand<BlocksDto>,
          BlocksDtoSort<BlocksDto>,
          BlocksDtoFieldSelect<BlocksDto>
        > {
  const BlocksDtoMeta();

  @override
  final String collectionName = 'blocks';

  @override
  BlocksDto fromRecord(RecordModel model) => BlocksDto.fromRecord(model);

  @override
  BlocksDtoExpand<BlocksDto> expansions() => BlocksDtoExpand();

  @override
  BlocksDtoFieldSelect<BlocksDto> fields() => BlocksDtoFieldSelect();

  @override
  BlocksDtoFilter filter() => BlocksDtoFilter();

  @override
  BlocksDtoSort<BlocksDto> sort() => BlocksDtoSort();
}
