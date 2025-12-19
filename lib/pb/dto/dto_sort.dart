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

class DirectionalFieldChain {
  final FieldChain chain;
  final bool desc;

  DirectionalFieldChain(this.chain, this.desc);

  @override
  String toString() => desc ? '-${chain.toString()}' : chain.toString();
}

sealed class DtoSortDelegate<N extends Dto<N>> {
  List<DirectionalFieldChain> get parts;

  @protected
  DtoSortDelegate<V> add<V extends Dto<V>>(String name, bool raw);

  @protected
  void complete(bool desc);
}

class _RootSortDelegate<N extends Dto<N>> extends DtoSortDelegate<N> {
  @override
  final List<DirectionalFieldChain> parts;

  _RootSortDelegate() : parts = [];

  @override
  @protected
  DtoSortDelegate<V> add<V extends Dto<V>>(String name, bool raw) =>
      _NestedSortDelegate(parts, BaseFieldChain(name));

  @override
  @protected
  void complete(bool desc) {
    // No reason this should ever be called.
  }

  @override
  String toString() => parts.join(',');
}

class _NestedSortDelegate<D extends Dto<D>> extends DtoSortDelegate<D> {
  @override
  final List<DirectionalFieldChain> parts;

  final FieldChain fieldChain;

  _NestedSortDelegate(this.parts, this.fieldChain);

  @override
  @protected
  DtoSortDelegate<V> add<V extends Dto<V>>(String name, bool raw) {
    if (raw) {
      throw Exception("Can't append raw to chain.");
    }
    return _NestedSortDelegate(parts, fieldChain.extend(name));
  }

  @override
  @protected
  void complete(bool desc) {
    parts.add(DirectionalFieldChain(fieldChain, desc));
  }
}

abstract class DtoSort<D extends Dto<D>> {
  @override
  String toString();
}

abstract class DtoSortBase<D extends Dto<D>, N extends Dto<N>>
    extends DtoSort<D> {
  @protected
  final DtoSortDelegate<N> delegate;

  @protected
  DtoSortBase.root() : delegate = _RootSortDelegate();

  DtoSortBase(this.delegate);

  @protected
  void addField<V>(DtoTypedField<N, V> field, bool desc) {
    delegate.add<N>(field.pbName, false).complete(desc);
  }

  @protected
  DtoSortDelegate<V> addRelation<V extends Dto<V>>(
    DtoTypedField<N, RelationDto<V>> relation,
  ) {
    return delegate.add(relation.pbName, false);
  }

  @protected
  void finish(bool desc) {
    delegate.complete(desc);
  }

  void random({bool desc = false}) =>
      delegate.add<D>('@random', true).complete(desc);

  void rowid({bool desc = false}) =>
      delegate.add<D>('@rowid', true).complete(desc);

  @override
  String toString() => delegate.toString();
}
