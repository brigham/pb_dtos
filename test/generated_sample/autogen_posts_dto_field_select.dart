import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'autogen_posts_dto.dart';

class AutogenPostsDtoFieldSelect<D extends Dto<D>>
    extends DtoFieldSelectBase<AutogenPostsDto> {
  AutogenPostsDtoFieldSelect() : super();

  AutogenPostsDtoFieldSelect.nested(super.$parts, super.$fieldChain)
    : super.nested();

  ModifiableStringField get slug =>
      $addModifiableField(AutogenPostsDtoFieldEnum.slug);

  ModifiableStringField get title =>
      $addModifiableField(AutogenPostsDtoFieldEnum.title);

  ModifiableStringField get id =>
      $addModifiableField(AutogenPostsDtoFieldEnum.id);

  AutogenPostsDtoExpandDtoFieldSelect<AutogenPostsDto> get expand =>
      $addExpand<
        AutogenPostsDto,
        AutogenPostsDtoExpandDtoFieldSelect<AutogenPostsDto>
      >(AutogenPostsDtoExpandDtoFieldSelect.new);
}

class AutogenPostsDtoExpandDtoFieldSelect<D extends Dto<D>>
    extends DtoFieldSelectBase<AutogenPostsDto> {
  AutogenPostsDtoExpandDtoFieldSelect(super.$parts, super.$fieldChain)
    : super.nested();
}
