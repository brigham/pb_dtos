// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roles_patch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RolesPatchDto {

 String? get name; set name(String? value); List<RelationDto<PermissionsDto>>? get permissions; set permissions(List<RelationDto<PermissionsDto>>? value); List<RelationDto<PermissionsDto>>? get permissionsRemovals; set permissionsRemovals(List<RelationDto<PermissionsDto>>? value); List<RelationDto<PermissionsDto>>? get permissionsPrefix; set permissionsPrefix(List<RelationDto<PermissionsDto>>? value); List<RelationDto<PermissionsDto>>? get permissionsSuffix; set permissionsSuffix(List<RelationDto<PermissionsDto>>? value);
/// Create a copy of RolesPatchDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RolesPatchDtoCopyWith<RolesPatchDto> get copyWith => _$RolesPatchDtoCopyWithImpl<RolesPatchDto>(this as RolesPatchDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RolesPatchDto&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.permissions, permissions)&&const DeepCollectionEquality().equals(other.permissionsRemovals, permissionsRemovals)&&const DeepCollectionEquality().equals(other.permissionsPrefix, permissionsPrefix)&&const DeepCollectionEquality().equals(other.permissionsSuffix, permissionsSuffix));
}


@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(permissions),const DeepCollectionEquality().hash(permissionsRemovals),const DeepCollectionEquality().hash(permissionsPrefix),const DeepCollectionEquality().hash(permissionsSuffix));

@override
String toString() {
  return 'RolesPatchDto(name: $name, permissions: $permissions, permissionsRemovals: $permissionsRemovals, permissionsPrefix: $permissionsPrefix, permissionsSuffix: $permissionsSuffix)';
}


}

/// @nodoc
abstract mixin class $RolesPatchDtoCopyWith<$Res>  {
  factory $RolesPatchDtoCopyWith(RolesPatchDto value, $Res Function(RolesPatchDto) _then) = _$RolesPatchDtoCopyWithImpl;
@useResult
$Res call({
 String? name, List<RelationDto<PermissionsDto>>? permissions, List<RelationDto<PermissionsDto>>? permissionsRemovals, List<RelationDto<PermissionsDto>>? permissionsPrefix, List<RelationDto<PermissionsDto>>? permissionsSuffix
});




}
/// @nodoc
class _$RolesPatchDtoCopyWithImpl<$Res>
    implements $RolesPatchDtoCopyWith<$Res> {
  _$RolesPatchDtoCopyWithImpl(this._self, this._then);

  final RolesPatchDto _self;
  final $Res Function(RolesPatchDto) _then;

/// Create a copy of RolesPatchDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? permissions = freezed,Object? permissionsRemovals = freezed,Object? permissionsPrefix = freezed,Object? permissionsSuffix = freezed,}) {
  return _then(RolesPatchDto(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as List<RelationDto<PermissionsDto>>?,permissionsRemovals: freezed == permissionsRemovals ? _self.permissionsRemovals : permissionsRemovals // ignore: cast_nullable_to_non_nullable
as List<RelationDto<PermissionsDto>>?,permissionsPrefix: freezed == permissionsPrefix ? _self.permissionsPrefix : permissionsPrefix // ignore: cast_nullable_to_non_nullable
as List<RelationDto<PermissionsDto>>?,permissionsSuffix: freezed == permissionsSuffix ? _self.permissionsSuffix : permissionsSuffix // ignore: cast_nullable_to_non_nullable
as List<RelationDto<PermissionsDto>>?,
  ));
}

}


/// Adds pattern-matching-related methods to [RolesPatchDto].
extension RolesPatchDtoPatterns on RolesPatchDto {
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
