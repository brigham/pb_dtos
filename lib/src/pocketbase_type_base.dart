import 'package:pocketbase/pocketbase.dart';

import 'collection_schema.dart';
import 'pocket_base_schema.dart';

abstract class PocketbaseTypeBase {
  const PocketbaseTypeBase();

  String get name;

  Map<String, String> getTypeDefinitions(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  );

  bool deriveRequiredMarker(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  );

  String deriveDartType(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  );

  String deriveDartDefaultValue(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  );

  String deriveDartValueForTesting(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  );

  String deriveDartJsonValueForTesting(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  );

  String? deriveToJsonFunction(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  );

  bool isPatchable(
    PocketBaseSchema schema,
    CollectionSchema collectionSchema,
    CollectionField field,
  ) {
    return !(field.data['primaryKey'] ?? false);
  }
}
