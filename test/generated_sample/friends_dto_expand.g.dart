// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_dto_expand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsExpandDto _$FriendsExpandDtoFromJson(Map<String, dynamic> json) =>
    FriendsExpandDto(
      requester: json['requester'] == null
          ? null
          : UsersDto.fromJson(json['requester'] as Map<String, dynamic>),
      accepter: json['accepter'] == null
          ? null
          : UsersDto.fromJson(json['accepter'] as Map<String, dynamic>),
    );
