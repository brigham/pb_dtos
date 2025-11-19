import 'dto.dart';
import 'filter_expression.dart';

/// A class for building type-safe filters for PocketBase queries.
abstract class DtoFilter<D extends Dto<D>> {
  FilterExpression<D>? _expression;

  /// Returns the current filter expression.
  FilterExpression<D>? get expression => _expression;

  /// Sets the filter expression.
  void set(FilterExpression<D> expression) {
    _expression = expression;
  }

  void add(FilterExpression<D> expression) {
    set(_expression?.and(expression) ?? expression);
  }

  /// Adds a new filter expression to the existing one using the AND operator.
  ///
  /// If no expression is set, the new expression becomes the current one.
  void and(FilterExpression<D> expression) {
    if (_expression == null) {
      _expression = expression;
    } else {
      _expression = _expression!.and(expression);
    }
  }

  /// Adds a new filter expression to the existing one using the OR operator.
  ///
  /// If no expression is set, the new expression becomes the current one.
  void or(FilterExpression<D> expression) {
    if (_expression == null) {
      _expression = expression;
    } else {
      _expression = _expression!.or(expression);
    }
  }

  /// Returns the PocketBase string representation of the filter.
  @override
  String toString() {
    if (_expression == null) {
      return '';
    }
    StringBuffer buffer = StringBuffer();
    _expression!.include(buffer);
    return buffer.toString();
  }

  // Support filter field paths through back relations (yes, this does work).
  // TODO: Support @collection -- However, this is only available through the API rules, so not super important.
  // TODO: Support geoDistance function with geoPoint.
}
