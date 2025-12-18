import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'package:pb_dtos/pb/dto/patch_dto.dart';
import 'users_dto.dart';
import 'follows_dto.dart';
import 'package:http/http.dart' as http;

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

  // ignore: unused_element
  factory FollowsPatchDto._fromJson(Map<String, dynamic> json) =>
      _$FollowsPatchDtoFromJson(json);

  @override
  List<Future<http.MultipartFile>> toFiles() => const [];
}
