// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_dto_expand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostsExpandDto _$PostsExpandDtoFromJson(Map<String, dynamic> json) =>
    PostsExpandDto(
      poster: json['poster'] == null
          ? null
          : UsersDto.fromJson(json['poster'] as Map<String, dynamic>),
      tagged:
          (json['tagged'] as List<dynamic>?)
              ?.map((e) => UsersDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          null,
    );
