import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/relation_dto.dart';
import 'package:pb_dtos/pb/dto/patch_dto.dart';
import 'users_dto.dart';
import 'blocks_dto.dart';
import 'package:http/http.dart' as http;

part 'blocks_patch_dto.freezed.dart';
part 'blocks_patch_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class BlocksPatchDto with _$BlocksPatchDto implements PatchDto<BlocksDto> {
  BlocksPatchDto({this.blocker, this.blocked, this.type});

  @override
  RelationDto<UsersDto>? blocker;

  @override
  RelationDto<UsersDto>? blocked;

  @override
  BlocksTypeEnum? type;

  @override
  Map<String, dynamic> toJson() => _$BlocksPatchDtoToJson(this);

  @override
  List<Future<http.MultipartFile>> toFiles() => const [];
}
