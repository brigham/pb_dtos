import 'dto.dart';
import 'dto_field.dart';
import 'relation_dto.dart';

sealed class FilterOperand<D extends Dto<D>, V> {
  const FilterOperand();

  void include(StringBuffer buffer);
}

class DtoFieldOperand<D extends Dto<D>, V> extends FilterOperand<D, V> {
  final DtoTypedField<D, V> field;

  DtoFieldOperand(this.field);

  @override
  void include(StringBuffer buffer) {
    buffer.write(field.pbName);
  }
}

sealed class FieldPath<S extends Dto<S>, N extends Dto<N>> {
  FieldPath<S, N2> extend<N2 extends Dto<N2>>(
    DtoTypedField<N, RelationDto<N2>> field,
  );

  FieldPath<S, N2> extendMultiple<N2 extends Dto<N2>>(
    DtoTypedField<N, RelationDto<N2>> field,
  );

  TerminalFieldPath<S, N, V> terminate<V>(DtoTypedField<N, V> field) {
    return TerminalFieldPath(this, field);
  }

  FilterOperand<S, RelationDto<N>> asOperand();

  void include(StringBuffer buffer) {
    void recur(FieldPath fieldPath) {
      switch (fieldPath) {
        case SoloFieldPath solo:
          buffer.write(solo.field.pbName);
        case ExtendedFieldPath extended:
          recur(extended.parent);
          buffer.write('.');
          buffer.write(extended.field.pbName);
        case ExtendedMultipleFieldPath extMult:
          recur(extMult.parent);
          buffer.write('.');
          buffer.write(extMult.field.pbName);
      }
    }

    recur(this);
  }
}

class SoloFieldPath<S extends Dto<S>, N extends Dto<N>>
    extends FieldPath<S, N> {
  final DtoTypedField<S, RelationDto<N>> field;

  SoloFieldPath(this.field);

  @override
  FieldPath<S, N2> extend<N2 extends Dto<N2>>(
    DtoTypedField<N, RelationDto<N2>> field,
  ) {
    return ExtendedFieldPath(this, field);
  }

  @override
  FieldPath<S, N2> extendMultiple<N2 extends Dto<N2>>(
    DtoTypedField<N, RelationDto<N2>> field,
  ) {
    return ExtendedMultipleFieldPath(this, field);
  }

  TerminalFieldPath<S, S, RelationDto<N>> asTerminal() {
    return TerminalFieldPath(null, field);
  }

  @override
  FilterOperand<S, RelationDto<N>> asOperand() {
    return DtoFieldPathOperand(this);
  }
}

class ExtendedFieldPath<S extends Dto<S>, P extends Dto<P>, N extends Dto<N>>
    extends FieldPath<S, N> {
  final FieldPath<S, P> parent;
  final DtoTypedField<P, RelationDto<N>> field;

  ExtendedFieldPath(this.parent, this.field);

  @override
  FieldPath<S, N2> extend<N2 extends Dto<N2>>(
    DtoTypedField<N, RelationDto<N2>> field,
  ) {
    return ExtendedFieldPath(this, field);
  }

  @override
  FieldPath<S, N2> extendMultiple<N2 extends Dto<N2>>(
    DtoTypedField<N, RelationDto<N2>> field,
  ) {
    return ExtendedMultipleFieldPath(this, field);
  }

  TerminalFieldPath<S, P, RelationDto<N>> asTerminal() {
    return TerminalFieldPath(parent, field);
  }

  @override
  FilterOperand<S, RelationDto<N>> asOperand() {
    return DtoFieldPathOperand(this);
  }
}

class ExtendedMultipleFieldPath<
  S extends Dto<S>,
  P extends Dto<P>,
  N extends Dto<N>
>
    extends FieldPath<S, N> {
  final FieldPath<S, P> parent;
  final DtoTypedField<P, RelationDto<N>> field;

  ExtendedMultipleFieldPath(this.parent, this.field);

  @override
  FieldPath<S, N2> extend<N2 extends Dto<N2>>(
    DtoTypedField<N, RelationDto<N2>> field,
  ) {
    return ExtendedFieldPath(this, field);
  }

  @override
  FieldPath<S, N2> extendMultiple<N2 extends Dto<N2>>(
    DtoTypedField<N, RelationDto<N2>> field,
  ) {
    return ExtendedMultipleFieldPath(this, field);
  }

  TerminalFieldPath<S, P, RelationDto<N>> asTerminal() {
    return TerminalFieldPath(parent, field);
  }

  @override
  FilterOperand<S, RelationDto<N>> asOperand() {
    return DtoFieldPathOperand(this);
  }
}

class TerminalFieldPath<S extends Dto<S>, P extends Dto<P>, V> {
  final FieldPath<S, P>? parent;
  final DtoTypedField<P, V> field;

  TerminalFieldPath(this.parent, this.field);

  DtoTerminalFieldPathOperand<S, V> asOperand() {
    return DtoTerminalFieldPathOperand(this);
  }
}

class DtoFieldPathOperand<D extends Dto<D>, V extends Dto<V>>
    extends FilterOperand<D, RelationDto<V>> {
  final FieldPath<D, V> fieldPath;

  DtoFieldPathOperand(this.fieldPath);

  @override
  void include(StringBuffer buffer) {
    fieldPath.include(buffer);
  }
}

