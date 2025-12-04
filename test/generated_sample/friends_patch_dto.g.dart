// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_patch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsPatchDto _$FriendsPatchDtoFromJson(Map<String, dynamic> json) =>
    FriendsPatchDto(
      requester: json['requester'] == null
          ? null
          : RelationDto<UsersDto>.fromJson(json['requester'] as String),
      accepter: json['accepter'] == null
          ? null
          : RelationDto<UsersDto>.fromJson(json['accepter'] as String),
      state: $enumDecodeNullable(_$FriendsStateEnumEnumMap, json['state']),
    );

Map<String, dynamic> _$FriendsPatchDtoToJson(FriendsPatchDto instance) =>
    <String, dynamic>{
      'requester': ?instance.requester?.toJson(),
      'accepter': ?instance.accepter?.toJson(),
      'state': ?_$FriendsStateEnumEnumMap[instance.state],
    };

const _$FriendsStateEnumEnumMap = {
  FriendsStateEnum.pending: 'pending',
  FriendsStateEnum.accepted: 'accepted',
  FriendsStateEnum.rejected: 'rejected',
  FriendsStateEnum.$unset: r'$unset',
};
