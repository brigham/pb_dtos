import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_expand.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'users_dto.dart';
import 'private_profiles_dto.dart';
import 'users_dto_expand.dart';

part 'private_profiles_dto_expand.freezed.dart';
part 'private_profiles_dto_expand.g.dart';

enum PrivateProfilesDtoExpandEnum<V>
    implements
        DtoExpandEnum<PrivateProfilesDto>,
        DtoFilterableField<PrivateProfilesDto, V> {
  user<RelationDto<UsersDto>>("user");

  const PrivateProfilesDtoExpandEnum(this.pbName);

  @override
  final String pbName;
}

class PrivateProfilesDtoExpand<D extends Dto<D>>
    extends DtoExpandBase<D, PrivateProfilesDto> {
  PrivateProfilesDtoExpand() : super.root();

  PrivateProfilesDtoExpand.from(super.delegate);

  void call() {
    finish();
  }

  UsersDtoExpand<PrivateProfilesDto> get user =>
      UsersDtoExpand.from(addRelation(PrivateProfilesDtoFieldEnum.user));
}

@freezed
@JsonSerializable(createToJson: false)
class PrivateProfilesExpandDto with _$PrivateProfilesExpandDto {
  PrivateProfilesExpandDto({this.user});

  @override
  final UsersDto? user;

  factory PrivateProfilesExpandDto.fromJson(Map<String, dynamic> json) =>
      _$PrivateProfilesExpandDtoFromJson(json);
}
