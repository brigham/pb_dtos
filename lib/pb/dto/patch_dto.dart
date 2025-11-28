import 'package:http/http.dart' as http;

import 'dto.dart';

abstract class PatchDto<D extends Dto<D>> {
  Map<String, dynamic> toJson();

  List<Future<http.MultipartFile>> toFiles();
}
