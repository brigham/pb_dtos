// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_patch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PostsPatchDto {

 RelationDto<UsersDto>? get poster; set poster(RelationDto<UsersDto>? value); String? get message; set message(String? value); FileDto? get photo; set photo(FileDto? value); String? get link; set link(String? value); Map<String, dynamic>? get location; set location(Map<String, dynamic>? value); num? get reviewStars; set reviewStars(num? value); num? get reviewStarsAddend; set reviewStarsAddend(num? value); num? get reviewStarsSubtrahend; set reviewStarsSubtrahend(num? value); List<RelationDto<UsersDto>>? get tagged; set tagged(List<RelationDto<UsersDto>>? value); List<RelationDto<UsersDto>>? get taggedRemovals; set taggedRemovals(List<RelationDto<UsersDto>>? value); List<RelationDto<UsersDto>>? get taggedPrefix; set taggedPrefix(List<RelationDto<UsersDto>>? value); List<RelationDto<UsersDto>>? get taggedSuffix; set taggedSuffix(List<RelationDto<UsersDto>>? value); bool? get draft; set draft(bool? value); DateTime? get scheduled; set scheduled(DateTime? value);
/// Create a copy of PostsPatchDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostsPatchDtoCopyWith<PostsPatchDto> get copyWith => _$PostsPatchDtoCopyWithImpl<PostsPatchDto>(this as PostsPatchDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsPatchDto&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.message, message) || other.message == message)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.link, link) || other.link == link)&&const DeepCollectionEquality().equals(other.location, location)&&(identical(other.reviewStars, reviewStars) || other.reviewStars == reviewStars)&&(identical(other.reviewStarsAddend, reviewStarsAddend) || other.reviewStarsAddend == reviewStarsAddend)&&(identical(other.reviewStarsSubtrahend, reviewStarsSubtrahend) || other.reviewStarsSubtrahend == reviewStarsSubtrahend)&&const DeepCollectionEquality().equals(other.tagged, tagged)&&const DeepCollectionEquality().equals(other.taggedRemovals, taggedRemovals)&&const DeepCollectionEquality().equals(other.taggedPrefix, taggedPrefix)&&const DeepCollectionEquality().equals(other.taggedSuffix, taggedSuffix)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.scheduled, scheduled) || other.scheduled == scheduled));
}


@override
int get hashCode => Object.hash(runtimeType,poster,message,photo,link,const DeepCollectionEquality().hash(location),reviewStars,reviewStarsAddend,reviewStarsSubtrahend,const DeepCollectionEquality().hash(tagged),const DeepCollectionEquality().hash(taggedRemovals),const DeepCollectionEquality().hash(taggedPrefix),const DeepCollectionEquality().hash(taggedSuffix),draft,scheduled);

@override
String toString() {
  return 'PostsPatchDto(poster: $poster, message: $message, photo: $photo, link: $link, location: $location, reviewStars: $reviewStars, reviewStarsAddend: $reviewStarsAddend, reviewStarsSubtrahend: $reviewStarsSubtrahend, tagged: $tagged, taggedRemovals: $taggedRemovals, taggedPrefix: $taggedPrefix, taggedSuffix: $taggedSuffix, draft: $draft, scheduled: $scheduled)';
}


}

/// @nodoc
abstract mixin class $PostsPatchDtoCopyWith<$Res>  {
  factory $PostsPatchDtoCopyWith(PostsPatchDto value, $Res Function(PostsPatchDto) _then) = _$PostsPatchDtoCopyWithImpl;
@useResult
$Res call({
 RelationDto<UsersDto>? poster, String? message, FileDto? photo, String? link, Map<String, dynamic>? location, num? reviewStars, num? reviewStarsAddend, num? reviewStarsSubtrahend, List<RelationDto<UsersDto>>? tagged, List<RelationDto<UsersDto>>? taggedRemovals, List<RelationDto<UsersDto>>? taggedPrefix, List<RelationDto<UsersDto>>? taggedSuffix, bool? draft, DateTime? scheduled
});




}
/// @nodoc
class _$PostsPatchDtoCopyWithImpl<$Res>
    implements $PostsPatchDtoCopyWith<$Res> {
  _$PostsPatchDtoCopyWithImpl(this._self, this._then);

  final PostsPatchDto _self;
  final $Res Function(PostsPatchDto) _then;

/// Create a copy of PostsPatchDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? poster = freezed,Object? message = freezed,Object? photo = freezed,Object? link = freezed,Object? location = freezed,Object? reviewStars = freezed,Object? reviewStarsAddend = freezed,Object? reviewStarsSubtrahend = freezed,Object? tagged = freezed,Object? taggedRemovals = freezed,Object? taggedPrefix = freezed,Object? taggedSuffix = freezed,Object? draft = freezed,Object? scheduled = freezed,}) {
  return _then(PostsPatchDto(
poster: freezed == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as RelationDto<UsersDto>?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as FileDto?,link: freezed == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,reviewStars: freezed == reviewStars ? _self.reviewStars : reviewStars // ignore: cast_nullable_to_non_nullable
as num?,reviewStarsAddend: freezed == reviewStarsAddend ? _self.reviewStarsAddend : reviewStarsAddend // ignore: cast_nullable_to_non_nullable
as num?,reviewStarsSubtrahend: freezed == reviewStarsSubtrahend ? _self.reviewStarsSubtrahend : reviewStarsSubtrahend // ignore: cast_nullable_to_non_nullable
as num?,tagged: freezed == tagged ? _self.tagged : tagged // ignore: cast_nullable_to_non_nullable
as List<RelationDto<UsersDto>>?,taggedRemovals: freezed == taggedRemovals ? _self.taggedRemovals : taggedRemovals // ignore: cast_nullable_to_non_nullable
as List<RelationDto<UsersDto>>?,taggedPrefix: freezed == taggedPrefix ? _self.taggedPrefix : taggedPrefix // ignore: cast_nullable_to_non_nullable
as List<RelationDto<UsersDto>>?,taggedSuffix: freezed == taggedSuffix ? _self.taggedSuffix : taggedSuffix // ignore: cast_nullable_to_non_nullable
as List<RelationDto<UsersDto>>?,draft: freezed == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as bool?,scheduled: freezed == scheduled ? _self.scheduled : scheduled // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostsPatchDto].
extension PostsPatchDtoPatterns on PostsPatchDto {
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
