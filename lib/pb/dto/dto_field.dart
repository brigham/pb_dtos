import 'package:meta/meta.dart';

import 'dto.dart';
import 'dto_sort.dart';
import 'relation_dto.dart';

abstract class DtoField<D extends Dto<D>> {
  String get pbName;
}

sealed class DtoFieldSettings {
  final String typeName;
  final bool required;

  const DtoFieldSettings(this.typeName, {required this.required});
}

class DtoBoolFieldSettings extends DtoFieldSettings {
  const DtoBoolFieldSettings({required bool required})
    : super('bool', required: required);
}

class DtoNumberFieldSettings extends DtoFieldSettings {
  final num min;
  final num max;
  final bool onlyInt;

  const DtoNumberFieldSettings({
    required bool required,
    required this.min,
    required this.max,
    required this.onlyInt,
  }) : super('number', required: required);
}

class DtoTextFieldSettings extends DtoFieldSettings {
  final String autogeneratePattern;
  final int min;
  final int max;
  final String pattern;

  const DtoTextFieldSettings({
    required bool required,
    required this.autogeneratePattern,
    required this.min,
    required this.max,
    required this.pattern,
  }) : super('text', required: required);
}

class DtoPasswordFieldSettings extends DtoFieldSettings {
  final String pattern;
  final int min;
  final int max;

  const DtoPasswordFieldSettings({
    required bool required,
    required this.pattern,
    required this.min,
    required this.max,
  }) : super('password', required: required);
}

class DtoEmailFieldSettings extends DtoFieldSettings {
  final List<String> exceptDomains;
  final List<String> onlyDomains;

  const DtoEmailFieldSettings({
    required bool required,
    required this.exceptDomains,
    required this.onlyDomains,
  }) : super('email', required: required);
}

class DtoURLFieldSettings extends DtoFieldSettings {
  final List<String> exceptDomains;
  final List<String> onlyDomains;

  const DtoURLFieldSettings({
    required bool required,
    required this.exceptDomains,
    required this.onlyDomains,
  }) : super('url', required: required);
}

class DtoEditorFieldSettings extends DtoFieldSettings {
  final num maxSize;
  final bool convertURLs;

  const DtoEditorFieldSettings({
    required bool required,
    required this.maxSize,
    required this.convertURLs,
  }) : super('editor', required: required);
}

class DtoDateFieldSettings extends DtoFieldSettings {
  final DateTime? min;
  final DateTime? max;

  const DtoDateFieldSettings({
    required bool required,
    required this.min,
    required this.max,
  }) : super('date', required: required);
}

class DtoAutodateFieldSettings extends DtoFieldSettings {
  final bool onCreate;
  final bool onUpdate;

  const DtoAutodateFieldSettings({
    required this.onCreate,
    required this.onUpdate,
  }) : super('autodate', required: true);
}

class DtoSelectFieldSettings extends DtoFieldSettings {
  final List<String> values;
  final int maxSelect;

  const DtoSelectFieldSettings({
    required bool required,
    required this.values,
    required this.maxSelect,
  }) : super('select', required: required);
}

class DtoFileFieldSettings extends DtoFieldSettings {
  final num maxSize;
  final int maxSelect;
  final List<String> mimeTypes;
  final List<String> thumbs;
  final bool protected;

  const DtoFileFieldSettings({
    required bool required,
    required this.maxSize,
    required this.maxSelect,
    required this.mimeTypes,
    required this.thumbs,
    required this.protected,
  }) : super('file', required: required);
}

class DtoRelationFieldSettings extends DtoFieldSettings {
  final String collectionId;
  final bool cascadeDelete;
  final int minSelect;
  final int maxSelect;

  const DtoRelationFieldSettings({
    required bool required,
    required this.collectionId,
    required this.cascadeDelete,
    required this.minSelect,
    required this.maxSelect,
  }) : super('relation', required: required);
}

class DtoJSONFieldSettings extends DtoFieldSettings {
  final num maxSize;

  const DtoJSONFieldSettings({required bool required, required this.maxSize})
    : super('json', required: required);
}

class DtoGeoPointFieldSettings extends DtoFieldSettings {
  const DtoGeoPointFieldSettings({required bool required})
    : super('geoPoint', required: required);
}

abstract class DtoFilterableField<D extends Dto<D>, V> extends DtoField<D> {}

abstract class DtoTypedField<D extends Dto<D>, V, A>
    extends DtoFilterableField<D, V> {
  A get(D dto);

  D copyWith(D dto, A value);

  DtoFieldSettings? get settings;
}

abstract class DtoFieldSelect<D extends Dto<D>> {
  const DtoFieldSelect();

  @override
  String toString();
}

abstract class DtoFieldSelectBase<D extends Dto<D>> extends DtoFieldSelect<D> {
  @protected
  final List<FieldChain> $parts;

  @protected
  final FieldChain $fieldChain;

  DtoFieldSelectBase() : $parts = [], $fieldChain = const EmptyFieldChain();

  DtoFieldSelectBase.nested(this.$parts, this.$fieldChain);

  void call() {
    $parts.add($fieldChain);
  }

  @protected
  void $addField<V>(DtoFilterableField<D, V> field) => $add(field.pbName);

  @protected
  ModifiableStringField $addModifiableField<V>(DtoFilterableField<D, V> field) {
    return ModifiableStringField($parts, $fieldChain.extend(field.pbName));
  }

  @protected
  FS $addRelation<V extends Dto<V>, FS extends DtoFieldSelectBase<V>>(
    FS Function(List<FieldChain> parts, FieldChain fieldChain) creator,
    DtoFilterableField<D, RelationDto<V>> relation,
  ) {
    return creator($parts, $fieldChain.extend(relation.pbName));
  }

  @protected
  FS $addExpand<V extends Dto<V>, FS extends DtoFieldSelectBase<V>>(
    FS Function(List<FieldChain> parts, FieldChain fieldChain) creator,
  ) {
    return creator($parts, $fieldChain.extend('expand'));
  }

  @override
  String toString() => $parts.join(',');

  void star_() => $add('*');

  void $add(String name) => $parts.add($fieldChain.extend(name));
}

class ModifiableStringField {
  final List<FieldChain> $parts;
  final FieldChain $fieldChain;

  void call() {
    $parts.add($fieldChain);
  }

  ModifiableStringField(this.$parts, this.$fieldChain);

  @protected
  void $add(String name) {
    $parts.add(ModifiedFieldChain($fieldChain, name));
  }

  void excerpt(int length, {bool withEllipsis = false}) =>
      $add('excerpt($length,$withEllipsis)');
}
