import 'package:pb_dtos/pb/dto/dto_field.dart';
import 'package:pocketbase/pocketbase.dart';

import 'dto.dart';
import 'dto_expand.dart';
import 'dto_filter.dart';
import 'dto_sort.dart';

abstract class DtoSimpleMeta<D extends Dto<D>> {
  String get collectionName;

  D fromRecord(RecordModel model);
}

abstract class DtoMeta<
  D extends Dto<D>,
  F extends DtoFilter<D>,
  E extends DtoExpand<D>,
  S extends DtoSort<D>,
  F2 extends DtoFieldSelect<D>
>
    implements DtoSimpleMeta<D> {
  const DtoMeta();

  @override
  String get collectionName;

  F filter();

  E expansions();

  S sort();

  F2 fields();

  @override
  D fromRecord(RecordModel model);
}
