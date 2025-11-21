// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friends_patch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FriendsPatchDto {

 RelationDto<UsersDto>? get requester; set requester(RelationDto<UsersDto>? value); RelationDto<UsersDto>? get accepter; set accepter(RelationDto<UsersDto>? value); FriendsStateEnum? get state; set state(FriendsStateEnum? value);
/// Create a copy of FriendsPatchDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendsPatchDtoCopyWith<FriendsPatchDto> get copyWith => _$FriendsPatchDtoCopyWithImpl<FriendsPatchDto>(this as FriendsPatchDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendsPatchDto&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.accepter, accepter) || other.accepter == accepter)&&(identical(other.state, state) || other.state == state));
}


@override
int get hashCode => Object.hash(runtimeType,requester,accepter,state);

@override
String toString() {
  return 'FriendsPatchDto(requester: $requester, accepter: $accepter, state: $state)';
}


}

/// @nodoc
abstract mixin class $FriendsPatchDtoCopyWith<$Res>  {
  factory $FriendsPatchDtoCopyWith(FriendsPatchDto value, $Res Function(FriendsPatchDto) _then) = _$FriendsPatchDtoCopyWithImpl;
@useResult
$Res call({
 RelationDto<UsersDto>? requester, RelationDto<UsersDto>? accepter, FriendsStateEnum? state
});




}
/// @nodoc
class _$FriendsPatchDtoCopyWithImpl<$Res>
    implements $FriendsPatchDtoCopyWith<$Res> {
  _$FriendsPatchDtoCopyWithImpl(this._self, this._then);

  final FriendsPatchDto _self;
  final $Res Function(FriendsPatchDto) _then;

/// Create a copy of FriendsPatchDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requester = freezed,Object? accepter = freezed,Object? state = freezed,}) {
  return _then(FriendsPatchDto(
requester: freezed == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as RelationDto<UsersDto>?,accepter: freezed == accepter ? _self.accepter : accepter // ignore: cast_nullable_to_non_nullable
as RelationDto<UsersDto>?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as FriendsStateEnum?,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendsPatchDto].
extension FriendsPatchDtoPatterns on FriendsPatchDto {
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
