import 'package:pocketbase/pocketbase.dart';

import 'collection_schema.dart';
import 'pocket_base_schema.dart';
import 'pocketbase_type_base.dart';
import 'strings.dart';

class EnumPocketbaseType extends PocketbaseTypeBase {
  @override
  String get name => 'select';

  const EnumPocketbaseType();

  String _enumName(CollectionSchema collection, CollectionField field) {
    return "${camelize(collection.model.name)}${camelize(field.name)}Enum";
  }

  @override
  Map<String, String> getTypeDefinitions(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    var enumName = _enumName(collection, field);
    List<dynamic> allValues = field.data['values'];
    var enumValues = allValues.map((value) => '$value("$value")').join(", ");
    return {
      enumName:
          "enum $enumName { "
          "$enumValues, \$unset(\"unset\"); final String value; "
          "const $enumName(this.value);"
          "@override String toString() => this.value;  }\n",
    };
  }

  @override
  bool deriveRequiredMarker(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    return (field.data['required'] ?? true);
  }

  @override
  String deriveDartType(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    if (field.data['maxSelect'] == 1) {
      if ((field.data['required'] ?? true)) {
        return _enumName(collection, field);
      } else {
        return "${_enumName(collection, field)}?";
      }
    } else {
      return 'List<${_enumName(collection, field)}>';
    }
  }

  @override
  String deriveDartDefaultValue(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    if (field.data['maxSelect'] == 1) {
      if ((field.data['required'] ?? true)) {
        return "${_enumName(collection, field)}.\$unset";
      } else {
        return "null";
      }
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
      return "${_enumName(collection, field)}.${field.data['values'][0]}";
    } else {
      return '[${_enumName(collection, field)}.${field.data['values'][0]}]';
    }
  }

  @override
  String deriveDartJsonValueForTesting(
    PocketBaseSchema schema,
    CollectionSchema collection,
    CollectionField field,
  ) {
    if (field.data['maxSelect'] == 1) {
      return '"${field.data['values'][0]}"';
    } else {
      return '["${field.data['values'][0]}"]';
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
