import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'follows_dto.dart';
import 'users_dto_field_select.dart';

class FollowsDtoFieldSelect<D extends Dto<D>>
    extends DtoFieldSelectBase<FollowsDto> {
  FollowsDtoFieldSelect() : super();

  FollowsDtoFieldSelect.nested(super.$parts, super.$fieldChain)
    : super.nested();

  void follower() => $addField(FollowsDtoFieldEnum.follower);

  void following() => $addField(FollowsDtoFieldEnum.following);

  ModifiableStringField get id => $addModifiableField(FollowsDtoFieldEnum.id);

  FollowsDtoExpandDtoFieldSelect<FollowsDto> get expand =>
      $addExpand<FollowsDto, FollowsDtoExpandDtoFieldSelect<FollowsDto>>(
        FollowsDtoExpandDtoFieldSelect.new,
      );
}

class FollowsDtoExpandDtoFieldSelect<D extends Dto<D>>
    extends DtoFieldSelectBase<FollowsDto> {
  FollowsDtoExpandDtoFieldSelect(super.$parts, super.$fieldChain)
    : super.nested();

  UsersDtoFieldSelect<FollowsDto> get follower =>
      $addRelation(UsersDtoFieldSelect.nested, FollowsDtoFieldEnum.follower);

  UsersDtoFieldSelect<FollowsDto> get following =>
      $addRelation(UsersDtoFieldSelect.nested, FollowsDtoFieldEnum.following);
}
