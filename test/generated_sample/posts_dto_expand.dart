import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_expand.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'users_dto.dart';
import 'posts_dto.dart';
import 'users_dto_expand.dart';

part 'posts_dto_expand.freezed.dart';
part 'posts_dto_expand.g.dart';

enum PostsDtoExpandEnum<V>
    implements DtoExpandEnum<PostsDto>, DtoTypedField<PostsDto, V> {
  poster<RelationDto<UsersDto>>('relation762383602', "poster"),
  tagged<RelationDto<UsersDto>>('relation1008703541', "tagged");

  const PostsDtoExpandEnum(this.pbId, this.pbName);

  @override
  final String pbId;

  @override
  final String pbName;

  @override
  DtoFieldSettings? get settings => null;
}

class PostsDtoExpand<D extends Dto<D>> extends DtoExpand<D, PostsDto> {
  PostsDtoExpand() : super.root();

  PostsDtoExpand.from(super.delegate);

  UsersDtoExpand<PostsDto> poster() =>
      UsersDtoExpand.from(addRelation(PostsDtoFieldEnum.poster));

  UsersDtoExpand<PostsDto> tagged() =>
      UsersDtoExpand.from(addRelation(PostsDtoFieldEnum.tagged));
}

@freezed
@JsonSerializable(createToJson: false)
class PostsExpandDto with _$PostsExpandDto {
  PostsExpandDto({this.poster, this.tagged});

  @override
  final UsersDto? poster;
  @override
  final List<UsersDto>? tagged;

  factory PostsExpandDto.fromJson(Map<String, dynamic> json) =>
      _$PostsExpandDtoFromJson(json);
}
