// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocks_patch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlocksPatchDto _$BlocksPatchDtoFromJson(Map<String, dynamic> json) =>
    BlocksPatchDto(
      blocker: json['blocker'] == null
          ? null
          : RelationDto<UsersDto>.fromJson(json['blocker'] as String),
      blocked: json['blocked'] == null
          ? null
          : RelationDto<UsersDto>.fromJson(json['blocked'] as String),
      type: $enumDecodeNullable(_$BlocksTypeEnumEnumMap, json['type']),
    );

Map<String, dynamic> _$BlocksPatchDtoToJson(BlocksPatchDto instance) =>
    <String, dynamic>{
      'blocker': ?instance.blocker?.toJson(),
      'blocked': ?instance.blocked?.toJson(),
      'type': ?_$BlocksTypeEnumEnumMap[instance.type],
    };

const _$BlocksTypeEnumEnumMap = {
  BlocksTypeEnum.mute: 'mute',
  BlocksTypeEnum.block: 'block',
};
