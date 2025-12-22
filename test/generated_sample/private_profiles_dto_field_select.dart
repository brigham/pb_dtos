import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'private_profiles_dto.dart';
import 'users_dto_field_select.dart';

class PrivateProfilesDtoFieldSelect<D extends Dto<D>>
    extends DtoFieldSelectBase<PrivateProfilesDto> {
  PrivateProfilesDtoFieldSelect() : super();

  PrivateProfilesDtoFieldSelect.nested(super.$parts, super.$fieldChain)
    : super.nested();

  ModifiableStringField get id =>
      $addModifiableField(PrivateProfilesDtoFieldEnum.id);

  void user() => $addField(PrivateProfilesDtoFieldEnum.user);

  ModifiableStringField get note =>
      $addModifiableField(PrivateProfilesDtoFieldEnum.note);

  PrivateProfilesDtoExpandDtoFieldSelect<PrivateProfilesDto> get expand =>
      $addExpand<
        PrivateProfilesDto,
        PrivateProfilesDtoExpandDtoFieldSelect<PrivateProfilesDto>
      >(PrivateProfilesDtoExpandDtoFieldSelect.new);
}

class PrivateProfilesDtoExpandDtoFieldSelect<D extends Dto<D>>
    extends DtoFieldSelectBase<PrivateProfilesDto> {
  PrivateProfilesDtoExpandDtoFieldSelect(super.$parts, super.$fieldChain)
    : super.nested();

  UsersDtoFieldSelect<PrivateProfilesDto> get user => $addRelation(
    UsersDtoFieldSelect.nested,
    PrivateProfilesDtoFieldEnum.user,
  );
}
