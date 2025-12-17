import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_sort.dart';
import 'blocks_dto.dart';
import 'users_dto_sort.dart';

class BlocksDtoSort<D extends Dto<D>> extends DtoSortBase<D, BlocksDto> {
  BlocksDtoSort() : super.root();

  BlocksDtoSort.from(super.delegate);

  UsersDtoSort<BlocksDto> blocker({bool desc = false}) =>
      UsersDtoSort.from(addRelation(BlocksDtoFieldEnum.blocker, desc));

  UsersDtoSort<BlocksDto> blocked({bool desc = false}) =>
      UsersDtoSort.from(addRelation(BlocksDtoFieldEnum.blocked, desc));

  void type({bool desc = false}) => addField(BlocksDtoFieldEnum.type, desc);

  void id({bool desc = false}) => addField(BlocksDtoFieldEnum.id, desc);
}
