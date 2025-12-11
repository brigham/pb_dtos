import 'package:pocketbase/src/dtos/collection_field.dart';
import 'package:recase/recase.dart';

import 'back_relation.dart';
import 'collection_schema.dart';
import 'dumper.dart';
import 'literal.dart';
import 'pocket_base_schema.dart';
import 'pocketbase_converter.dart';
import 'strings.dart';

String _toOptionalDate(dynamic obj) {
  switch (obj) {
    case "":
      return "null";
    default:
      return toLiteral(obj);
  }
}

String _toOptionalList(dynamic obj) {
  switch (obj) {
    case null:
      return toLiteral([]);
    default:
      return toLiteral(obj);
  }
}

const Map<String, (String, List<String>)> _fieldTypes = {
  'bool': ('DtoBoolFieldSettings', ['required']),
  'number': ('DtoNumberFieldSettings', ['required', 'min', 'max', 'onlyInt']),
  'text': (
    'DtoTextFieldSettings',
    ['required', 'autogeneratePattern', 'min', 'max', 'pattern'],
  ),
  'password': (
    'DtoPasswordFieldSettings',
    ['required', 'pattern', 'min', 'max'],
  ),
  'email': (
    'DtoEmailFieldSettings',
    ['required', 'exceptDomains', 'onlyDomains'],
  ),
  'url': ('DtoURLFieldSettings', ['required', 'exceptDomains', 'onlyDomains']),
  'editor': ('DtoEditorFieldSettings', ['required', 'maxSize', 'convertURLs']),
  'date': ('DtoDateFieldSettings', ['required', 'min', 'max']),
  'autodate': ('DtoAutodateFieldSettings', ['onCreate', 'onUpdate']),
  'select': ('DtoSelectFieldSettings', ['required', 'values', 'maxSelect']),
  'file': (
    'DtoFileFieldSettings',
    ['required', 'maxSize', 'maxSelect', 'mimeTypes', 'thumbs', 'protected'],
  ),
  'relation': (
    'DtoRelationFieldSettings',
    ['required', 'collectionId', 'cascadeDelete', 'minSelect', 'maxSelect'],
  ),
  'json': ('DtoJSONFieldSettings', ['required', 'maxSize']),
  'geoPoint': ('DtoGeoPointFieldSettings', ['required']),
};

typedef JsonToDartConverter = String Function(dynamic);

const Map<(String, String), JsonToDartConverter> _converterOverrides = {
  ('date', 'min'): _toOptionalDate,
  ('date', 'max'): _toOptionalDate,
  ('email', 'exceptDomains'): _toOptionalList,
  ('email', 'onlyDomains'): _toOptionalList,
  ('url', 'exceptDomains'): _toOptionalList,
  ('url', 'onlyDomains'): _toOptionalList,
  ('file', 'mimeTypes'): _toOptionalList,
  ('file', 'thumbs'): _toOptionalList,
};

String _buildSettings(CollectionField field) {
  StringBuffer buffer = StringBuffer();
  var (className, fieldSettings) = _fieldTypes[field.type] ?? ('', []);
  if (className.isEmpty) {
    return "null";
  }
  buffer.write("const ");
  buffer.write(className);
  buffer.write("(");
  for (var fieldSettingName in fieldSettings) {
    buffer.write(fieldSettingName);
    buffer.write(": ");
    JsonToDartConverter converter =
        _converterOverrides[(field.type, fieldSettingName)] ?? toLiteral;
    buffer.write(converter(field.data[fieldSettingName]));
    buffer.write(", ");
  }
  buffer.write(")");
  return buffer.toString();
}

class DartDtoDumper extends Dumper {
  final PocketbaseConverter _pocketbaseConverter;
  final bool debug;
  final String outputDir;

  DartDtoDumper(
    PocketBaseSchema schema, {
    this.debug = false,
    required this.outputDir,
    super.suffix,
  }) : _pocketbaseConverter = PocketbaseConverter(schema),
       super(schema, [
         config('lib/templates/dto.dart.mustache'),
         config('lib/templates/dto_comparison_builder.dart.mustache'),
         config(
           'lib/templates/dto_expand.dart.mustache',
           (ctx) => ctx['has_relations'],
         ),
         config('lib/templates/dto_field_select.dart.mustache'),
         config('lib/templates/dto_filter.dart.mustache'),
         config('lib/templates/dto_meta.dart.mustache'),
         config('lib/templates/dto_patch.dart.mustache'),
         config('lib/templates/dto_sort.dart.mustache'),
       ]);

