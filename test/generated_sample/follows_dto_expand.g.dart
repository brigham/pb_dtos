// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follows_dto_expand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowsExpandDto _$FollowsExpandDtoFromJson(Map<String, dynamic> json) =>
    FollowsExpandDto(
      follower: json['follower'] == null
          ? null
          : UsersDto.fromJson(json['follower'] as Map<String, dynamic>),
      following: json['following'] == null
          ? null
          : UsersDto.fromJson(json['following'] as Map<String, dynamic>),
    );
