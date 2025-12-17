import 'dto.dart';
import 'dto_field.dart';
import 'filter_operand.dart';
import 'filter_operator.dart';
import 'relation_dto.dart';

/// A base class for all filter expressions.
abstract class FilterExpression<D extends Dto<D>> {
  /// Returns the PocketBase string representation of the expression.
  void include(StringBuffer buffer);

  /// Combines this expression with another using the AND operator.
  FilterExpression<D> and(FilterExpression<D> other) {
    return And([this, other]);
  }

  /// Combines this expression with another using the OR operator.
  FilterExpression<D> or(FilterExpression<D> other) {
    return Or([this, other]);
  }
}

// TODO: PocketBase supports descending into JSON objects, so we should as well.

/// A class representing a single `OPERAND OPERATOR OPERAND` expression.
class Comparison<D extends Dto<D>, V> extends FilterExpression<D> {
  final FilterOperand<D, V> operand1;
  final FilterOperator operator;
  final FilterOperand<D, V> operand2;

  Comparison(this.operand1, this.operator, this.operand2);

  @override
  void include(StringBuffer buffer) {
    operand1.include(buffer);
    buffer.write(' ');
    buffer.write(operator.pbName);
    buffer.write(' ');
    operand2.include(buffer);
  }
}

class ComparisonBuilder<D extends Dto<D>, V> {
  final FilterOperand<D, V> operand1;
  final void Function(FilterExpression<D>)? handler;

  ComparisonBuilder._(this.operand1, [this.handler]);

  ComparisonBuilder.field(DtoTypedField<D, V> field, [this.handler])
    : operand1 = DtoFieldOperand<D, V>(field);

  ComparisonBuilder.literal(V? value, [this.handler])
    : operand1 = LiteralOperand<D, V>(value);

  Comparison<D, V> _makeComparison(
    FilterOperator operator,
    FilterOperand<D, V> operand2,
  ) {
    var comparison = Comparison<D, V>(operand1, operator, operand2);
    var handler = this.handler;
    if (handler != null) {
      handler(comparison);
    }
    return comparison;
  }

  ComparisonBuilder<D, String> lower() {
    return ComparisonBuilder._(
      ModifiedDtoFieldOperand<D, V, String>(operand1, "lower"),
      handler,
    );
  }

  Comparison<D, V> equal(FilterOperand<D, V> operand2) {
    return _makeComparison(FilterOperator.equal, operand2);
  }

  /// NOT equal
  Comparison<D, V> notEqual(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.notEqual, operand2);

  /// Greater than
  Comparison<D, V> greaterThan(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.greaterThan, operand2);

  /// Greater than or equal
  Comparison<D, V> greaterThanOrEqual(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.greaterThanOrEqual, operand2);

  /// Less than
  Comparison<D, V> lessThan(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.lessThan, operand2);

  /// Less than or equal
  Comparison<D, V> lessThanOrEqual(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.lessThanOrEqual, operand2);

  /// Like/Contains (if not specified auto wraps the right string OPERAND in a "%" for wildcard match)
  Comparison<D, V> like(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.like, operand2);

  /// NOT Like/Contains (if not specified auto wraps the right string OPERAND in a "%" for wildcard match)
  Comparison<D, V> notLike(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.notLike, operand2);
}

class TerminalRelationComparisonBuilder<D extends Dto<D>, V>
    extends ComparisonBuilder<D, V> {
  TerminalRelationComparisonBuilder(
    TerminalFieldPath<D, dynamic, V> fieldPath, [
    void Function(FilterExpression<D>)? handler,
  ]) : super._(fieldPath.asOperand(), handler);
}

class TerminalMultivalRelationComparisonBuilder<D extends Dto<D>, V>
    extends MultivalComparisonBuilder<D, V> {
  TerminalMultivalRelationComparisonBuilder(
    TerminalFieldPath<D, dynamic, V> fieldPath, [
    void Function(FilterExpression<D>)? handler,
  ]) : super._(fieldPath.asOperand(), handler);
}

class RelationComparisonBuilder<D extends Dto<D>, V extends Dto<V>>
    extends ComparisonBuilder<D, RelationDto<V>> {
  final FieldPath<D, V> fieldPath;

  RelationComparisonBuilder.fieldPath(
    this.fieldPath, [
    void Function(FilterExpression<D>)? handler,
  ]) : super._(fieldPath.asOperand(), handler);
}

