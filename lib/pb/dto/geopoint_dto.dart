import 'package:freezed_annotation/freezed_annotation.dart';

part 'geopoint_dto.freezed.dart';
part 'geopoint_dto.g.dart';

@freezed
@JsonSerializable()
class GeopointDto with _$GeopointDto {
  const GeopointDto({this.lat = 0, this.lon = 0});

  @override
  final num lat;
  @override
  final num lon;

  factory GeopointDto.fromJson(Map<String, dynamic> json) =>
      _$GeopointDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GeopointDtoToJson(this);
}
