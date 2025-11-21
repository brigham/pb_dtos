// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocks_dto_expand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlocksExpandDto _$BlocksExpandDtoFromJson(Map<String, dynamic> json) =>
    BlocksExpandDto(
      blocker: json['blocker'] == null
          ? null
          : UsersDto.fromJson(json['blocker'] as Map<String, dynamic>),
      blocked: json['blocked'] == null
          ? null
          : UsersDto.fromJson(json['blocked'] as Map<String, dynamic>),
    );
