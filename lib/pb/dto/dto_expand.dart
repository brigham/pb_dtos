import 'package:meta/meta.dart';

import 'dto.dart';
import 'dto_field.dart';
import 'dto_sort.dart';
import 'relation_dto.dart';

abstract class DtoExpandEnum<D extends Dto<D>> {
  String get pbName;
}

sealed class DtoExpandDelegate<N extends Dto<N>> {
  List<FieldChain> get parts;

  @protected
  DtoExpandDelegate<V> add<V extends Dto<V>>(String name, bool raw);

  @protected
  void complete();
}

class _RootExpandDelegate<N extends Dto<N>> extends DtoExpandDelegate<N> {
  @override
  final List<FieldChain> parts;

  _RootExpandDelegate() : parts = [];

  @override
  @protected
  DtoExpandDelegate<V> add<V extends Dto<V>>(String name, bool raw) =>
      _NestedExpandDelegate(parts, BaseFieldChain(name));

  @override
  @protected
  void complete() {
    // No reason this should ever be called.
  }

  @override
  String toString() => parts.join(',');
}

class _NestedExpandDelegate<D extends Dto<D>> extends DtoExpandDelegate<D> {
  @override
  final List<FieldChain> parts;

  final FieldChain fieldChain;

  _NestedExpandDelegate(this.parts, this.fieldChain);

  @override
  @protected
  DtoExpandDelegate<V> add<V extends Dto<V>>(String name, bool raw) {
    if (raw) {
      throw Exception("Can't append raw to chain.");
    }
    return _NestedExpandDelegate(parts, fieldChain.extend(name));
  }

  @override
  @protected
  void complete() {
    parts.add(fieldChain);
  }
}

abstract class DtoExpand<D extends Dto<D>> {
  @override
  String toString();
}

abstract class DtoExpandBase<D extends Dto<D>, N extends Dto<N>>
    extends DtoExpand<D> {
  @protected
  final DtoExpandDelegate<N> delegate;

  @protected
  DtoExpandBase.root() : delegate = _RootExpandDelegate();

  DtoExpandBase(this.delegate);

  @protected
  DtoExpandDelegate<V> addRelation<V extends Dto<V>>(
    DtoTypedField<N, RelationDto<V>> relation,
  ) => delegate.add<V>(relation.pbName, false);

  @protected
  void finish() {
    delegate.complete();
  }

  @override
  String toString() => delegate.toString();
}
