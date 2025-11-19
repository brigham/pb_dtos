import 'package:pocketbase/pocketbase.dart';

import 'dto.dart';

abstract class DtoMeta<D extends Dto<D>> {
  const DtoMeta();

  String get collectionName;

  D fromRecord(RecordModel model);
}
