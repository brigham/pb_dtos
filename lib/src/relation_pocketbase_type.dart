import 'package:pocketbase/pocketbase.dart';

import 'collection_schema.dart';
import 'pocket_base_schema.dart';
import 'pocketbase_type_base.dart';
import 'strings.dart';

class RelationPocketbaseType extends PocketbaseTypeBase {
  @override
  String get name => 'relation';

  const RelationPocketbaseType();

  String _typeName(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    var collectionId = field.data['collectionId'];
    var relatedCollection = schema.byId[collectionId];
    if (relatedCollection == null) {
      throw Exception("Could not identify collection with id: $collectionId");
    }
    return "RelationDto<${toClassName(relatedCollection.model.name)}>";
  }

  @override
  Map<String, String> getTypeDefinitions(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    return {};
  }

  @override
  bool deriveRequiredMarker(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    return false; // (field.data['required']);
  }

  @override
  String deriveDartType(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    if ((field.data['maxSelect'] ?? 0) <= 1) {
      if ((field.data['required'] ?? false)) {
        return _typeName(schema, collection, field);
      } else {
        return "${_typeName(schema, collection, field)}?";
      }
    } else {
      return "List<${_typeName(schema, collection, field)}>";
    }
  }

  @override
  String deriveDartDefaultValue(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    if ((field.data['maxSelect'] ?? 0) <= 1) {
      if ((field.data['required'] ?? false)) {
        return 'const ${_typeName(schema, collection, field)}("")';
      } else {
        return "null";
      }
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
