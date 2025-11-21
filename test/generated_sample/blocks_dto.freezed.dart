// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blocks_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlocksDto {

 RelationDto<UsersDto> get blocker; RelationDto<UsersDto> get blocked; BlocksTypeEnum get type; String get id; BlocksExpandDto? get expand;
/// Create a copy of BlocksDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BlocksDtoCopyWith<BlocksDto> get copyWith => _$BlocksDtoCopyWithImpl<BlocksDto>(this as BlocksDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BlocksDto&&(identical(other.blocker, blocker) || other.blocker == blocker)&&(identical(other.blocked, blocked) || other.blocked == blocked)&&(identical(other.type, type) || other.type == type)&&(identical(other.id, id) || other.id == id)&&(identical(other.expand, expand) || other.expand == expand));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,blocker,blocked,type,id,expand);

@override
String toString() {
  return 'BlocksDto(blocker: $blocker, blocked: $blocked, type: $type, id: $id, expand: $expand)';
}


}

/// @nodoc
abstract mixin class $BlocksDtoCopyWith<$Res>  {
  factory $BlocksDtoCopyWith(BlocksDto value, $Res Function(BlocksDto) _then) = _$BlocksDtoCopyWithImpl;
@useResult
$Res call({
 RelationDto<UsersDto> blocker, RelationDto<UsersDto> blocked, BlocksTypeEnum type, String id, BlocksExpandDto? expand
});




}
/// @nodoc
class _$BlocksDtoCopyWithImpl<$Res>
    implements $BlocksDtoCopyWith<$Res> {
  _$BlocksDtoCopyWithImpl(this._self, this._then);

  final BlocksDto _self;
  final $Res Function(BlocksDto) _then;

/// Create a copy of BlocksDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? blocker = null,Object? blocked = null,Object? type = null,Object? id = null,Object? expand = freezed,}) {
  return _then(BlocksDto(
blocker: null == blocker ? _self.blocker : blocker // ignore: cast_nullable_to_non_nullable
as RelationDto<UsersDto>,blocked: null == blocked ? _self.blocked : blocked // ignore: cast_nullable_to_non_nullable
as RelationDto<UsersDto>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as BlocksTypeEnum,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,expand: freezed == expand ? _self.expand : expand // ignore: cast_nullable_to_non_nullable
as BlocksExpandDto?,
  ));
}

}


/// Adds pattern-matching-related methods to [BlocksDto].
extension BlocksDtoPatterns on BlocksDto {
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
