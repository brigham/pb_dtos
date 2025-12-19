import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'blocks_dto.dart';
import 'users_dto_field_select.dart';

class BlocksDtoFieldSelect<D extends Dto<D>>
    extends DtoFieldSelectBase<BlocksDto> {
  BlocksDtoFieldSelect() : super();

  BlocksDtoFieldSelect.nested(super.$parts, super.$fieldChain) : super.nested();

  void blocker() => $addField(BlocksDtoFieldEnum.blocker);

  void blocked() => $addField(BlocksDtoFieldEnum.blocked);

  void type() => $addField(BlocksDtoFieldEnum.type);

  ModifiableStringField get id => $addModifiableField(BlocksDtoFieldEnum.id);

  BlocksDtoExpandDtoFieldSelect<BlocksDto> get expand =>
      $addExpand<BlocksDto, BlocksDtoExpandDtoFieldSelect<BlocksDto>>(
        BlocksDtoExpandDtoFieldSelect.new,
      );
}

class BlocksDtoExpandDtoFieldSelect<D extends Dto<D>>
    extends DtoFieldSelectBase<BlocksDto> {
  BlocksDtoExpandDtoFieldSelect(super.$parts, super.$fieldChain)
    : super.nested();

  UsersDtoFieldSelect<BlocksDto> get blocker =>
      $addRelation(UsersDtoFieldSelect.nested, BlocksDtoFieldEnum.blocker);

  UsersDtoFieldSelect<BlocksDto> get blocked =>
      $addRelation(UsersDtoFieldSelect.nested, BlocksDtoFieldEnum.blocked);
}
