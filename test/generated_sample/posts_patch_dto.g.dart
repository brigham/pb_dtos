// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_patch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsPatchDto _$PostsPatchDtoFromJson(Map<String, dynamic> json) =>
    PostsPatchDto(
      poster: json['poster'] == null
          ? null
          : RelationDto<UsersDto>.fromJson(json['poster'] as String),
      message: json['message'] as String?,
      photo: json['photo'] == null
          ? null
          : FileDto.fromJson(json['photo'] as String),
      link: json['link'] as String?,
      location: json['location'] == null
          ? null
          : GeopointDto.fromJson(json['location'] as Map<String, dynamic>),
      reviewStars: json['review_stars'] as num?,
      reviewStarsAddend: json['review_stars+'] as num?,
      reviewStarsSubtrahend: json['review_stars-'] as num?,
      tagged: (json['tagged'] as List<dynamic>?)
          ?.map((e) => RelationDto<UsersDto>.fromJson(e as String))
          .toList(),
      taggedRemovals: (json['tagged-'] as List<dynamic>?)
          ?.map((e) => RelationDto<UsersDto>.fromJson(e as String))
          .toList(),
      taggedPrefix: (json['+tagged'] as List<dynamic>?)
          ?.map((e) => RelationDto<UsersDto>.fromJson(e as String))
          .toList(),
      taggedSuffix: (json['tagged+'] as List<dynamic>?)
          ?.map((e) => RelationDto<UsersDto>.fromJson(e as String))
          .toList(),
      draft: json['draft'] as bool?,
      scheduled: json['scheduled'] == null
          ? null
          : DateTime.parse(json['scheduled'] as String),
    );

Map<String, dynamic> _$PostsPatchDtoToJson(PostsPatchDto instance) =>
    <String, dynamic>{
      'poster': ?instance.poster?.toJson(),
      'message': ?instance.message,
      'photo': ?instance.photo?.toJson(),
      'link': ?instance.link,
      'location': ?instance.location?.toJson(),
      'review_stars': ?instance.reviewStars,
      'review_stars+': ?instance.reviewStarsAddend,
      'review_stars-': ?instance.reviewStarsSubtrahend,
      'tagged': ?instance.tagged?.map((e) => e.toJson()).toList(),
      'tagged-': ?instance.taggedRemovals?.map((e) => e.toJson()).toList(),
      '+tagged': ?instance.taggedPrefix?.map((e) => e.toJson()).toList(),
      'tagged+': ?instance.taggedSuffix?.map((e) => e.toJson()).toList(),
      'draft': ?instance.draft,
      'scheduled': ?instance.scheduled?.toIso8601String(),
    };
