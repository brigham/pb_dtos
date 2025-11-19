import 'package:freezed_annotation/freezed_annotation.dart';

import 'dto.dart';

part 'relation_dto.freezed.dart';

@freezed
class RelationDto<O extends Dto<O>> with _$RelationDto<O> {
  @override
  final String id;

  const RelationDto(this.id);

  factory RelationDto.fromJson(String json) {
    return RelationDto(json);
  }

  String? toJson() {
    if (id == "") {
      return null;
    }
    return id;
  }

  @override
  String toString() {
    if (id == "") {
      throw Exception("Missing relation id.");
    }
    return id;
  }
}
