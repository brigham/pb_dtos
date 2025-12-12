import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_sort.dart';
import 'posts_dto.dart';
import 'users_dto_sort.dart';

class PostsDtoSort<D extends Dto<D>> extends DtoSort<D, PostsDto> {
  PostsDtoSort() : super.root();

  PostsDtoSort.from(super.delegate);

  UsersDtoSort<PostsDto> poster({bool desc = false}) =>
      UsersDtoSort.from(addRelation(PostsDtoFieldEnum.poster, desc));

  void message({bool desc = false}) =>
      addField(PostsDtoFieldEnum.message, desc);

  void photo({bool desc = false}) => addField(PostsDtoFieldEnum.photo, desc);

  void link({bool desc = false}) => addField(PostsDtoFieldEnum.link, desc);

  void location({bool desc = false}) =>
      addField(PostsDtoFieldEnum.location, desc);

  void reviewStars({bool desc = false}) =>
      addField(PostsDtoFieldEnum.reviewStars, desc);

  UsersDtoSort<PostsDto> tagged({bool desc = false}) =>
      UsersDtoSort.from(addRelation(PostsDtoFieldEnum.tagged, desc));

  void draft({bool desc = false}) => addField(PostsDtoFieldEnum.draft, desc);

  void scheduled({bool desc = false}) =>
      addField(PostsDtoFieldEnum.scheduled, desc);

  void visibility({bool desc = false}) =>
      addField(PostsDtoFieldEnum.visibility, desc);

  void created({bool desc = false}) =>
      addField(PostsDtoFieldEnum.created, desc);

  void metadata({bool desc = false}) =>
      addField(PostsDtoFieldEnum.metadata, desc);

  void id({bool desc = false}) => addField(PostsDtoFieldEnum.id, desc);
}