  @override
  String? getPath(String templatePath, CollectionSchema collectionSchema) {
    switch (templatePath) {
      case 'lib/templates/dto.dart.mustache':
        return "$outputDir/${collectionSchema.model.name}_dto.dart";
      case 'lib/templates/dto_patch.dart.mustache':
        return "$outputDir/${collectionSchema.model.name}_patch_dto.dart";
      case 'lib/templates/dto_sort.dart.mustache':
        return "$outputDir/${collectionSchema.model.name}_dto_sort.dart";
      case 'lib/templates/dto_meta.dart.mustache':
        return "$outputDir/${collectionSchema.model.name}_dto_meta.dart";
      case 'lib/templates/dto_field_select.dart.mustache':
        return "$outputDir/${collectionSchema.model.name}_dto_field_select.dart";
      case 'lib/templates/dto_filter.dart.mustache':
        return "$outputDir/${collectionSchema.model.name}_dto_filter.dart";
      case 'lib/templates/dto_comparison_builder.dart.mustache':
        return "$outputDir/${collectionSchema.model.name}_dto_comparison_builder.dart";
      case 'lib/templates/dto_expand.dart.mustache':
        return "$outputDir/${collectionSchema.model.name}_dto_expand.dart";
      default:
        return null;
    }
  }

  @override
  Map<String, dynamic> createContext(CollectionSchema collectionSchema) {
    var collection = collectionSchema.model;
    var className = toClassName(collection.name);

    var relations = _findFieldsOfType(collectionSchema, 'relation').toList();
    var backRelations = _findBackRelations(collectionSchema).toList();
    var hasRelations = relations.isNotEmpty || backRelations.isNotEmpty;

    var fileFields = _findFieldsOfType(collectionSchema, 'file').toList();
    var hasFiles = fileFields.isNotEmpty;

    var expandDtoClassName = toClassName(collection.name, "Expand");
    var dtoExpandClassName = "${className}Expand";
    var patchClassName = toClassName(collection.name, "Patch");
    final fieldsByName = Map.fromEntries(
      collection.fields.map((f) => MapEntry(f.name, f)),
    );

    return {
      'collection': {'name': collection.name},
      'is_auth': collection.type == 'auth',
      'class_name': className,
      'expand_dto_class_name': expandDtoClassName,
      'dto_expand_class_name': dtoExpandClassName,
      'patch_class_name': patchClassName,
      'has_relations': hasRelations,
      'imports': schema.collections
          .map((c) => {'import': c.model.name})
          .toList(),
      'expand_imports': schema.collections
          .where(
            (coll) =>
                _findFieldsOfType(coll, 'relation').isNotEmpty ||
                _findBackRelations(coll).isNotEmpty,
          )
          .map((c) => {'import': c.model.name})
          .toList(),
      'type_definitions': collection.fields
          .map((field) {
            return {
              'type_definition': _pocketbaseConverter.deriveTypeDefinitions(
                collectionSchema,
                field,
              ),
            };
          })
          .where((m) => m['type_definition']!.isNotEmpty)
          .toList(),
      'fields': collection.fields
          .where((field) => _isVisible(field))
          .indexed
          .map((idxAndField) {
            var (idx, field) = idxAndField;
            var camelized = lowerCamelize(field.name);
            var enumName =
                {
                  'pbId',
                  'pbName',
                  'name',
                  'index',
                  'hashCode',
                  'values',
                }.contains(camelized)
                ? '${camelized}_'
                : camelized;
            var markRequired = _pocketbaseConverter.deriveRequiredMarker(
              collectionSchema,
              field,
            );
            var defaultValueForJson = markRequired
                ? _pocketbaseConverter.deriveDefaultValue(
                    collectionSchema,
                    field,
                  )
                : null;
            var toJsonFunction = _pocketbaseConverter.deriveToJsonFunction(
              collectionSchema,
              field,
            );
            var dartType = _pocketbaseConverter.deriveDartType(
              collectionSchema,
              field,
            );
            var dartPatchType = dartType.endsWith("?")
                ? dartType
                : "$dartType?";
            var filterFieldType = dartType.endsWith("?")
                ? dartType.replaceAll("?", "")
                : dartType;
            filterFieldType = filterFieldType.replaceAllMapped(
              RegExp(r"List<([^>]*)>"),
              (match) => "${match.group(1)}",
            );
            var relationClassName = field.data['type'] == 'relation'
                ? toClassName(
                    schema.byId[field.data['collectionId']]!.model.name,
                  )
                : null;
            String filterComparisonBuilder = "";
            bool hasMulti = (field.data['maxSelect'] ?? 1) > 1;
            switch ((relationClassName != null, hasMulti)) {
              case (true, true):
                filterComparisonBuilder =
                    '${relationClassName}MultirelComparisonBuilder';
              case (true, false):
                filterComparisonBuilder =
                    '${relationClassName}ComparisonBuilder';
              case (false, true):
                filterComparisonBuilder = 'MultipleFieldComparisonBuilder';
              case (false, false):
                filterComparisonBuilder = 'ComparisonBuilder';
            }
            return {
              'name': field.name,
              'index': idx,
              'snake_name': camelized,
              'enum_name': enumName,
              'enum_settings': _buildSettings(field),
              'has_json_key':
                  camelized != field.name ||
                  toJsonFunction != null ||
                  defaultValueForJson != null,
              'json_key_name': camelized != field.name ? field.name : null,
              'json_default_value': defaultValueForJson,
              'to_json_function': toJsonFunction,
              'maybe_required': markRequired ? "required " : "",
              'type': dartType,
              'patch_type': dartPatchType,
              'filter_type': filterFieldType,
              'default_value': !markRequired
                  ? _pocketbaseConverter.deriveDefaultValue(
                      collectionSchema,
                      field,
                    )
                  : null,
              'is_patchable': _pocketbaseConverter.isPatchable(
                collectionSchema,
                field,
              ),
              'has_multi': hasMulti,
              'is_num': (field.data['type'] == 'number'),
              'f_comparison_builder': filterComparisonBuilder,
              'is_relation': relationClassName != null,
              'relation_class_name': relationClassName,
              'cb_comparison_builder': (field.data['type'] == 'relation')
                  ? (hasMulti
                        ? '${relationClassName}MultirelComparisonBuilder'
                        : '${relationClassName}ComparisonBuilder')
                  : 'TerminalRelationComparisonBuilder',
              'mr_cb_comparison_builder': (field.data['type'] == 'relation')
                  ? ('${relationClassName}MultirelComparisonBuilder')
                  : 'TerminalMultivalRelationComparisonBuilder',
              'is_field_modifiable': const {
                'text',
                'editor',
              }.contains(field.type),
            };
          })
          .toList(),
      'fields_length': collection.fields.length,
      'relations': relations.map((field) {
        var collectionId = field.data['collectionId'];
        var relatedCollection = schema.byId[collectionId];
        if (relatedCollection == null) {
          throw Exception(
            "Could not identify collection with id: $collectionId",
          );
        }
        var relatedClassName = toClassName(relatedCollection.model.name);
        var snaked = lowerCamelize(field.name);

        var type = "";
        if (field.data['maxSelect'] == 1) {
          type = relatedClassName;
        } else {
          type = "List<$relatedClassName>";
        }

        return {
          'name': field.name,
          'snake_name': snaked,
          'has_json_key': snaked != field.name,
          'type': type,
          'solo_type': relatedClassName,
        };
      }).toList(),
      'back_relations': backRelations.map((field) {
        var relatedClassName = toClassName(field.collection.model.name);
        var name = '${field.collection.model.name}_via_${field.field.name}';
        var snaked = lowerCamelize(name);
        var type = field.unique ? relatedClassName : "List<$relatedClassName>";
        var multirelFilterType = "${relatedClassName}MultirelComparisonBuilder";
        var filterType = field.unique
            ? "${relatedClassName}ComparisonBuilder"
            : multirelFilterType;

        return {
          'name': name,
          'snake_name': snaked,
          'has_json_key': snaked != name,
          'type': type,
          'solo_type': relatedClassName,
          'filter_type': filterType,
          'mr_filter_type': multirelFilterType,
        };
      }).toList(),
      'indexes': collectionSchema.indexes
          .where(
            (index) => !index.columns.any((col) => fieldsByName[col]!.hidden),
          )
          .map((index) {
            final parameters = index.columns.map((col) {
              final field = fieldsByName[col]!;
              final dartType = _pocketbaseConverter
                  .deriveDartType(collectionSchema, field)
                  .replaceFirst('?', '');
              final snakeName = col.camelCase;
              return <String, dynamic>{'type': dartType, 'name': snakeName};
            }).toList();

            final expressions = <Map<String, String>>[];
            if (parameters.isNotEmpty) {
              expressions.add({
                'code':
                    'f.${parameters[0]['name']}().equal(.val(${parameters[0]['name']}))',
              });
              for (var i = 1; i < parameters.length; i++) {
                final p = parameters[i];
                expressions.add({
                  'code':
                      "if (${p['name']} != null) f.${p['name']}().equal(.val(${p['name']}))",
                });
              }
            }

            final sortExpressions = parameters
                .map((p) => ({'code': 's.${p['name']}()'}))
                .toList();

            for (var i = 0; i < parameters.length; i++) {
              if (i > 0) {
                parameters[i]['type'] = '${parameters[i]['type']}?';
                parameters[i]['is_optional'] = true;
              } else {
                parameters[i]['is_optional'] = false;
              }
              parameters[i]['is_last'] = i == parameters.length - 1;
            }

            return {
              'name': index.name.pascalCase,
              'parameters': parameters,
              'expressions': expressions,
              'sort_expressions': sortExpressions,
            };
          })
          .toList(),
      'has_files': hasFiles,
      'file_fields': fileFields
          .map(
            (field) => {
              'name': field.name,
              'snake_name': lowerCamelize(field.name),
              'multi': field.data['maxSelect']! > 1,
            },
          )
          .toList(),
      'debug': debug ? {'pb_definition': toLiteral(collection.toJson())} : null,
    };
  }

  bool _isVisible(CollectionField field) =>
      !field.hidden || field.type == 'password';

  Iterable<BackRelation> _findBackRelations(
    CollectionSchema collectionSchema,
  ) => schema.backRelations[collectionSchema.model.id] ?? [];

  Iterable<CollectionField> _findFieldsOfType(
    CollectionSchema collectionSchema,
    String type,
  ) {
    return collectionSchema.model.fields.where(
      (field) => _isVisible(field) && field.type == type,
    );
  }
}
