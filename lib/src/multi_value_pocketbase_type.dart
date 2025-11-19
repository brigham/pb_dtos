import 'package:pocketbase/pocketbase.dart';

import 'collection_schema.dart';
import 'pocket_base_schema.dart';
import 'pocketbase_type.dart';

class MultiValuePocketbaseType extends PocketbaseType {
  const MultiValuePocketbaseType(
    super.name,
    super.dartType,
    super.defaultValue,
    super.testingValue, {
    super.jsonTestingValue,
  });

  @override
  Map<String, String> getTypeDefinitions(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) => {};

  @override
  String deriveDartType(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    if (field.data['maxSelect'] == 1) {
      return dartType;
    } else {
      return 'List<$dartType>';
    }
  }

  @override
  String deriveDartDefaultValue(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    if (field.data['maxSelect'] == 1) {
      return defaultValue;
    } else {
      return 'const []';
    }
  }

  @override
  String deriveDartValueForTesting(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    if (field.data['maxSelect'] == 1) {
      return testingValue;
    } else {
      return "[$testingValue]";
    }
  }

  @override
  String deriveDartJsonValueForTesting(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    if (field.data['maxSelect'] == 1) {
      return jsonTestingValue;
    } else {
      return "[$jsonTestingValue]";
    }
  }
}
