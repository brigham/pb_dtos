import 'package:pocketbase/pocketbase.dart';

import 'collection_schema.dart';
import 'enum_pocketbase_type.dart';
import 'file_pocketbase_type.dart';
import 'pocket_base_schema.dart';
import 'pocketbase_type.dart';
import 'pocketbase_type_base.dart';
import 'relation_pocketbase_type.dart';

const List<PocketbaseTypeBase> _allTypes = [
  PocketbaseType(
    'text',
    'String',
    '""',
    '"foo bar"',
    toJsonFunction: "Dto.optionalStringToJson",
  ),
  PocketbaseType(
    'email',
    'String',
    '""',
    '"foobar@example.com"',
    toJsonFunction: "Dto.optionalStringToJson",
  ),
  PocketbaseType(
    'password',
    'String',
    '""',
    '"hunter2"',
    toJsonFunction: "Dto.optionalStringToJson",
  ),
  PocketbaseType(
    'bool',
    'bool',
    'false',
    'true',
    toJsonFunction: "Dto.optionalBoolToJson",
  ),
  FilePocketbaseType(),
  EnumPocketbaseType(),
  RelationPocketbaseType(),
  PocketbaseType(
    'autodate',
    'DateTime?',
    'null',
    "DateTime(2023, 1, 1, 12, 12, 12)",
    jsonTestingValue: '"2023-01-01T12:12:12.000"',
    patchable: false,
  ),
  PocketbaseType(
    'date',
    'DateTime?',
    'null',
    "DateTime(2023, 1, 1, 12, 12, 12)",
    jsonTestingValue: '"2023-01-01T12:12:12.000"',
  ),
  PocketbaseType(
    'url',
    'String',
    '""',
    '"https://www.google.com/"',
    toJsonFunction: "Dto.optionalStringToJson",
  ),
  PocketbaseType('json', 'Map<String, dynamic>?', 'null', '{"a": 5}'),
  PocketbaseType(
    'editor',
    'String',
    '""',
    '"<p><b>foo</b> <i>bar</i></p>"',
    toJsonFunction: "Dto.optionalStringToJson",
  ),
  PocketbaseType(
    'geoPoint',
    'GeopointDto',
    'const GeopointDto(lat: 0, lon: 0)',
    'const GeopointDto(lat: 10, lon: 10)',
    jsonTestingValue: '{"lat": 10, "lon": 10}',
  ),
  PocketbaseType(
    'number',
    'num',
    '0',
    '1',
    toJsonFunction: "Dto.optionalNumToJson",
  ),
];

class PocketbaseConverter {
  final PocketBaseSchema schema;
  final Map<String, PocketbaseTypeBase> _typeMap = {};

  PocketbaseConverter(this.schema) {
    for (var type in _allTypes) {
      _typeMap[type.name] = type;
    }
  }

  PocketbaseTypeBase _getType(CollectionField pbField) {
    PocketbaseTypeBase? pbType = _typeMap[pbField.type];
    if (pbType == null) {
      throw Exception('Unknown PocketBase type: ${pbField.type}');
    }
    return pbType;
  }

  String deriveDartType(CollectionSchema collection, CollectionField pbField) =>
      _getType(pbField).deriveDartType(schema, collection, pbField);

  String deriveDefaultValue(
    CollectionSchema collection,
    CollectionField pbField,
  ) => _getType(pbField).deriveDartDefaultValue(schema, collection, pbField);

  String deriveTestingValue(
    CollectionSchema collection,
    CollectionField pbField,
  ) => _getType(pbField).deriveDartValueForTesting(schema, collection, pbField);

  String deriveJsonTestingValue(
    CollectionSchema collection,
    CollectionField pbField,
  ) => _getType(
    pbField,
  ).deriveDartJsonValueForTesting(schema, collection, pbField);

  String deriveTypeDefinitions(
    CollectionSchema collection,
    CollectionField pbField,
  ) => _getType(
    pbField,
  ).getTypeDefinitions(schema, collection, pbField).values.join("\n\n");

  bool deriveRequiredMarker(
    CollectionSchema collectionSchema,
    CollectionField field,
  ) => _getType(field).deriveRequiredMarker(schema, collectionSchema, field);

  String? deriveToJsonFunction(
    CollectionSchema collection,
    CollectionField pbField,
  ) => _getType(pbField).deriveToJsonFunction(schema, collection, pbField);

  bool isPatchable(CollectionSchema collectionSchema, CollectionField field) {
    return _getType(field).isPatchable(schema, collectionSchema, field);
  }
}
