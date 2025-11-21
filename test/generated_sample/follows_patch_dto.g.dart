// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follows_patch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowsPatchDto _$FollowsPatchDtoFromJson(Map<String, dynamic> json) =>
    FollowsPatchDto(
      follower: json['follower'] == null
          ? null
          : RelationDto<UsersDto>.fromJson(json['follower'] as String),
      following: json['following'] == null
          ? null
          : RelationDto<UsersDto>.fromJson(json['following'] as String),
    );

Map<String, dynamic> _$FollowsPatchDtoToJson(FollowsPatchDto instance) =>
    <String, dynamic>{
      'follower': ?instance.follower?.toJson(),
      'following': ?instance.following?.toJson(),
    };
