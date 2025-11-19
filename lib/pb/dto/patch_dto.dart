import 'dto.dart';

abstract class PatchDto<D extends Dto<D>> {
  Map<String, dynamic> toJson();
}
