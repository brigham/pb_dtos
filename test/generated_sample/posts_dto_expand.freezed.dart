// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_dto_expand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostsExpandDto {

 UsersDto? get poster; List<UsersDto>? get tagged;
/// Create a copy of PostsExpandDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostsExpandDtoCopyWith<PostsExpandDto> get copyWith => _$PostsExpandDtoCopyWithImpl<PostsExpandDto>(this as PostsExpandDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsExpandDto&&(identical(other.poster, poster) || other.poster == poster)&&const DeepCollectionEquality().equals(other.tagged, tagged));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,poster,const DeepCollectionEquality().hash(tagged));

@override
String toString() {
  return 'PostsExpandDto(poster: $poster, tagged: $tagged)';
}


}

/// @nodoc
abstract mixin class $PostsExpandDtoCopyWith<$Res>  {
  factory $PostsExpandDtoCopyWith(PostsExpandDto value, $Res Function(PostsExpandDto) _then) = _$PostsExpandDtoCopyWithImpl;
@useResult
$Res call({
 UsersDto? poster, List<UsersDto>? tagged
});




}
/// @nodoc
class _$PostsExpandDtoCopyWithImpl<$Res>
    implements $PostsExpandDtoCopyWith<$Res> {
  _$PostsExpandDtoCopyWithImpl(this._self, this._then);

  final PostsExpandDto _self;
  final $Res Function(PostsExpandDto) _then;

/// Create a copy of PostsExpandDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? poster = freezed,Object? tagged = freezed,}) {
  return _then(PostsExpandDto(
poster: freezed == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as UsersDto?,tagged: freezed == tagged ? _self.tagged : tagged // ignore: cast_nullable_to_non_nullable
as List<UsersDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostsExpandDto].
extension PostsExpandDtoPatterns on PostsExpandDto {
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
