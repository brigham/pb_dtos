import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/dto.dart';
import 'package:pb_dtos/pb/dto/dto_expand.dart';
import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'users_dto.dart';
import 'follows_dto.dart';
import 'users_dto_expand.dart';

part 'follows_dto_expand.freezed.dart';
part 'follows_dto_expand.g.dart';

enum FollowsDtoExpandEnum<V>
    implements DtoExpandEnum<FollowsDto>, DtoFilterableField<FollowsDto, V> {
  follower<RelationDto<UsersDto>>("follower"),
  following<RelationDto<UsersDto>>("following");

  const FollowsDtoExpandEnum(this.pbName);

  @override
  final String pbName;
}

class FollowsDtoExpand<D extends Dto<D>> extends DtoExpandBase<D, FollowsDto> {
  FollowsDtoExpand() : super.root();

  FollowsDtoExpand.from(super.delegate);

  void call() {
    finish();
  }

  UsersDtoExpand<FollowsDto> get follower =>
      UsersDtoExpand.from(addRelation(FollowsDtoFieldEnum.follower));

  UsersDtoExpand<FollowsDto> get following =>
      UsersDtoExpand.from(addRelation(FollowsDtoFieldEnum.following));
}

@freezed
@JsonSerializable(createToJson: false)
class FollowsExpandDto with _$FollowsExpandDto {
  FollowsExpandDto({this.follower, this.following});

  @override
  final UsersDto? follower;
  @override
  final UsersDto? following;

  factory FollowsExpandDto.fromJson(Map<String, dynamic> json) =>
      _$FollowsExpandDtoFromJson(json);
}
