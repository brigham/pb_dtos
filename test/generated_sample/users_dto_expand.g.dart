// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_dto_expand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersExpandDto _$UsersExpandDtoFromJson(Map<String, dynamic> json) =>
    UsersExpandDto(
      roles:
          (json['roles'] as List<dynamic>?)
              ?.map((e) => RolesDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      followsViaFollower:
          (json['follows_via_follower'] as List<dynamic>?)
              ?.map((e) => FollowsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      followsViaFollowing:
          (json['follows_via_following'] as List<dynamic>?)
              ?.map((e) => FollowsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      friendsViaRequester:
          (json['friends_via_requester'] as List<dynamic>?)
              ?.map((e) => FriendsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      friendsViaAccepter:
          (json['friends_via_accepter'] as List<dynamic>?)
              ?.map((e) => FriendsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      blocksViaBlocker:
          (json['blocks_via_blocker'] as List<dynamic>?)
              ?.map((e) => BlocksDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      blocksViaBlocked:
          (json['blocks_via_blocked'] as List<dynamic>?)
              ?.map((e) => BlocksDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      postsViaPoster:
          (json['posts_via_poster'] as List<dynamic>?)
              ?.map((e) => PostsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      postsViaTagged:
          (json['posts_via_tagged'] as List<dynamic>?)
              ?.map((e) => PostsDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
      privateProfilesViaUser: json['private_profiles_via_user'] == null
          ? null
          : PrivateProfilesDto.fromJson(
              json['private_profiles_via_user'] as Map<String, dynamic>,
            ),
    );
