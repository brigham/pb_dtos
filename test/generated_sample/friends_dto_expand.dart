import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_expand.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'users_dto.dart';
import 'friends_dto.dart';
import 'users_dto_expand.dart';

part 'friends_dto_expand.freezed.dart';
part 'friends_dto_expand.g.dart';

enum FriendsDtoExpandEnum<V>
    implements DtoExpandEnum<FriendsDto>, DtoTypedField<FriendsDto, V> {
  requester<RelationDto<UsersDto>>("requester"),
  accepter<RelationDto<UsersDto>>("accepter");

  const FriendsDtoExpandEnum(this.pbName);

  @override
  final String pbName;

  @override
  DtoFieldSettings? get settings => null;
}

class FriendsDtoExpand<D extends Dto<D>> extends DtoExpandBase<D, FriendsDto> {
  FriendsDtoExpand() : super.root();

  FriendsDtoExpand.from(super.delegate);

  void call() {
    finish();
  }

  UsersDtoExpand<FriendsDto> get requester =>
      UsersDtoExpand.from(addRelation(FriendsDtoFieldEnum.requester));

  UsersDtoExpand<FriendsDto> get accepter =>
      UsersDtoExpand.from(addRelation(FriendsDtoFieldEnum.accepter));
}

@freezed
@JsonSerializable(createToJson: false)
class FriendsExpandDto with _$FriendsExpandDto {
  FriendsExpandDto({this.requester, this.accepter});

  @override
  final UsersDto? requester;
  @override
  final UsersDto? accepter;

  factory FriendsExpandDto.fromJson(Map<String, dynamic> json) =>
      _$FriendsExpandDtoFromJson(json);
}
