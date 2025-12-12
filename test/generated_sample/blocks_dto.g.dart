// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocks_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlocksDto _$BlocksDtoFromJson(Map<String, dynamic> json) => BlocksDto(
  blocker: json['blocker'] == null
      ? const RelationDto<UsersDto>("")
      : RelationDto<UsersDto>.fromJson(json['blocker'] as String),
  blocked: json['blocked'] == null
      ? const RelationDto<UsersDto>("")
      : RelationDto<UsersDto>.fromJson(json['blocked'] as String),
  type:
      $enumDecodeNullable(
        _$BlocksTypeEnumEnumMap,
        json['type'],
        unknownValue: BlocksTypeEnum.$unset,
      ) ??
      BlocksTypeEnum.$unset,
  id: json['id'] as String? ?? "",
  expand: json['expand'] == null
      ? null
      : BlocksExpandDto.fromJson(json['expand'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BlocksDtoToJson(BlocksDto instance) => <String, dynamic>{
  'blocker': instance.blocker.toJson(),
  'blocked': instance.blocked.toJson(),
  'type': _$BlocksTypeEnumEnumMap[instance.type]!,
  'id': ?Dto.optionalStringToJson(instance.id),
};

const _$BlocksTypeEnumEnumMap = {
  BlocksTypeEnum.mute: 'mute',
  BlocksTypeEnum.block: 'block',
  BlocksTypeEnum.$unset: r'$unset',
};
