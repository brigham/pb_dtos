import 'package:pocketbase/pocketbase.dart';

import 'index.dart';

class CollectionSchema {
  final CollectionModel model;
  final Set<String> uniqueFields;
  final List<Index> indexes;

  factory CollectionSchema(CollectionModel model) {
    final indexes = model.indexes.map((rawIndex) {
      final index = Index.parse(rawIndex);
      if (index != null) {
        return index;
      } else {
        throw Exception('Invalid index: $rawIndex');
      }
    }).toList();
    final uniqueFields = _findUniqueSingletons(indexes);
    return CollectionSchema._(model, indexes, uniqueFields);
  }

  CollectionSchema._(this.model, this.indexes, this.uniqueFields);

  static Set<String> _findUniqueSingletons(List<Index> indexes) {
    Set<String> uniqueSingletons = {};

    for (var index in indexes) {
      if (index.unique && index.columns.length == 1) {
        uniqueSingletons.add(index.columns[0]);
      }
    }

    return uniqueSingletons;
  }
}
