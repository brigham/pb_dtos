import 'dart:collection';
import 'dart:convert';

import 'package:pb_dtos/pb/dto/geopoint_dto.dart';

import 'dto.dart';
import 'dto_field.dart';
import 'file_dto.dart';
import 'filter_expression.dart';
import 'relation_dto.dart';

sealed class FilterOperand<D extends Dto<D>, V> {
  const FilterOperand();

  const factory FilterOperand.val(V? value) = LiteralOperand;

  factory FilterOperand.field(ComparisonBuilder<D, V> field) => field.operand1;

  void include(StringBuffer buffer);
}

class DtoFieldOperand<D extends Dto<D>, V> extends FilterOperand<D, V> {
  final DtoFilterableField<D, V> field;

  DtoFieldOperand(this.field);

  @override
  void include(StringBuffer buffer) {
    buffer.write(field.pbName);
  }
}

sealed class FieldPath<S extends Dto<S>, N extends Dto<N>> {
  FieldPath<S, N2> extend<N2 extends Dto<N2>>(
    DtoFilterableField<N, RelationDto<N2>> field,
  );

  FieldPath<S, N2> extendMultiple<N2 extends Dto<N2>>(
    DtoFilterableField<N, RelationDto<N2>> field,
  );

  TerminalFieldPath<S, N, V> terminate<V>(DtoFilterableField<N, V> field) {
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
  final DtoFilterableField<S, RelationDto<N>> field;

  SoloFieldPath(this.field);

  @override
  FieldPath<S, N2> extend<N2 extends Dto<N2>>(
    DtoFilterableField<N, RelationDto<N2>> field,
  ) {
    return ExtendedFieldPath(this, field);
  }

  @override
  FieldPath<S, N2> extendMultiple<N2 extends Dto<N2>>(
    DtoFilterableField<N, RelationDto<N2>> field,
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
  final DtoFilterableField<P, RelationDto<N>> field;

  ExtendedFieldPath(this.parent, this.field);

  @override
  FieldPath<S, N2> extend<N2 extends Dto<N2>>(
    DtoFilterableField<N, RelationDto<N2>> field,
  ) {
    return ExtendedFieldPath(this, field);
  }

  @override
  FieldPath<S, N2> extendMultiple<N2 extends Dto<N2>>(
    DtoFilterableField<N, RelationDto<N2>> field,
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
  final DtoFilterableField<P, RelationDto<N>> field;

  ExtendedMultipleFieldPath(this.parent, this.field);

  @override
  FieldPath<S, N2> extend<N2 extends Dto<N2>>(
    DtoFilterableField<N, RelationDto<N2>> field,
  ) {
    return ExtendedFieldPath(this, field);
  }

  @override
  FieldPath<S, N2> extendMultiple<N2 extends Dto<N2>>(
    DtoFilterableField<N, RelationDto<N2>> field,
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
  final DtoFilterableField<P, V> field;

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

class ModifiedDtoFieldOperand<D extends Dto<D>, V, M>
    extends FilterOperand<D, M> {
  final FilterOperand<D, V> modified;
  final String modifier;

  ModifiedDtoFieldOperand(this.modified, this.modifier);

  @override
  void include(StringBuffer buffer) {
    modified.include(buffer);
    buffer.write(':');
    buffer.write(modifier);
  }
}

class LiteralOperand<D extends Dto<D>, V> extends FilterOperand<D, V> {
  final V? value;

  const LiteralOperand(this.value);

  @override
  void include(StringBuffer buffer) {
    switch (value) {
      case null:
        buffer.write('null');
      case String _ || Enum _ || RelationDto _:
        _includeString(buffer, value.toString());
      case DateTime dt:
        _includeString(buffer, dt.toUtc().toString());
      case num _ || bool _:
        buffer.write(value.toString());
      case FileDto file:
        var json = file.toJson();
        if (json != null) {
          _includeString(buffer, json);
        } else {
          throw ArgumentError.value(
            file,
            'operand2',
            'FileDto must have a name.',
          );
        }
      case Map<String, dynamic> _ || List<dynamic> _:
        var asJson = json.encode(_encodeAsPocketbaseJson(value));
        _includeString(buffer, asJson);
      case GeopointDto g:
        // Pocketbase always stores lon first.
        // https://github.com/pocketbase/pocketbase/issues/21#issuecomment-2771957602
        LinkedHashMap<String, num> asMap = LinkedHashMap<String, num>();
        asMap['lon'] = g.lon;
        asMap['lat'] = g.lat;
        var asJson = json.encode(asMap);
        _includeString(buffer, asJson);
      default:
        buffer.write(value.toString());
    }
  }

  static void _includeString(StringBuffer buffer, String value) {
    var escaped = value.toString().replaceAll("'", r"\'");
    buffer.write("'");
    buffer.write(escaped);
    buffer.write("'");
  }

  static Object? _encodeAsPocketbaseJson(Object? obj) {
    switch (obj) {
      case List<dynamic> l:
        if (l.isEmpty) return obj;
        if (!l.any((item) => item is Map || item is List)) return obj;
        return l.map((item) => _encodeAsPocketbaseJson(item)).toList();
      case Map<String, dynamic> m:
        if (m.isEmpty) return obj;
        if (m is LinkedHashMap) {
          var keys = m.keys.cast<String>().iterator;
          if (!keys.moveNext()) return obj;
          bool sorted = true;
          var lastKey = keys.current;
          while (keys.moveNext()) {
            var key = keys.current;
            if (key.compareTo(lastKey) < 0) {
              sorted = false;
              break;
            }
            lastKey = key;
          }
          if (sorted) return obj;
        }
        LinkedHashMap<String, dynamic> sortedMap = LinkedHashMap();
        var sortedKeys = m.keys.cast<String>().toList();
        sortedKeys.sort();
        for (var key in sortedKeys) {
          sortedMap[key] = _encodeAsPocketbaseJson(m[key]);
        }
        return sortedMap;
      default:
        return obj;
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
  ) => Func4Operand('geoDistance', lonA, latA, lonB, latB);

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
      MacroOperand<D, DateTime>._('@now');

  /// @second     - @now second number (0-59)
  static MacroOperand<D, num> second<D extends Dto<D>>() =>
      MacroOperand<D, num>._('@second');

  /// @minute     - @now minute number (0-59)
  static MacroOperand<D, num> minute<D extends Dto<D>>() =>
      MacroOperand<D, num>._('@minute');

  /// @hour       - @now hour number (0-23)
  static MacroOperand<D, num> hour<D extends Dto<D>>() =>
      MacroOperand<D, num>._('@hour');

  /// @weekday    - @now weekday number (0-6)
  static MacroOperand<D, num> weekday<D extends Dto<D>>() =>
      MacroOperand<D, num>._('@weekday');

  /// @day        - @now day number
  static MacroOperand<D, num> day<D extends Dto<D>>() =>
      MacroOperand<D, num>._('@day');

  /// @month      - @now month number
  static MacroOperand<D, num> month<D extends Dto<D>>() =>
      MacroOperand<D, num>._('@month');

  /// @year       - @now year number
  static MacroOperand<D, num> year<D extends Dto<D>>() =>
      MacroOperand<D, num>._('@year');

  /// @yesterday  - the yesterday datetime relative to @now as string
  static MacroOperand<D, DateTime> yesterday<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._('@yesterday');

  /// @tomorrow   - the tomorrow datetime relative to @now as string
  static MacroOperand<D, DateTime> tomorrow<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._('@tomorrow');

  /// @todayStart - beginning of the current day as datetime string
  static MacroOperand<D, DateTime> todayStart<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._('@todayStart');

  /// @todayEnd   - end of the current day as datetime string
  static MacroOperand<D, DateTime> todayEnd<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._('@todayEnd');

  /// @monthStart - beginning of the current month as datetime string
  static MacroOperand<D, DateTime> monthStart<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._('@monthStart');

  /// @monthEnd   - end of the current month as datetime string
  static MacroOperand<D, DateTime> monthEnd<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._('@monthEnd');

  /// @yearStart  - beginning of the current year as datetime string
  static MacroOperand<D, DateTime> yearStart<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._('@yearStart');

  /// @yearEnd    - end of the current year as datetime string
  static MacroOperand<D, DateTime> yearEnd<D extends Dto<D>>() =>
      MacroOperand<D, DateTime>._('@yearEnd');

  @override
  void include(StringBuffer buffer) {
    buffer.write(_rawValue);
  }
}
