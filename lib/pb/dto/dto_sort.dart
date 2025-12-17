import 'package:meta/meta.dart';

import 'dto.dart';
import 'dto_field.dart';
import 'relation_dto.dart';

sealed class FieldChain {
  FieldChain extend(String name);

  String get last;

  set last(String value);
}

class BaseFieldChain extends FieldChain {
  String name;

  BaseFieldChain(this.name);

  @override
  FieldChain extend(String name) => ExtendedFieldChain([this.name, name]);

  @override
  String toString() => name;

  @override
  String get last => name;

  @override
  set last(String value) => name = value;
}

class ExtendedFieldChain extends FieldChain {
  List<String> names;

  ExtendedFieldChain(this.names);

  @override
  FieldChain extend(String name) {
    names.add(name);
    return this;
  }

  @override
  String toString() => names.join('.');

  @override
  String get last => names.last;

  @override
  set last(String value) => names[names.length - 1] = value;
}

sealed class DtoSortDelegate<N extends Dto<N>> {
  List<FieldChain> get parts;

  int get nextIndex;

  @protected
  void add(String name, bool desc, bool raw);
}

class _RootSortDelegate<N extends Dto<N>> extends DtoSortDelegate<N> {
  @override
  final List<FieldChain> parts;

  @override
  int get nextIndex => parts.length - 1;

  _RootSortDelegate() : parts = [];

  @override
  @protected
  void add(String name, bool desc, bool raw) {
    parts.add(BaseFieldChain('${desc ? '-' : '+'}$name'));
  }

  @override
  String toString() => parts.join(',');
}

class _NestedSortDelegate<D extends Dto<D>> extends DtoSortDelegate<D> {
  @override
  final List<FieldChain> parts;
  final int index;

  @override
  int get nextIndex => index;

  _NestedSortDelegate(this.parts, this.index);

  @override
  @protected
  void add(String name, bool desc, bool raw) {
    if (raw) {
      throw Exception("Can't append raw to chain.");
    }
    parts[index] = parts[index].extend(name);
  }
}

abstract class DtoSort<D extends Dto<D>> {
  @override
  String toString();
}

abstract class DtoSortBase<D extends Dto<D>, N extends Dto<N>> {
  @protected
  final DtoSortDelegate<N> delegate;

  @protected
  DtoSortBase.root() : delegate = _RootSortDelegate();

  DtoSortBase(this.delegate);

  @protected
  void addField<V>(DtoTypedField<N, V> field, bool desc) =>
      delegate.add(field.pbName, desc, false);

  @protected
  DtoSortDelegate<V> addRelation<V extends Dto<V>>(
    DtoTypedField<N, RelationDto<V>> relation,
    bool desc,
  ) {
    delegate.add(relation.pbName, desc, false);
    return _NestedSortDelegate(delegate.parts, delegate.nextIndex);
  }

  void random({bool desc = false}) => delegate.add('@random', desc, true);

  void rowid({bool desc = false}) => delegate.add('@rowid', desc, true);

  @override
  String toString() => delegate.toString();
}
