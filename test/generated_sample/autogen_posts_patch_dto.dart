import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pb_dtos/pb/dto/patch_dto.dart';
import 'autogen_posts_dto.dart';
import 'package:http/http.dart' as http;

part 'autogen_posts_patch_dto.freezed.dart';
part 'autogen_posts_patch_dto.g.dart';

@freezed
@JsonSerializable(explicitToJson: true, includeIfNull: false)
class AutogenPostsPatchDto
    with _$AutogenPostsPatchDto
    implements PatchDto<AutogenPostsDto> {
  AutogenPostsPatchDto({this.slug, this.title});

  @override
  String? slug;

  @override
  String? title;

  @override
  Map<String, dynamic> toJson() => _$AutogenPostsPatchDtoToJson(this);

  // ignore: unused_element
  factory AutogenPostsPatchDto._fromJson(Map<String, dynamic> json) =>
      _$AutogenPostsPatchDtoFromJson(json);

  @override
  List<Future<http.MultipartFile>> toFiles() => const [];
}
