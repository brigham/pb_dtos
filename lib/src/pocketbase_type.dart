import 'package:pocketbase/pocketbase.dart';

import 'collection_schema.dart';
import 'pocket_base_schema.dart';
import 'pocketbase_type_base.dart';

class PocketbaseType extends PocketbaseTypeBase {
  @override
  final String name;
  final String dartType;
  final String defaultValue;
  final String testingValue;
  final String jsonTestingValue;
  final bool checkRequired;
  final String? toJsonFunction;
  final bool patchable;

  const PocketbaseType(
    this.name,
    this.dartType,
    this.defaultValue,
    this.testingValue, {
    String? jsonTestingValue,
    this.checkRequired = true,
    this.toJsonFunction,
    this.patchable = true,
  }) : jsonTestingValue = jsonTestingValue ?? testingValue;

  @override
  Map<String, String> getTypeDefinitions(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) => {};

  @override
  bool deriveRequiredMarker(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    switch ((
      field.data['primaryKey'],
      field.data['required'],
      field.data['hidden'],
    )) {
      case (true, _, _) || (_, _, true):
        return false;
      case (_, true, _):
        return true;
      case _:
        return false;
    }
  }

  @override
  String deriveDartType(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) => dartType;

  @override
  String deriveDartDefaultValue(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) => defaultValue;

  @override
  String? deriveToJsonFunction(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) => toJsonFunction;

  @override
  bool isPatchable(
    PocketBaseSchema schema,
    CollectionSchema collectionSchema,
    CollectionField field,
  ) {
    return patchable && super.isPatchable(schema, collectionSchema, field);
  }
}
