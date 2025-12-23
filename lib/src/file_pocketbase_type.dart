import 'package:pocketbase/pocketbase.dart';

import 'collection_schema.dart';
import 'pocket_base_schema.dart';
import 'pocketbase_type_base.dart';

class FilePocketbaseType extends PocketbaseTypeBase {
  @override
  String get name => 'file';

  const FilePocketbaseType();

  @override
  Map<String, String> getTypeDefinitions(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    return {};
  }

  @override
  String deriveDartType(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    if (field.data['maxSelect'] == 1) {
      return 'FileDto?';
    } else {
      return 'List<FileDto>';
    }
  }

  @override
  bool deriveRequiredMarker(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    return false;
  }

  @override
  String deriveDartDefaultValue(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    if (field.data['maxSelect'] == 1) {
      return 'null';
    } else {
      return 'const []';
    }
  }

  @override
  String? deriveToJsonFunction(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    return null;
  }
}
