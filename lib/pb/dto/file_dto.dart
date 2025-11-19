import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_dto.freezed.dart';

@freezed
class FileDto with _$FileDto {
  @override
  final String name;

  const FileDto(this.name);

  factory FileDto.fromJson(String json) {
    return FileDto(json);
  }

  String toJson() {
    return name;
  }
}
