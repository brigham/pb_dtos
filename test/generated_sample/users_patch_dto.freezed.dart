// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_patch_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UsersPatchDto {

 String? get password; set password(String? value); String? get tokenKey; set tokenKey(String? value); String? get email; set email(String? value); bool? get emailVisibility; set emailVisibility(bool? value); bool? get verified; set verified(bool? value); String? get name; set name(String? value); FileDto? get avatar; set avatar(FileDto? value); List<RelationDto<RolesDto>>? get roles; set roles(List<RelationDto<RolesDto>>? value); List<RelationDto<RolesDto>>? get rolesRemovals; set rolesRemovals(List<RelationDto<RolesDto>>? value); List<RelationDto<RolesDto>>? get rolesPrefix; set rolesPrefix(List<RelationDto<RolesDto>>? value); List<RelationDto<RolesDto>>? get rolesSuffix; set rolesSuffix(List<RelationDto<RolesDto>>? value); DateTime? get birthday; set birthday(DateTime? value);
/// Create a copy of UsersPatchDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersPatchDtoCopyWith<UsersPatchDto> get copyWith => _$UsersPatchDtoCopyWithImpl<UsersPatchDto>(this as UsersPatchDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersPatchDto&&(identical(other.password, password) || other.password == password)&&(identical(other.tokenKey, tokenKey) || other.tokenKey == tokenKey)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVisibility, emailVisibility) || other.emailVisibility == emailVisibility)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&const DeepCollectionEquality().equals(other.roles, roles)&&const DeepCollectionEquality().equals(other.rolesRemovals, rolesRemovals)&&const DeepCollectionEquality().equals(other.rolesPrefix, rolesPrefix)&&const DeepCollectionEquality().equals(other.rolesSuffix, rolesSuffix)&&(identical(other.birthday, birthday) || other.birthday == birthday));
}


@override
int get hashCode => Object.hash(runtimeType,password,tokenKey,email,emailVisibility,verified,name,avatar,const DeepCollectionEquality().hash(roles),const DeepCollectionEquality().hash(rolesRemovals),const DeepCollectionEquality().hash(rolesPrefix),const DeepCollectionEquality().hash(rolesSuffix),birthday);

@override
String toString() {
  return 'UsersPatchDto(password: $password, tokenKey: $tokenKey, email: $email, emailVisibility: $emailVisibility, verified: $verified, name: $name, avatar: $avatar, roles: $roles, rolesRemovals: $rolesRemovals, rolesPrefix: $rolesPrefix, rolesSuffix: $rolesSuffix, birthday: $birthday)';
}


}

/// @nodoc
abstract mixin class $UsersPatchDtoCopyWith<$Res>  {
  factory $UsersPatchDtoCopyWith(UsersPatchDto value, $Res Function(UsersPatchDto) _then) = _$UsersPatchDtoCopyWithImpl;
@useResult
$Res call({
 String? password, String? tokenKey, String? email, bool? emailVisibility, bool? verified, String? name, FileDto? avatar, List<RelationDto<RolesDto>>? roles, List<RelationDto<RolesDto>>? rolesRemovals, List<RelationDto<RolesDto>>? rolesPrefix, List<RelationDto<RolesDto>>? rolesSuffix, DateTime? birthday
});




}
/// @nodoc
class _$UsersPatchDtoCopyWithImpl<$Res>
    implements $UsersPatchDtoCopyWith<$Res> {
  _$UsersPatchDtoCopyWithImpl(this._self, this._then);

  final UsersPatchDto _self;
  final $Res Function(UsersPatchDto) _then;

/// Create a copy of UsersPatchDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? password = freezed,Object? tokenKey = freezed,Object? email = freezed,Object? emailVisibility = freezed,Object? verified = freezed,Object? name = freezed,Object? avatar = freezed,Object? roles = freezed,Object? rolesRemovals = freezed,Object? rolesPrefix = freezed,Object? rolesSuffix = freezed,Object? birthday = freezed,}) {
  return _then(UsersPatchDto(
password: freezed == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String?,tokenKey: freezed == tokenKey ? _self.tokenKey : tokenKey // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVisibility: freezed == emailVisibility ? _self.emailVisibility : emailVisibility // ignore: cast_nullable_to_non_nullable
as bool?,verified: freezed == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as FileDto?,roles: freezed == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<RelationDto<RolesDto>>?,rolesRemovals: freezed == rolesRemovals ? _self.rolesRemovals : rolesRemovals // ignore: cast_nullable_to_non_nullable
as List<RelationDto<RolesDto>>?,rolesPrefix: freezed == rolesPrefix ? _self.rolesPrefix : rolesPrefix // ignore: cast_nullable_to_non_nullable
as List<RelationDto<RolesDto>>?,rolesSuffix: freezed == rolesSuffix ? _self.rolesSuffix : rolesSuffix // ignore: cast_nullable_to_non_nullable
as List<RelationDto<RolesDto>>?,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UsersPatchDto].
extension UsersPatchDtoPatterns on UsersPatchDto {
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
