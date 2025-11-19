import 'patch_dto.dart';
import 'relation_dto.dart';

abstract class Dto<D extends Dto<D>> {
  static String? optionalStringToJson(String value) =>
      value.isEmpty ? null : value;

  static num? optionalNumToJson(num value) => value == 0 ? null : value;

  static bool? optionalBoolToJson(bool value) => !value ? null : value;

  Map<String, dynamic> toJson();

  RelationDto<D> asRelation();

  PatchDto<D> asPatch();

  PatchDto<D> diff(D newValue);

  // TODO: Support autogenerate for text,
}
