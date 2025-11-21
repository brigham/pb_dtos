// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friends_dto_expand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendsExpandDto {

 UsersDto? get requester; UsersDto? get accepter;
/// Create a copy of FriendsExpandDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendsExpandDtoCopyWith<FriendsExpandDto> get copyWith => _$FriendsExpandDtoCopyWithImpl<FriendsExpandDto>(this as FriendsExpandDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendsExpandDto&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.accepter, accepter) || other.accepter == accepter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requester,accepter);

@override
String toString() {
  return 'FriendsExpandDto(requester: $requester, accepter: $accepter)';
}


}

/// @nodoc
abstract mixin class $FriendsExpandDtoCopyWith<$Res>  {
  factory $FriendsExpandDtoCopyWith(FriendsExpandDto value, $Res Function(FriendsExpandDto) _then) = _$FriendsExpandDtoCopyWithImpl;
@useResult
$Res call({
 UsersDto? requester, UsersDto? accepter
});




}
/// @nodoc
class _$FriendsExpandDtoCopyWithImpl<$Res>
    implements $FriendsExpandDtoCopyWith<$Res> {
  _$FriendsExpandDtoCopyWithImpl(this._self, this._then);

  final FriendsExpandDto _self;
  final $Res Function(FriendsExpandDto) _then;

/// Create a copy of FriendsExpandDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requester = freezed,Object? accepter = freezed,}) {
  return _then(FriendsExpandDto(
requester: freezed == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as UsersDto?,accepter: freezed == accepter ? _self.accepter : accepter // ignore: cast_nullable_to_non_nullable
as UsersDto?,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendsExpandDto].
extension FriendsExpandDtoPatterns on FriendsExpandDto {
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
