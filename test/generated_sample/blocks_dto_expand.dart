import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_expand.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'users_dto.dart';
import 'blocks_dto.dart';
import 'users_dto_expand.dart';

part 'blocks_dto_expand.freezed.dart';
part 'blocks_dto_expand.g.dart';

enum BlocksDtoExpandEnum<V>
    implements DtoExpandEnum<BlocksDto>, DtoFilterableField<BlocksDto, V> {
  blocker<RelationDto<UsersDto>>('blocker'),
  blocked<RelationDto<UsersDto>>('blocked');

  const BlocksDtoExpandEnum(this.pbName);

  @override
  final String pbName;
}

class BlocksDtoExpand<D extends Dto<D>> extends DtoExpandBase<D, BlocksDto> {
  BlocksDtoExpand() : super.root();

  BlocksDtoExpand.from(super.delegate);

  void call() {
    finish();
  }

  UsersDtoExpand<BlocksDto> get blocker =>
      UsersDtoExpand.from(addRelation(BlocksDtoFieldEnum.blocker));

  UsersDtoExpand<BlocksDto> get blocked =>
      UsersDtoExpand.from(addRelation(BlocksDtoFieldEnum.blocked));
}

@freezed
@JsonSerializable(createToJson: false)
class BlocksExpandDto with _$BlocksExpandDto {
  BlocksExpandDto({this.blocker, this.blocked});

  @override
  final UsersDto? blocker;
  @override
  final UsersDto? blocked;

  factory BlocksExpandDto.fromJson(Map<String, dynamic> json) =>
      _$BlocksExpandDtoFromJson(json);
}
