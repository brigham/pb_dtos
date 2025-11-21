import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'posts_dto.dart';
import 'users_dto_field_select.dart';

class PostsDtoFieldSelect<D extends Dto<D>>
    extends DtoRootFieldSelect<PostsDto> {
  PostsDtoFieldSelect() : super.root();

  void poster() => $addField(PostsDtoFieldEnum.poster);

  ModifiableStringField message() {
    $addField(PostsDtoFieldEnum.message);
    return ModifiableStringField($parts, $nextIndex);
  }

  void photo() => $addField(PostsDtoFieldEnum.photo);

  void link() => $addField(PostsDtoFieldEnum.link);

  void location() => $addField(PostsDtoFieldEnum.location);

  void reviewStars() => $addField(PostsDtoFieldEnum.reviewStars);

  void tagged() => $addField(PostsDtoFieldEnum.tagged);

  void draft() => $addField(PostsDtoFieldEnum.draft);

  void scheduled() => $addField(PostsDtoFieldEnum.scheduled);

  ModifiableStringField id() {
    $addField(PostsDtoFieldEnum.id);
    return ModifiableStringField($parts, $nextIndex);
  }

  ({
    UsersDtoNestedFieldSelect<PostsDto> Function() poster,

    UsersDtoNestedFieldSelect<PostsDto> Function() tagged,
  })
  expand() => (
    poster: () {
      $addRelation(PostsDtoFieldEnum.poster);
      return UsersDtoNestedFieldSelect($parts, $nextIndex);
    },

    tagged: () {
      $addRelation(PostsDtoFieldEnum.tagged);
      return UsersDtoNestedFieldSelect($parts, $nextIndex);
    },
  );
}

class PostsDtoNestedFieldSelect<D extends Dto<D>>
    extends DtoNestedFieldSelect<D, PostsDto> {
  PostsDtoNestedFieldSelect(super.$parts, super.index);

  UsersDtoNestedFieldSelect<PostsDto> poster() {
    $addRelation(PostsDtoFieldEnum.poster);
    return UsersDtoNestedFieldSelect($parts, $nextIndex);
  }

  void message() => $addField(PostsDtoFieldEnum.message);

  void photo() => $addField(PostsDtoFieldEnum.photo);

  void link() => $addField(PostsDtoFieldEnum.link);

  void location() => $addField(PostsDtoFieldEnum.location);

  void reviewStars() => $addField(PostsDtoFieldEnum.reviewStars);

  UsersDtoNestedFieldSelect<PostsDto> tagged() {
    $addRelation(PostsDtoFieldEnum.tagged);
    return UsersDtoNestedFieldSelect($parts, $nextIndex);
  }

  void draft() => $addField(PostsDtoFieldEnum.draft);

  void scheduled() => $addField(PostsDtoFieldEnum.scheduled);

  void id() => $addField(PostsDtoFieldEnum.id);
}
