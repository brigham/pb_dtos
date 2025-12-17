import 'package:meta/meta.dart';

import 'dto.dart';
import 'filter_expression.dart';

/// An interface for building type-safe filters for PocketBase queries.
///
/// Implementations provide methods to build `expression`.
abstract class DtoFilter<D extends Dto<D>> {
  FilterExpression<D>? get expression;

  @override
  String toString();
}

abstract class DtoFilterBase<D extends Dto<D>, F extends DtoFilterBase<D, F>>
    extends DtoFilter<D> {
  FilterExpression<D>? _expression;

  @protected
  F empty();

  @protected
  F build(void Function(F) builder) {
    var filter = empty();
    builder(filter);
    return filter;
  }

  /// Returns the current filter expression.
  @override
  FilterExpression<D>? get expression => _expression;

  @protected
  /// Sets the filter expression.
  void set(FilterExpression<D> expression) {
    _expression = expression;
  }

  /// Adds a new filter expression to the existing one.
  @protected
  void add(FilterExpression<D> expression) {
    set(_expression?.and(expression) ?? expression);
  }

  /// Adds a new filter expression to the existing one using the AND operator.
  ///
  /// This method is usually not needed, since expressions are naturally
  /// "and-ed" already.
  ///
  /// If no expression is set, the new expression becomes the current one.
  void and(Iterable<void Function(F)> builders) {
    var expressions = builders
        .map((builder) => build(builder).expression)
        .whereType<FilterExpression<D>>();
    var andExpression = And<D>(expressions);
    add(andExpression);
  }

  /// Adds a new filter expression to the existing one using the OR operator.
  ///
  /// Keep in mind that only the expression built by the `builders` will be
  /// "or-ed" together.
  ///
  /// If no expression is set, the new expression becomes the current one.
  void or(Iterable<void Function(F)> builders) {
    var expressions = builders
        .map((builder) => build(builder).expression)
        .whereType<FilterExpression<D>>();
    var orExpression = Or<D>(expressions);
    add(orExpression);
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

  // TODO: Support @collection -- However, this is only available through the API rules, so not super important.
  // TODO: Support geoDistance function with geoPoint.
}
