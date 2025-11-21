// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'follows_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowsDto {

 RelationDto<UsersDto> get follower; RelationDto<UsersDto> get following; String get id; FollowsExpandDto? get expand;
/// Create a copy of FollowsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FollowsDtoCopyWith<FollowsDto> get copyWith => _$FollowsDtoCopyWithImpl<FollowsDto>(this as FollowsDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FollowsDto&&(identical(other.follower, follower) || other.follower == follower)&&(identical(other.following, following) || other.following == following)&&(identical(other.id, id) || other.id == id)&&(identical(other.expand, expand) || other.expand == expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,follower,following,id,expand);

@override
String toString() {
  return 'FollowsDto(follower: $follower, following: $following, id: $id, expand: $expand)';
}


}

/// @nodoc
abstract mixin class $FollowsDtoCopyWith<$Res>  {
  factory $FollowsDtoCopyWith(FollowsDto value, $Res Function(FollowsDto) _then) = _$FollowsDtoCopyWithImpl;
@useResult
$Res call({
 RelationDto<UsersDto> follower, RelationDto<UsersDto> following, String id, FollowsExpandDto? expand
});




}
/// @nodoc
class _$FollowsDtoCopyWithImpl<$Res>
    implements $FollowsDtoCopyWith<$Res> {
  _$FollowsDtoCopyWithImpl(this._self, this._then);

  final FollowsDto _self;
  final $Res Function(FollowsDto) _then;

/// Create a copy of FollowsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? follower = null,Object? following = null,Object? id = null,Object? expand = freezed,}) {
  return _then(FollowsDto(
follower: null == follower ? _self.follower : follower // ignore: cast_nullable_to_non_nullable
as RelationDto<UsersDto>,following: null == following ? _self.following : following // ignore: cast_nullable_to_non_nullable
as RelationDto<UsersDto>,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expand: freezed == expand ? _self.expand : expand // ignore: cast_nullable_to_non_nullable
as FollowsExpandDto?,
  ));
}

}


/// Adds pattern-matching-related methods to [FollowsDto].
extension FollowsDtoPatterns on FollowsDto {
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
