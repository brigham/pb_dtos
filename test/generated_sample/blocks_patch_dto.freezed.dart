// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blocks_patch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BlocksPatchDto {

 RelationDto<UsersDto>? get blocker; set blocker(RelationDto<UsersDto>? value); RelationDto<UsersDto>? get blocked; set blocked(RelationDto<UsersDto>? value); BlocksTypeEnum? get type; set type(BlocksTypeEnum? value);
/// Create a copy of BlocksPatchDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlocksPatchDtoCopyWith<BlocksPatchDto> get copyWith => _$BlocksPatchDtoCopyWithImpl<BlocksPatchDto>(this as BlocksPatchDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlocksPatchDto&&(identical(other.blocker, blocker) || other.blocker == blocker)&&(identical(other.blocked, blocked) || other.blocked == blocked)&&(identical(other.type, type) || other.type == type));
}


@override
int get hashCode => Object.hash(runtimeType,blocker,blocked,type);

@override
String toString() {
  return 'BlocksPatchDto(blocker: $blocker, blocked: $blocked, type: $type)';
}


}

/// @nodoc
abstract mixin class $BlocksPatchDtoCopyWith<$Res>  {
  factory $BlocksPatchDtoCopyWith(BlocksPatchDto value, $Res Function(BlocksPatchDto) _then) = _$BlocksPatchDtoCopyWithImpl;
@useResult
$Res call({
 RelationDto<UsersDto>? blocker, RelationDto<UsersDto>? blocked, BlocksTypeEnum? type
});




}
/// @nodoc
class _$BlocksPatchDtoCopyWithImpl<$Res>
    implements $BlocksPatchDtoCopyWith<$Res> {
  _$BlocksPatchDtoCopyWithImpl(this._self, this._then);

  final BlocksPatchDto _self;
  final $Res Function(BlocksPatchDto) _then;

/// Create a copy of BlocksPatchDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blocker = freezed,Object? blocked = freezed,Object? type = freezed,}) {
  return _then(BlocksPatchDto(
blocker: freezed == blocker ? _self.blocker : blocker // ignore: cast_nullable_to_non_nullable
as RelationDto<UsersDto>?,blocked: freezed == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as RelationDto<UsersDto>?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BlocksTypeEnum?,
  ));
}

}


/// Adds pattern-matching-related methods to [BlocksPatchDto].
extension BlocksPatchDtoPatterns on BlocksPatchDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
