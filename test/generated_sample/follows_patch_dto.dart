import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'package:pb_dtos/pb/dto/patch_dto.dart';
import 'users_dto.dart';
import 'follows_dto.dart';

part 'follows_patch_dto.freezed.dart';
part 'follows_patch_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class FollowsPatchDto with _$FollowsPatchDto implements PatchDto<FollowsDto> {
  FollowsPatchDto({this.follower, this.following});

  @override
  RelationDto<UsersDto>? follower;

  @override
  RelationDto<UsersDto>? following;

  @override
  Map<String, dynamic> toJson() => _$FollowsPatchDtoToJson(this);
}
