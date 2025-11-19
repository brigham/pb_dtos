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

  int get nextIndex;

  @protected
  void add(String name, bool raw);
}

class _RootExpandDelegate<N extends Dto<N>> extends DtoExpandDelegate<N> {
  @override
  final List<FieldChain> parts;

  @override
  int get nextIndex => parts.length - 1;

  _RootExpandDelegate() : parts = [];

  @override
  @protected
  void add(String name, bool raw) {
    parts.add(BaseFieldChain(name));
  }

  @override
  String toString() => parts.join(',');
}

class _NestedExpandDelegate<D extends Dto<D>> extends DtoExpandDelegate<D> {
  @override
  final List<FieldChain> parts;
  final int index;

  @override
  int get nextIndex => index;

  _NestedExpandDelegate(this.parts, this.index);

  @override
  @protected
  void add(String name, bool raw) {
    if (raw) {
      throw Exception("Can't append raw to chain.");
    }
    parts[index] = parts[index].extend(name);
  }
}

abstract class DtoExpand<D extends Dto<D>, N extends Dto<N>> {
  @protected
  final DtoExpandDelegate<N> delegate;

  @protected
  DtoExpand.root() : delegate = _RootExpandDelegate();

  DtoExpand(this.delegate);

  @protected
  DtoExpandDelegate<V> addRelation<V extends Dto<V>>(
    DtoTypedField<N, RelationDto<V>> relation,
  ) {
    delegate.add(relation.pbName, false);
    return _NestedExpandDelegate(delegate.parts, delegate.nextIndex);
  }

  @override
  String toString() => delegate.toString();
}
