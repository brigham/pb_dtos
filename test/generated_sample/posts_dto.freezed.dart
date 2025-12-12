// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostsDto {

 RelationDto<UsersDto> get poster; String get message; FileDto? get photo; String get link; GeopointDto get location; num get reviewStars; List<RelationDto<UsersDto>> get tagged; bool get draft; DateTime? get scheduled; PostsVisibilityEnum? get visibility; DateTime? get created; dynamic get metadata; String get id; PostsExpandDto? get expand;
/// Create a copy of PostsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostsDtoCopyWith<PostsDto> get copyWith => _$PostsDtoCopyWithImpl<PostsDto>(this as PostsDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostsDto&&(identical(other.poster, poster) || other.poster == poster)&&(identical(other.message, message) || other.message == message)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.link, link) || other.link == link)&&(identical(other.location, location) || other.location == location)&&(identical(other.reviewStars, reviewStars) || other.reviewStars == reviewStars)&&const DeepCollectionEquality().equals(other.tagged, tagged)&&(identical(other.draft, draft) || other.draft == draft)&&(identical(other.scheduled, scheduled) || other.scheduled == scheduled)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.created, created) || other.created == created)&&const DeepCollectionEquality().equals(other.metadata, metadata)&&(identical(other.id, id) || other.id == id)&&(identical(other.expand, expand) || other.expand == expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,poster,message,photo,link,location,reviewStars,const DeepCollectionEquality().hash(tagged),draft,scheduled,visibility,created,const DeepCollectionEquality().hash(metadata),id,expand);

@override
String toString() {
  return 'PostsDto(poster: $poster, message: $message, photo: $photo, link: $link, location: $location, reviewStars: $reviewStars, tagged: $tagged, draft: $draft, scheduled: $scheduled, visibility: $visibility, created: $created, metadata: $metadata, id: $id, expand: $expand)';
}


}

/// @nodoc
abstract mixin class $PostsDtoCopyWith<$Res>  {
  factory $PostsDtoCopyWith(PostsDto value, $Res Function(PostsDto) _then) = _$PostsDtoCopyWithImpl;
@useResult
$Res call({
 RelationDto<UsersDto> poster, String message, FileDto? photo, String link, GeopointDto location, num reviewStars, List<RelationDto<UsersDto>> tagged, bool draft, DateTime? scheduled, PostsVisibilityEnum? visibility, DateTime? created, dynamic metadata, String id, PostsExpandDto? expand
});




}
/// @nodoc
class _$PostsDtoCopyWithImpl<$Res>
    implements $PostsDtoCopyWith<$Res> {
  _$PostsDtoCopyWithImpl(this._self, this._then);

  final PostsDto _self;
  final $Res Function(PostsDto) _then;

/// Create a copy of PostsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? poster = null,Object? message = null,Object? photo = freezed,Object? link = null,Object? location = null,Object? reviewStars = null,Object? tagged = null,Object? draft = null,Object? scheduled = freezed,Object? visibility = freezed,Object? created = freezed,Object? metadata = freezed,Object? id = null,Object? expand = freezed,}) {
  return _then(PostsDto(
poster: null == poster ? _self.poster : poster // ignore: cast_nullable_to_non_nullable
as RelationDto<UsersDto>,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as FileDto?,link: null == link ? _self.link : link // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as GeopointDto,reviewStars: null == reviewStars ? _self.reviewStars : reviewStars // ignore: cast_nullable_to_non_nullable
as num,tagged: null == tagged ? _self.tagged : tagged // ignore: cast_nullable_to_non_nullable
as List<RelationDto<UsersDto>>,draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as bool,scheduled: freezed == scheduled ? _self.scheduled : scheduled // ignore: cast_nullable_to_non_nullable
as DateTime?,visibility: freezed == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as PostsVisibilityEnum?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as dynamic,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expand: freezed == expand ? _self.expand : expand // ignore: cast_nullable_to_non_nullable
as PostsExpandDto?,
  ));
}

}


/// Adds pattern-matching-related methods to [PostsDto].
extension PostsDtoPatterns on PostsDto {
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
