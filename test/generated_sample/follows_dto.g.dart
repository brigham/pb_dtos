// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follows_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowsDto _$FollowsDtoFromJson(Map<String, dynamic> json) => FollowsDto(
  follower: json['follower'] == null
      ? const RelationDto<UsersDto>("")
      : RelationDto<UsersDto>.fromJson(json['follower'] as String),
  following: json['following'] == null
      ? const RelationDto<UsersDto>("")
      : RelationDto<UsersDto>.fromJson(json['following'] as String),
  id: json['id'] as String? ?? "",
  expand: json['expand'] == null
      ? null
      : FollowsExpandDto.fromJson(json['expand'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FollowsDtoToJson(FollowsDto instance) =>
    <String, dynamic>{
      'follower': instance.follower.toJson(),
      'following': instance.following.toJson(),
      'id': ?Dto.optionalStringToJson(instance.id),
    };
