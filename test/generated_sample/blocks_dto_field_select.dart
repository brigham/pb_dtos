import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'blocks_dto.dart';
import 'users_dto_field_select.dart';

class BlocksDtoFieldSelect<D extends Dto<D>>
    extends DtoRootFieldSelect<BlocksDto> {
  BlocksDtoFieldSelect() : super.root();

  void blocker() => $addField(BlocksDtoFieldEnum.blocker);

  void blocked() => $addField(BlocksDtoFieldEnum.blocked);

  void type() => $addField(BlocksDtoFieldEnum.type);

  ModifiableStringField id() {
    $addField(BlocksDtoFieldEnum.id);
    return ModifiableStringField($parts, $nextIndex);
  }

  ({
    UsersDtoNestedFieldSelect<BlocksDto> Function() blocker,

    UsersDtoNestedFieldSelect<BlocksDto> Function() blocked,
  })
  expand() => (
    blocker: () {
      $addRelation(BlocksDtoFieldEnum.blocker);
      return UsersDtoNestedFieldSelect($parts, $nextIndex);
    },

    blocked: () {
      $addRelation(BlocksDtoFieldEnum.blocked);
      return UsersDtoNestedFieldSelect($parts, $nextIndex);
    },
  );
}

class BlocksDtoNestedFieldSelect<D extends Dto<D>>
    extends DtoNestedFieldSelect<D, BlocksDto> {
  BlocksDtoNestedFieldSelect(super.$parts, super.index);

  UsersDtoNestedFieldSelect<BlocksDto> blocker() {
    $addRelation(BlocksDtoFieldEnum.blocker);
    return UsersDtoNestedFieldSelect($parts, $nextIndex);
  }

  UsersDtoNestedFieldSelect<BlocksDto> blocked() {
    $addRelation(BlocksDtoFieldEnum.blocked);
    return UsersDtoNestedFieldSelect($parts, $nextIndex);
  }

  void type() => $addField(BlocksDtoFieldEnum.type);

  void id() => $addField(BlocksDtoFieldEnum.id);
}
