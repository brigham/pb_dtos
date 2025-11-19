/// An enum representing the various filter operators supported by PocketBase.
enum FilterOperator {
  /// Equal
  equal,

  /// NOT equal
  notEqual,

  /// Greater than
  greaterThan,

  /// Greater than or equal
  greaterThanOrEqual,

  /// Less than
  lessThan,

  /// Less than or equal
  lessThanOrEqual,

  /// Like/Contains (if not specified auto wraps the right string OPERAND in a "%" for wildcard match)
  like,

  /// NOT Like/Contains (if not specified auto wraps the right string OPERAND in a "%" for wildcard match)
  notLike,

  /// Any/At least one of Equal
  anyEqual,

  /// Any/At least one of NOT equal
  anyNotEqual,

  /// Any/At least one of Greater than
  anyGreaterThan,

  /// Any/At least one of Greater than or equal
  anyGreaterThanOrEqual,

  /// Any/At least one of Less than
  anyLessThan,

  /// Any/At least one of Less than or equal
  anyLessThanOrEqual,

  /// Any/At least one of Like/Contains (if not specified auto wraps the right string OPERAND in a "%" for wildcard match)
  anyLike,

  /// Any/At least one of NOT Like/Contains (if not specified auto wraps the right string OPERAND in a "%" for wildcard match)
  anyNotLike;

  /// Returns the PocketBase string representation of the operator.
  String get pbName {
    switch (this) {
      case FilterOperator.equal:
        return '=';
      case FilterOperator.notEqual:
        return '!=';
      case FilterOperator.greaterThan:
        return '>';
      case FilterOperator.greaterThanOrEqual:
        return '>=';
      case FilterOperator.lessThan:
        return '<';
      case FilterOperator.lessThanOrEqual:
        return '<=';
      case FilterOperator.like:
        return '~';
      case FilterOperator.notLike:
        return '!~';
      case FilterOperator.anyEqual:
        return '?=';
      case FilterOperator.anyNotEqual:
        return '?!=';
      case FilterOperator.anyGreaterThan:
        return '?>';
      case FilterOperator.anyGreaterThanOrEqual:
        return '?>=';
      case FilterOperator.anyLessThan:
        return '?<';
      case FilterOperator.anyLessThanOrEqual:
        return '?<=';
      case FilterOperator.anyLike:
        return '?~';
      case FilterOperator.anyNotLike:
        return '?!~';
    }
  }
}
