import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/patch_dto.dart';
import 'permissions_dto.dart';

part 'permissions_patch_dto.freezed.dart';
part 'permissions_patch_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class PermissionsPatchDto
    with _$PermissionsPatchDto
    implements PatchDto<PermissionsDto> {
  PermissionsPatchDto({this.name});

  @override
  String? name;

  @override
  Map<String, dynamic> toJson() => _$PermissionsPatchDtoToJson(this);
}
