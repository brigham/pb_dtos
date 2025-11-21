// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsDto _$FriendsDtoFromJson(Map<String, dynamic> json) => FriendsDto(
  requester: json['requester'] == null
      ? const RelationDto<UsersDto>("")
      : RelationDto<UsersDto>.fromJson(json['requester'] as String),
  accepter: json['accepter'] == null
      ? const RelationDto<UsersDto>("")
      : RelationDto<UsersDto>.fromJson(json['accepter'] as String),
  state: $enumDecode(_$FriendsStateEnumEnumMap, json['state']),
  id: json['id'] as String? ?? "",
  expand: json['expand'] == null
      ? null
      : FriendsExpandDto.fromJson(json['expand'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FriendsDtoToJson(FriendsDto instance) =>
    <String, dynamic>{
      'requester': instance.requester.toJson(),
      'accepter': instance.accepter.toJson(),
      'state': _$FriendsStateEnumEnumMap[instance.state]!,
      'id': ?Dto.optionalStringToJson(instance.id),
    };

const _$FriendsStateEnumEnumMap = {
  FriendsStateEnum.pending: 'pending',
  FriendsStateEnum.accepted: 'accepted',
  FriendsStateEnum.rejected: 'rejected',
};
