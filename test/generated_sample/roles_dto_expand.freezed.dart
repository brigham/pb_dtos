// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roles_dto_expand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RolesExpandDto {

 List<PermissionsDto>? get permissions; List<UsersDto>? get usersViaRoles;
/// Create a copy of RolesExpandDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RolesExpandDtoCopyWith<RolesExpandDto> get copyWith => _$RolesExpandDtoCopyWithImpl<RolesExpandDto>(this as RolesExpandDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RolesExpandDto&&const DeepCollectionEquality().equals(other.permissions, permissions)&&const DeepCollectionEquality().equals(other.usersViaRoles, usersViaRoles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(permissions),const DeepCollectionEquality().hash(usersViaRoles));

@override
String toString() {
  return 'RolesExpandDto(permissions: $permissions, usersViaRoles: $usersViaRoles)';
}


}

/// @nodoc
abstract mixin class $RolesExpandDtoCopyWith<$Res>  {
  factory $RolesExpandDtoCopyWith(RolesExpandDto value, $Res Function(RolesExpandDto) _then) = _$RolesExpandDtoCopyWithImpl;
@useResult
$Res call({
 List<PermissionsDto>? permissions, List<UsersDto>? usersViaRoles
});




}
/// @nodoc
class _$RolesExpandDtoCopyWithImpl<$Res>
    implements $RolesExpandDtoCopyWith<$Res> {
  _$RolesExpandDtoCopyWithImpl(this._self, this._then);

  final RolesExpandDto _self;
  final $Res Function(RolesExpandDto) _then;

/// Create a copy of RolesExpandDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? permissions = freezed,Object? usersViaRoles = freezed,}) {
  return _then(RolesExpandDto(
permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<PermissionsDto>?,usersViaRoles: freezed == usersViaRoles ? _self.usersViaRoles : usersViaRoles // ignore: cast_nullable_to_non_nullable
as List<UsersDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RolesExpandDto].
extension RolesExpandDtoPatterns on RolesExpandDto {
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
