// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autogen_posts_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutogenPostsDto _$AutogenPostsDtoFromJson(Map<String, dynamic> json) =>
    AutogenPostsDto(
      slug: json['slug'] as String? ?? "",
      title: json['title'] as String? ?? '',
      id: json['id'] as String? ?? "",
    );

Map<String, dynamic> _$AutogenPostsDtoToJson(AutogenPostsDto instance) =>
    <String, dynamic>{
      'slug': ?Dto.optionalStringToJson(instance.slug),
      'title': ?Dto.optionalStringToJson(instance.title),
      'id': ?Dto.optionalStringToJson(instance.id),
    };
