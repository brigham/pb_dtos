import 'package:pb_dtos/pb/dto/dto_meta.dart';
import 'package:pocketbase/pocketbase.dart';
import 'blocks_dto.dart';

class BlocksDtoMeta extends DtoMeta<BlocksDto> {
  const BlocksDtoMeta();

  @override
  final String collectionName = 'blocks';

  @override
  BlocksDto fromRecord(RecordModel model) => BlocksDto.fromRecord(model);
}
