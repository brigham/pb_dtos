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

  ComparisonBuilder._modifiedField(
    DtoTypedField<D, V> field,
    String modifier, [
    this.handler,
  ]) : operand1 = ModifiedDtoFieldOperand(field, modifier);

  ComparisonBuilder.field(DtoTypedField<D, V> field, [this.handler])
    : operand1 = DtoFieldOperand<D, V>(field);

  ComparisonBuilder.literal(V? value, [this.handler])
    : operand1 = LiteralOperand<D, V>(value);

  Comparison<D, V> _makeComparison(FilterOperator operator, V value) {
    var comparison = Comparison<D, V>(
      operand1,
      operator,
      LiteralOperand<D, V>(value),
    );
    var handler = this.handler;
    if (handler != null) {
      handler(comparison);
    }
    return comparison;
  }

  ComparisonBuilder<D, V> lower() {
    // TODO: Make this type safe
    return ComparisonBuilder._modifiedField(
      (operand1 as DtoFieldOperand<D, V>).field,
      "lower",
      handler,
    );
  }

  Comparison<D, V> equal(V value) =>
      _makeComparison(FilterOperator.equal, value);

  /// NOT equal
  Comparison<D, V> notEqual(V value) =>
      _makeComparison(FilterOperator.notEqual, value);

  /// Greater than
  Comparison<D, V> greaterThan(V value) =>
      _makeComparison(FilterOperator.greaterThan, value);

  /// Greater than or equal
  Comparison<D, V> greaterThanOrEqual(V value) =>
      _makeComparison(FilterOperator.greaterThanOrEqual, value);

  /// Less than
  Comparison<D, V> lessThan(V value) =>
      _makeComparison(FilterOperator.lessThan, value);

  /// Less than or equal
  Comparison<D, V> lessThanOrEqual(V value) =>
      _makeComparison(FilterOperator.lessThanOrEqual, value);

  /// Like/Contains (if not specified auto wraps the right string OPERAND in a "%" for wildcard match)
  Comparison<D, V> like(V value) => _makeComparison(FilterOperator.like, value);

  /// NOT Like/Contains (if not specified auto wraps the right string OPERAND in a "%" for wildcard match)
  Comparison<D, V> notLike(V value) =>
      _makeComparison(FilterOperator.notLike, value);
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

  ComparisonBuilder<D, V> length() {
    // TODO: Make this type safe
    return ComparisonBuilder._modifiedField(
      (operand1 as DtoFieldOperand<D, V>).field,
      "length",
      handler,
    );
  }

  ComparisonBuilder<D, V> each() {
    // TODO: Make this type safe
    return ComparisonBuilder._modifiedField(
      (operand1 as DtoFieldOperand<D, V>).field,
      "each",
      handler,
    );
  }

  /// Any/At least one of Equal
  Comparison<D, V> anyEqual(V value) =>
      _makeComparison(FilterOperator.anyEqual, value);

  /// Any/At least one of NOT equal
  Comparison<D, V> anyNotEqual(V value) =>
      _makeComparison(FilterOperator.anyNotEqual, value);

  /// Any/At least one of Greater than
  Comparison<D, V> anyGreaterThan(V value) =>
      _makeComparison(FilterOperator.anyGreaterThan, value);

  /// Any/At least one of Greater than or equal
  Comparison<D, V> anyGreaterThanOrEqual(V value) =>
      _makeComparison(FilterOperator.anyGreaterThanOrEqual, value);

  /// Any/At least one of Less than
  Comparison<D, V> anyLessThan(V value) =>
      _makeComparison(FilterOperator.anyLessThan, value);

  /// Any/At least one of Less than or equal
  Comparison<D, V> anyLessThanOrEqual(V value) =>
      _makeComparison(FilterOperator.anyLessThanOrEqual, value);

  /// Any/At least one of Like/Contains (if not specified auto wraps the right string OPERAND in a "%" for wildcard match)
  Comparison<D, V> anyLike(V value) =>
      _makeComparison(FilterOperator.anyLike, value);

  /// Any/At least one of NOT Like/Contains (if not specified auto wraps the right string OPERAND in a "%" for wildcard match)
  Comparison<D, V> anyNotLike(V value) =>
      _makeComparison(FilterOperator.anyNotLike, value);
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

  And(this.expressions);

  @override
  void include(StringBuffer buffer) {
    for (var (index, e) in expressions.indexed) {
      if (index != 0) buffer.write(' && ');
      e.include(buffer);
    }
  }
}

/// A class representing a logical OR combination of expressions.
class Or<D extends Dto<D>> extends FilterExpression<D> {
  final List<FilterExpression<D>> expressions;

  Or(this.expressions);

  @override
  void include(StringBuffer buffer) {
    for (var (index, e) in expressions.indexed) {
      if (index != 0) buffer.write(' || ');
      e.include(buffer);
    }
  }
}
