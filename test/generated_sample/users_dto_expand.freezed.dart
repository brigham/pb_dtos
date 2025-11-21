// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_dto_expand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersExpandDto {

 List<RolesDto>? get roles; List<FollowsDto>? get followsViaFollower; List<FollowsDto>? get followsViaFollowing; List<FriendsDto>? get friendsViaRequester; List<FriendsDto>? get friendsViaAccepter; List<BlocksDto>? get blocksViaBlocker; List<BlocksDto>? get blocksViaBlocked; List<PostsDto>? get postsViaPoster; List<PostsDto>? get postsViaTagged;
/// Create a copy of UsersExpandDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersExpandDtoCopyWith<UsersExpandDto> get copyWith => _$UsersExpandDtoCopyWithImpl<UsersExpandDto>(this as UsersExpandDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersExpandDto&&const DeepCollectionEquality().equals(other.roles, roles)&&const DeepCollectionEquality().equals(other.followsViaFollower, followsViaFollower)&&const DeepCollectionEquality().equals(other.followsViaFollowing, followsViaFollowing)&&const DeepCollectionEquality().equals(other.friendsViaRequester, friendsViaRequester)&&const DeepCollectionEquality().equals(other.friendsViaAccepter, friendsViaAccepter)&&const DeepCollectionEquality().equals(other.blocksViaBlocker, blocksViaBlocker)&&const DeepCollectionEquality().equals(other.blocksViaBlocked, blocksViaBlocked)&&const DeepCollectionEquality().equals(other.postsViaPoster, postsViaPoster)&&const DeepCollectionEquality().equals(other.postsViaTagged, postsViaTagged));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(roles),const DeepCollectionEquality().hash(followsViaFollower),const DeepCollectionEquality().hash(followsViaFollowing),const DeepCollectionEquality().hash(friendsViaRequester),const DeepCollectionEquality().hash(friendsViaAccepter),const DeepCollectionEquality().hash(blocksViaBlocker),const DeepCollectionEquality().hash(blocksViaBlocked),const DeepCollectionEquality().hash(postsViaPoster),const DeepCollectionEquality().hash(postsViaTagged));

@override
String toString() {
  return 'UsersExpandDto(roles: $roles, followsViaFollower: $followsViaFollower, followsViaFollowing: $followsViaFollowing, friendsViaRequester: $friendsViaRequester, friendsViaAccepter: $friendsViaAccepter, blocksViaBlocker: $blocksViaBlocker, blocksViaBlocked: $blocksViaBlocked, postsViaPoster: $postsViaPoster, postsViaTagged: $postsViaTagged)';
}


}

/// @nodoc
abstract mixin class $UsersExpandDtoCopyWith<$Res>  {
  factory $UsersExpandDtoCopyWith(UsersExpandDto value, $Res Function(UsersExpandDto) _then) = _$UsersExpandDtoCopyWithImpl;
@useResult
$Res call({
 List<RolesDto>? roles, List<FollowsDto>? followsViaFollower, List<FollowsDto>? followsViaFollowing, List<FriendsDto>? friendsViaRequester, List<FriendsDto>? friendsViaAccepter, List<BlocksDto>? blocksViaBlocker, List<BlocksDto>? blocksViaBlocked, List<PostsDto>? postsViaPoster, List<PostsDto>? postsViaTagged
});




}
/// @nodoc
class _$UsersExpandDtoCopyWithImpl<$Res>
    implements $UsersExpandDtoCopyWith<$Res> {
  _$UsersExpandDtoCopyWithImpl(this._self, this._then);

  final UsersExpandDto _self;
  final $Res Function(UsersExpandDto) _then;

/// Create a copy of UsersExpandDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roles = freezed,Object? followsViaFollower = freezed,Object? followsViaFollowing = freezed,Object? friendsViaRequester = freezed,Object? friendsViaAccepter = freezed,Object? blocksViaBlocker = freezed,Object? blocksViaBlocked = freezed,Object? postsViaPoster = freezed,Object? postsViaTagged = freezed,}) {
  return _then(UsersExpandDto(
roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<RolesDto>?,followsViaFollower: freezed == followsViaFollower ? _self.followsViaFollower : followsViaFollower // ignore: cast_nullable_to_non_nullable
as List<FollowsDto>?,followsViaFollowing: freezed == followsViaFollowing ? _self.followsViaFollowing : followsViaFollowing // ignore: cast_nullable_to_non_nullable
as List<FollowsDto>?,friendsViaRequester: freezed == friendsViaRequester ? _self.friendsViaRequester : friendsViaRequester // ignore: cast_nullable_to_non_nullable
as List<FriendsDto>?,friendsViaAccepter: freezed == friendsViaAccepter ? _self.friendsViaAccepter : friendsViaAccepter // ignore: cast_nullable_to_non_nullable
as List<FriendsDto>?,blocksViaBlocker: freezed == blocksViaBlocker ? _self.blocksViaBlocker : blocksViaBlocker // ignore: cast_nullable_to_non_nullable
as List<BlocksDto>?,blocksViaBlocked: freezed == blocksViaBlocked ? _self.blocksViaBlocked : blocksViaBlocked // ignore: cast_nullable_to_non_nullable
as List<BlocksDto>?,postsViaPoster: freezed == postsViaPoster ? _self.postsViaPoster : postsViaPoster // ignore: cast_nullable_to_non_nullable
as List<PostsDto>?,postsViaTagged: freezed == postsViaTagged ? _self.postsViaTagged : postsViaTagged // ignore: cast_nullable_to_non_nullable
as List<PostsDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UsersExpandDto].
extension UsersExpandDtoPatterns on UsersExpandDto {
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
