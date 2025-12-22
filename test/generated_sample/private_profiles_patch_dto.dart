import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'package:pb_dtos/pb/dto/patch_dto.dart';
import 'users_dto.dart';
import 'private_profiles_dto.dart';
import 'package:http/http.dart' as http;

part 'private_profiles_patch_dto.freezed.dart';
part 'private_profiles_patch_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class PrivateProfilesPatchDto
    with _$PrivateProfilesPatchDto
    implements PatchDto<PrivateProfilesDto> {
  PrivateProfilesPatchDto({this.user, this.note});

  @override
  RelationDto<UsersDto>? user;

  @override
  String? note;

  @override
  Map<String, dynamic> toJson() => _$PrivateProfilesPatchDtoToJson(this);

  // ignore: unused_element
  factory PrivateProfilesPatchDto._fromJson(Map<String, dynamic> json) =>
      _$PrivateProfilesPatchDtoFromJson(json);

  @override
  List<Future<http.MultipartFile>> toFiles() => const [];
}
