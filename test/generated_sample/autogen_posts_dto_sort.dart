import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_sort.dart';
import 'autogen_posts_dto.dart';

class AutogenPostsDtoSort<D extends Dto<D>>
    extends DtoSortBase<D, AutogenPostsDto> {
  AutogenPostsDtoSort() : super.root();

  AutogenPostsDtoSort.from(super.delegate);

  void call({bool desc = false}) {
    finish(desc);
  }

  void slug({bool desc = false}) =>
      addField(AutogenPostsDtoFieldEnum.slug, desc);

  void title({bool desc = false}) =>
      addField(AutogenPostsDtoFieldEnum.title, desc);

  void id({bool desc = false}) => addField(AutogenPostsDtoFieldEnum.id, desc);
}