class MultivalComparisonBuilder<D extends Dto<D>, V>
    extends ComparisonBuilder<D, V> {
  MultivalComparisonBuilder.field(super.field, [super.handler]) : super.field();

  MultivalComparisonBuilder._(super.operand1, [super.handler]) : super._();

  ComparisonBuilder<D, num> length() {
    var operand = ModifiedDtoFieldOperand<D, V, num>(operand1, "length");
    return ComparisonBuilder._(operand, handler);
  }

  ComparisonBuilder<D, V> each() {
    var operand = ModifiedDtoFieldOperand<D, V, V>(operand1, "each");
    return ComparisonBuilder._(operand, handler);
  }

  /// Any/At least one of Equal
  Comparison<D, V> anyEqual(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.anyEqual, operand2);

  /// Any/At least one of NOT equal
  Comparison<D, V> anyNotEqual(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.anyNotEqual, operand2);

  /// Any/At least one of Greater than
  Comparison<D, V> anyGreaterThan(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.anyGreaterThan, operand2);

  /// Any/At least one of Greater than or equal
  Comparison<D, V> anyGreaterThanOrEqual(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.anyGreaterThanOrEqual, operand2);

  /// Any/At least one of Less than
  Comparison<D, V> anyLessThan(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.anyLessThan, operand2);

  /// Any/At least one of Less than or equal
  Comparison<D, V> anyLessThanOrEqual(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.anyLessThanOrEqual, operand2);

  /// Any/At least one of Like/Contains (if not specified auto wraps the right string OPERAND in a "%" for wildcard match)
  Comparison<D, V> anyLike(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.anyLike, operand2);

  /// Any/At least one of NOT Like/Contains (if not specified auto wraps the right string OPERAND in a "%" for wildcard match)
  Comparison<D, V> anyNotLike(FilterOperand<D, V> operand2) =>
      _makeComparison(FilterOperator.anyNotLike, operand2);
}

class MultirelComparisonBuilder<D extends Dto<D>, V extends Dto<V>>
    extends MultivalComparisonBuilder<D, RelationDto<V>> {
  final FieldPath<D, V> fieldPath;

  MultirelComparisonBuilder.fieldPath(
    this.fieldPath, [
    void Function(FilterExpression<D>)? handler,
  ]) : super._(fieldPath.asOperand(), handler);
}

/// A class representing a logical AND combination of expressions.
class And<D extends Dto<D>> extends FilterExpression<D> {
  final List<FilterExpression<D>> expressions;

  static List<FilterExpression<D>> _flatten<D extends Dto<D>>(
    Iterable<FilterExpression<D>> expressions,
  ) {
    if (expressions.every((e) => e is! And<D>)) {
      return expressions.toList();
    }
    return expressions.expand((e) {
      switch (e) {
        case And<D> o:
          return o.expressions;
        default:
          {
            return [e];
          }
      }
    }).toList();
  }

  And(Iterable<FilterExpression<D>> expressions)
    : expressions = _flatten(expressions);

  @override
  void include(StringBuffer buffer) {
    if (expressions.isEmpty) {
      buffer.write('1 = 1');
      return;
    }
    if (expressions.length == 1) {
      expressions[0].include(buffer);
      return;
    }
    buffer.write('(');
    for (var (index, e) in expressions.indexed) {
      if (index != 0) buffer.write(' && ');
      e.include(buffer);
    }
    buffer.write(')');
  }
}

/// A class representing a logical OR combination of expressions.
class Or<D extends Dto<D>> extends FilterExpression<D> {
  final List<FilterExpression<D>> expressions;

  static List<FilterExpression<D>> _flatten<D extends Dto<D>>(
    Iterable<FilterExpression<D>> expressions,
  ) {
    if (expressions.every((e) => e is! Or)) {
      return expressions.toList();
    }
    return expressions.expand((e) {
      switch (e) {
        case Or<D> o:
          return o.expressions;
        default:
          {
            return [e];
          }
      }
    }).toList();
  }

  Or(Iterable<FilterExpression<D>> expressions)
    : expressions = _flatten(expressions);

  @override
  void include(StringBuffer buffer) {
    if (expressions.isEmpty) {
      buffer.write('1 = 0');
      return;
    }
    if (expressions.length == 1) {
      expressions[0].include(buffer);
      return;
    }
    buffer.write('(');
    for (var (index, e) in expressions.indexed) {
      if (index != 0) buffer.write(' || ');
      e.include(buffer);
    }
    buffer.write(')');
  }
}
