// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsDto _$PostsDtoFromJson(Map<String, dynamic> json) => PostsDto(
  poster: json['poster'] == null
      ? const RelationDto<UsersDto>("")
      : RelationDto<UsersDto>.fromJson(json['poster'] as String),
  message: json['message'] as String,
  photo: json['photo'] == null
      ? null
      : FileDto.fromJson(json['photo'] as String),
  link: json['link'] as String? ?? "",
  location: json['location'] as Map<String, dynamic>? ?? null,
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
  'location': ?instance.location,
  'review_stars': ?Dto.optionalNumToJson(instance.reviewStars),
  'tagged': instance.tagged.map((e) => e.toJson()).toList(),
  'draft': ?Dto.optionalBoolToJson(instance.draft),
  'scheduled': ?instance.scheduled?.toIso8601String(),
  'id': ?Dto.optionalStringToJson(instance.id),
};
