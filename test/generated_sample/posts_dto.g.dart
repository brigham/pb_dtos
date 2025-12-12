// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsDto _$PostsDtoFromJson(Map<String, dynamic> json) => PostsDto(
  poster: json['poster'] == null
      ? const RelationDto<UsersDto>("")
      : RelationDto<UsersDto>.fromJson(json['poster'] as String),
  message: json['message'] as String? ?? '',
  photo: json['photo'] == null
      ? null
      : FileDto.fromJson(json['photo'] as String),
  link: json['link'] as String? ?? "",
  location: json['location'] == null
      ? const GeopointDto(lat: 0, lon: 0)
      : GeopointDto.fromJson(json['location'] as Map<String, dynamic>),
  reviewStars: json['review_stars'] as num? ?? 0,
  tagged:
      (json['tagged'] as List<dynamic>?)
          ?.map((e) => RelationDto<UsersDto>.fromJson(e as String))
          .toList() ??
      const [],
  draft: json['draft'] as bool? ?? false,
  scheduled: json['scheduled'] == null
      ? null
      : DateTime.parse(json['scheduled'] as String),
  visibility:
      $enumDecodeNullable(
        _$PostsVisibilityEnumEnumMap,
        json['visibility'],
        unknownValue: PostsVisibilityEnum.$unset,
      ) ??
      null,
  created: json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String),
  metadata: json['metadata'] ?? null,
  id: json['id'] as String? ?? "",
  expand: json['expand'] == null
      ? null
      : PostsExpandDto.fromJson(json['expand'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PostsDtoToJson(PostsDto instance) => <String, dynamic>{
  'poster': instance.poster.toJson(),
  'message': ?Dto.optionalStringToJson(instance.message),
  'photo': ?instance.photo?.toJson(),
  'link': ?Dto.optionalStringToJson(instance.link),
  'location': instance.location.toJson(),
  'review_stars': ?Dto.optionalNumToJson(instance.reviewStars),
  'tagged': instance.tagged.map((e) => e.toJson()).toList(),
  'draft': ?Dto.optionalBoolToJson(instance.draft),
  'scheduled': ?instance.scheduled?.toIso8601String(),
  'visibility': ?_$PostsVisibilityEnumEnumMap[instance.visibility],
  'created': ?instance.created?.toIso8601String(),
  'metadata': ?instance.metadata,
  'id': ?Dto.optionalStringToJson(instance.id),
};

const _$PostsVisibilityEnumEnumMap = {
  PostsVisibilityEnum.public: 'public',
  PostsVisibilityEnum.private: 'private',
  PostsVisibilityEnum.friends: 'friends',
  PostsVisibilityEnum.$unset: r'$unset',
};
