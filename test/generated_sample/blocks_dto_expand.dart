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
    implements DtoExpandEnum<BlocksDto>, DtoTypedField<BlocksDto, V> {
  blocker<RelationDto<UsersDto>>('relation780230353', "blocker"),
  blocked<RelationDto<UsersDto>>('relation3663063936', "blocked");

  const BlocksDtoExpandEnum(this.pbId, this.pbName);

  @override
  final String pbId;

  @override
  final String pbName;

  @override
  DtoFieldSettings? get settings => null;
}

class BlocksDtoExpand<D extends Dto<D>> extends DtoExpand<D, BlocksDto> {
  BlocksDtoExpand() : super.root();

  BlocksDtoExpand.from(super.delegate);

  UsersDtoExpand<BlocksDto> blocker() =>
      UsersDtoExpand.from(addRelation(BlocksDtoFieldEnum.blocker));

  UsersDtoExpand<BlocksDto> blocked() =>
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
