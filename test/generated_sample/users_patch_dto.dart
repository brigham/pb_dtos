import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/file_dto.dart';
import 'package:pb_dtos/pb/dto/geopoint_dto.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'package:pb_dtos/pb/dto/patch_dto.dart';
import 'users_dto.dart';
import 'roles_dto.dart';
import 'package:http/http.dart' as http;

part 'users_patch_dto.freezed.dart';
part 'users_patch_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class UsersPatchDto with _$UsersPatchDto implements PatchDto<UsersDto> {
  UsersPatchDto({
    this.password,
    this.email,
    this.emailVisibility,
    this.verified,
    this.name,
    this.avatar,
    this.roles,
    this.rolesRemovals,
    this.rolesPrefix,
    this.rolesSuffix,

    this.birthday,
    this.homepage,
    this.metadata,
    this.biography,
    this.hometown,
    this.zodiac,
  });

  @override
  String? password;

  @override
  String? email;

  @override
  bool? emailVisibility;

  @override
  bool? verified;

  @override
  String? name;

  @override
  FileDto? avatar;

  @override
  List<RelationDto<RolesDto>>? roles;

  @override
  @JsonKey(name: 'roles-')
  List<RelationDto<RolesDto>>? rolesRemovals;

  @override
  @JsonKey(name: '+roles')
  List<RelationDto<RolesDto>>? rolesPrefix;

  @override
  @JsonKey(name: 'roles+')
  List<RelationDto<RolesDto>>? rolesSuffix;

  @override
  DateTime? birthday;

  @override
  String? homepage;

  @override
  dynamic metadata;

  @override
  dynamic biography;

  @override
  GeopointDto? hometown;

  @override
  UsersZodiacEnum? zodiac;

  @override
  Map<String, dynamic> toJson() => _$UsersPatchDtoToJson(this);

  // ignore: unused_element
  factory UsersPatchDto._fromJson(Map<String, dynamic> json) =>
      _$UsersPatchDtoFromJson(json);

  @override
  List<Future<http.MultipartFile>> toFiles() => [
    avatar?.toFile('avatar'),
  ].whereType<Future<http.MultipartFile>>().toList();
}
