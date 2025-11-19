import 'package:pocketbase/pocketbase.dart';

import 'collection_schema.dart';

class BackRelation {
  final CollectionSchema collection;
  final CollectionField field;
  final bool unique;

  BackRelation(this.collection, this.field, this.unique);
}
