// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friends_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendsDto {

 RelationDto<UsersDto> get requester; RelationDto<UsersDto> get accepter; FriendsStateEnum get state; String get id; FriendsExpandDto? get expand;
/// Create a copy of FriendsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FriendsDtoCopyWith<FriendsDto> get copyWith => _$FriendsDtoCopyWithImpl<FriendsDto>(this as FriendsDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FriendsDto&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.accepter, accepter) || other.accepter == accepter)&&(identical(other.state, state) || other.state == state)&&(identical(other.id, id) || other.id == id)&&(identical(other.expand, expand) || other.expand == expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,requester,accepter,state,id,expand);

@override
String toString() {
  return 'FriendsDto(requester: $requester, accepter: $accepter, state: $state, id: $id, expand: $expand)';
}


}

/// @nodoc
abstract mixin class $FriendsDtoCopyWith<$Res>  {
  factory $FriendsDtoCopyWith(FriendsDto value, $Res Function(FriendsDto) _then) = _$FriendsDtoCopyWithImpl;
@useResult
$Res call({
 RelationDto<UsersDto> requester, RelationDto<UsersDto> accepter, FriendsStateEnum state, String id, FriendsExpandDto? expand
});




}
/// @nodoc
class _$FriendsDtoCopyWithImpl<$Res>
    implements $FriendsDtoCopyWith<$Res> {
  _$FriendsDtoCopyWithImpl(this._self, this._then);

  final FriendsDto _self;
  final $Res Function(FriendsDto) _then;

/// Create a copy of FriendsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requester = null,Object? accepter = null,Object? state = null,Object? id = null,Object? expand = freezed,}) {
  return _then(FriendsDto(
requester: null == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as RelationDto<UsersDto>,accepter: null == accepter ? _self.accepter : accepter // ignore: cast_nullable_to_non_nullable
as RelationDto<UsersDto>,state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as FriendsStateEnum,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expand: freezed == expand ? _self.expand : expand // ignore: cast_nullable_to_non_nullable
as FriendsExpandDto?,
  ));
}

}


/// Adds pattern-matching-related methods to [FriendsDto].
extension FriendsDtoPatterns on FriendsDto {
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
