// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsersDto {

 String get id; String get password; String get tokenKey; String get email; bool get emailVisibility; bool get verified; String get name; FileDto? get avatar; List<RelationDto<RolesDto>> get roles; DateTime? get birthday; DateTime? get created; DateTime? get updated; UsersExpandDto? get expand; String? get passwordConfirm;
/// Create a copy of UsersDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsersDtoCopyWith<UsersDto> get copyWith => _$UsersDtoCopyWithImpl<UsersDto>(this as UsersDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsersDto&&(identical(other.id, id) || other.id == id)&&(identical(other.password, password) || other.password == password)&&(identical(other.tokenKey, tokenKey) || other.tokenKey == tokenKey)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVisibility, emailVisibility) || other.emailVisibility == emailVisibility)&&(identical(other.verified, verified) || other.verified == verified)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&const DeepCollectionEquality().equals(other.roles, roles)&&(identical(other.birthday, birthday) || other.birthday == birthday)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.expand, expand) || other.expand == expand)&&(identical(other.passwordConfirm, passwordConfirm) || other.passwordConfirm == passwordConfirm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,password,tokenKey,email,emailVisibility,verified,name,avatar,const DeepCollectionEquality().hash(roles),birthday,created,updated,expand,passwordConfirm);

@override
String toString() {
  return 'UsersDto(id: $id, password: $password, tokenKey: $tokenKey, email: $email, emailVisibility: $emailVisibility, verified: $verified, name: $name, avatar: $avatar, roles: $roles, birthday: $birthday, created: $created, updated: $updated, expand: $expand, passwordConfirm: $passwordConfirm)';
}


}

/// @nodoc
abstract mixin class $UsersDtoCopyWith<$Res>  {
  factory $UsersDtoCopyWith(UsersDto value, $Res Function(UsersDto) _then) = _$UsersDtoCopyWithImpl;
@useResult
$Res call({
 String id, String password, String tokenKey, String email, bool emailVisibility, bool verified, String name, FileDto? avatar, List<RelationDto<RolesDto>> roles, DateTime? birthday, DateTime? created, DateTime? updated, UsersExpandDto? expand, String? passwordConfirm
});




}
/// @nodoc
class _$UsersDtoCopyWithImpl<$Res>
    implements $UsersDtoCopyWith<$Res> {
  _$UsersDtoCopyWithImpl(this._self, this._then);

  final UsersDto _self;
  final $Res Function(UsersDto) _then;

/// Create a copy of UsersDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? password = null,Object? tokenKey = null,Object? email = null,Object? emailVisibility = null,Object? verified = null,Object? name = null,Object? avatar = freezed,Object? roles = null,Object? birthday = freezed,Object? created = freezed,Object? updated = freezed,Object? expand = freezed,Object? passwordConfirm = freezed,}) {
  return _then(UsersDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,tokenKey: null == tokenKey ? _self.tokenKey : tokenKey // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,emailVisibility: null == emailVisibility ? _self.emailVisibility : emailVisibility // ignore: cast_nullable_to_non_nullable
as bool,verified: null == verified ? _self.verified : verified // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as FileDto?,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<RelationDto<RolesDto>>,birthday: freezed == birthday ? _self.birthday : birthday // ignore: cast_nullable_to_non_nullable
as DateTime?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,expand: freezed == expand ? _self.expand : expand // ignore: cast_nullable_to_non_nullable
as UsersExpandDto?,passwordConfirm: freezed == passwordConfirm ? _self.passwordConfirm : passwordConfirm // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UsersDto].
extension UsersDtoPatterns on UsersDto {
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
