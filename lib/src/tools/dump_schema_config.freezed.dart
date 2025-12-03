// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dump_schema_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DumpSchemaConfig {

 String? get pocketbaseUrl; LaunchConfig? get launch; String get outputDir; CredentialsConfig? get credentials; String? get suffix; bool get verbose;
/// Create a copy of DumpSchemaConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DumpSchemaConfigCopyWith<DumpSchemaConfig> get copyWith => _$DumpSchemaConfigCopyWithImpl<DumpSchemaConfig>(this as DumpSchemaConfig, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DumpSchemaConfig&&(identical(other.pocketbaseUrl, pocketbaseUrl) || other.pocketbaseUrl == pocketbaseUrl)&&(identical(other.launch, launch) || other.launch == launch)&&(identical(other.outputDir, outputDir) || other.outputDir == outputDir)&&(identical(other.credentials, credentials) || other.credentials == credentials)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.verbose, verbose) || other.verbose == verbose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,pocketbaseUrl,launch,outputDir,credentials,suffix,verbose);

@override
String toString() {
  return 'DumpSchemaConfig(pocketbaseUrl: $pocketbaseUrl, launch: $launch, outputDir: $outputDir, credentials: $credentials, suffix: $suffix, verbose: $verbose)';
}


}

/// @nodoc
abstract mixin class $DumpSchemaConfigCopyWith<$Res>  {
  factory $DumpSchemaConfigCopyWith(DumpSchemaConfig value, $Res Function(DumpSchemaConfig) _then) = _$DumpSchemaConfigCopyWithImpl;
@useResult
$Res call({
 String? pocketbaseUrl, LaunchConfig? launch, String outputDir, CredentialsConfig? credentials, String? suffix, bool verbose
});




}
/// @nodoc
class _$DumpSchemaConfigCopyWithImpl<$Res>
    implements $DumpSchemaConfigCopyWith<$Res> {
  _$DumpSchemaConfigCopyWithImpl(this._self, this._then);

  final DumpSchemaConfig _self;
  final $Res Function(DumpSchemaConfig) _then;

/// Create a copy of DumpSchemaConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pocketbaseUrl = freezed,Object? launch = freezed,Object? outputDir = null,Object? credentials = freezed,Object? suffix = freezed,Object? verbose = null,}) {
  return _then(DumpSchemaConfig(
pocketbaseUrl: freezed == pocketbaseUrl ? _self.pocketbaseUrl : pocketbaseUrl // ignore: cast_nullable_to_non_nullable
as String?,launch: freezed == launch ? _self.launch : launch // ignore: cast_nullable_to_non_nullable
as LaunchConfig?,outputDir: null == outputDir ? _self.outputDir : outputDir // ignore: cast_nullable_to_non_nullable
as String,credentials: freezed == credentials ? _self.credentials : credentials // ignore: cast_nullable_to_non_nullable
as CredentialsConfig?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,verbose: null == verbose ? _self.verbose : verbose // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DumpSchemaConfig].
extension DumpSchemaConfigPatterns on DumpSchemaConfig {
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
