import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'package:pb_dtos/pb/dto/patch_dto.dart';
import 'users_dto.dart';
import 'friends_dto.dart';
import 'package:http/http.dart' as http;

part 'friends_patch_dto.freezed.dart';
part 'friends_patch_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class FriendsPatchDto with _$FriendsPatchDto implements PatchDto<FriendsDto> {
  FriendsPatchDto({this.requester, this.accepter, this.state});

  @override
  RelationDto<UsersDto>? requester;

  @override
  RelationDto<UsersDto>? accepter;

  @override
  FriendsStateEnum? state;

  @override
  Map<String, dynamic> toJson() => _$FriendsPatchDtoToJson(this);

  // ignore: unused_element
  factory FriendsPatchDto._fromJson(Map<String, dynamic> json) =>
      _$FriendsPatchDtoFromJson(json);

  @override
  List<Future<http.MultipartFile>> toFiles() => const [];
}