class DtoTerminalFieldPathOperand<D extends Dto<D>, V>
    extends FilterOperand<D, V> {
  final TerminalFieldPath<D, Dto<dynamic>, V> fieldPath;

  DtoTerminalFieldPathOperand(this.fieldPath);

  @override
  void include(StringBuffer buffer) {
    var parent = fieldPath.parent;
    if (parent != null) {
      parent.include(buffer);
      buffer.write('.');
    }
    buffer.write(fieldPath.field.pbName);
  }
}

class ModifiedDtoFieldOperand<D extends Dto<D>, V> extends FilterOperand<D, V> {
  final DtoTypedField<D, V> field;
  final String modifier;

  ModifiedDtoFieldOperand(this.field, this.modifier);

  @override
  void include(StringBuffer buffer) {
    buffer.write('${field.pbName}:$modifier');
  }
}

class LiteralOperand<D extends Dto<D>, V> extends FilterOperand<D, V> {
  final V? value;

  LiteralOperand(this.value);

  @override
  void include(StringBuffer buffer) {
    switch (value) {
      case null:
        buffer.write('null');
      case String _ || Enum _ || RelationDto _:
        var escaped = value.toString().replaceAll("'", r"\'");
        buffer.write("'$escaped'");
      default:
        buffer.write(value.toString());
    }
  }
}

class Func4Operand<D extends Dto<D>, V1, V2, V3, V4, R>
    extends FilterOperand<D, R> {
  final String functionName;
  final FilterOperand<D, V1> valueOperand1;
  final FilterOperand<D, V2> valueOperand2;
  final FilterOperand<D, V3> valueOperand3;
  final FilterOperand<D, V4> valueOperand4;

  const Func4Operand(
    this.functionName,
    this.valueOperand1,
    this.valueOperand2,
    this.valueOperand3,
    this.valueOperand4,
  );

  static Func4Operand<D, num, num, num, num, num> geoDistance<D extends Dto<D>>(
    FilterOperand<D, num> lonA,
    FilterOperand<D, num> latA,
    FilterOperand<D, num> lonB,
    FilterOperand<D, num> latB,
  ) => Func4Operand("geoDistance", lonA, latA, lonB, latB);

  @override
  void include(StringBuffer buffer) {
    buffer.write(functionName);
    buffer.write('(');
    valueOperand1.include(buffer);
    buffer.write(',');
    valueOperand2.include(buffer);
    buffer.write(',');
    valueOperand3.include(buffer);
    buffer.write(',');
    valueOperand4.include(buffer);
    buffer.write(')');
  }
}

class MacroOperand<D extends Dto<D>, V> extends FilterOperand<D, V> {
  final String _rawValue;

  const MacroOperand._(this._rawValue);

  /// @now        - the current datetime as string
  static MacroOperand<D, DateTime> now<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._("@now");

  /// @second     - @now second number (0-59)
  static MacroOperand<D, num> second<D extends Dto<D>>() =>
      MacroOperand<D, num>._("@second");

  /// @minute     - @now minute number (0-59)
  static MacroOperand<D, num> minute<D extends Dto<D>>() =>
      MacroOperand<D, num>._("@minute");

  /// @hour       - @now hour number (0-23)
  static MacroOperand<D, num> hour<D extends Dto<D>>() =>
      MacroOperand<D, num>._("@hour");

  /// @weekday    - @now weekday number (0-6)
  static MacroOperand<D, num> weekday<D extends Dto<D>>() =>
      MacroOperand<D, num>._("@weekday");

  /// @day        - @now day number
  static MacroOperand<D, num> day<D extends Dto<D>>() =>
      MacroOperand<D, num>._("@day");

  /// @month      - @now month number
  static MacroOperand<D, num> month<D extends Dto<D>>() =>
      MacroOperand<D, num>._("@month");

  /// @year       - @now year number
  static MacroOperand<D, num> year<D extends Dto<D>>() =>
      MacroOperand<D, num>._("@year");

  /// @yesterday  - the yesterday datetime relative to @now as string
  static MacroOperand<D, DateTime> yesterday<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._("@yesterday");

  /// @tomorrow   - the tomorrow datetime relative to @now as string
  static MacroOperand<D, DateTime> tomorrow<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._("@tomorrow");

  /// @todayStart - beginning of the current day as datetime string
  static MacroOperand<D, DateTime> todayStart<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._("@todayStart");

  /// @todayEnd   - end of the current day as datetime string
  static MacroOperand<D, DateTime> todayEnd<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._("@todayEnd");

  /// @monthStart - beginning of the current month as datetime string
  static MacroOperand<D, DateTime> monthStart<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._("@monthStart");

  /// @monthEnd   - end of the current month as datetime string
  static MacroOperand<D, DateTime> monthEnd<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._("@monthEnd");

  /// @yearStart  - beginning of the current year as datetime string
  static MacroOperand<D, DateTime> yearStart<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._("@yearStart");

  /// @yearEnd    - end of the current year as datetime string
  static MacroOperand<D, DateTime> yearEnd<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._("@yearEnd");

  @override
  void include(StringBuffer buffer) {
    buffer.write(_rawValue);
  }
}
