import 'package:meta/meta.dart';

import 'dto.dart';
import 'dto_sort.dart';
import 'relation_dto.dart';

abstract class DtoField<D extends Dto<D>> {
  String get pbName;
}

abstract class DtoTypedField<D extends Dto<D>, V> extends DtoField<D> {}

abstract class DtoRootFieldSelect<D extends Dto<D>> {
  final List<FieldChain> $parts;

  int get $nextIndex => $parts.length - 1;

  DtoRootFieldSelect() : $parts = [];

  @protected
  void $add(String name, {bool modifier = false}) {
    if (modifier) {
      throw Exception("Can't start with modifier.");
    }
    $parts.add(BaseFieldChain(name));
  }

  @override
  String toString() => $parts.join(',');

  DtoRootFieldSelect.root() : this();

  @protected
  void $addField<V>(DtoTypedField<D, V> field) => $add(field.pbName);

  @protected
  void $addRelation<V extends Dto<V>>(
    DtoTypedField<D, RelationDto<V>> relation,
  ) {
    $add("expand.${relation.pbName}");
  }

  void star_() => $add('*');
}

abstract class DtoNestedFieldSelect<D extends Dto<D>, N extends Dto<N>> {
  final List<FieldChain> $parts;
  final int $index;

  int get $nextIndex => $parts.length - 1;

  DtoNestedFieldSelect(this.$parts, this.$index);

  @protected
  void $add(String name, {bool modifier = false}) {
    if (modifier) {
      $parts[$index].last = $parts[$index].last + name;
    }
    $parts[$index] = $parts[$index].extend(name);
  }

  @override
  String toString() => $parts.join(',');

  @protected
  void $addField<V>(DtoTypedField<N, V> field) => $add(field.pbName);

  @protected
  void $addRelation<V extends Dto<V>>(
    DtoTypedField<N, RelationDto<V>> relation,
  ) => $add(relation.pbName);

  void star_() => $add('*');
}

class ModifiableStringField {
  final List<FieldChain> $parts;
  final int $index;

  ModifiableStringField(this.$parts, this.$index);

  @protected
  void $add(String name) {
    $parts[$index].last = $parts[$index].last + name;
  }

  void excerpt(int length, {bool withEllipsis = false}) =>
      $add(':excerpt($length,$withEllipsis)');
}
