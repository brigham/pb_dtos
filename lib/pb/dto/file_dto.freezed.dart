// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FileDto {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileDto);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FileDto()';
}


}

/// @nodoc
class $FileDtoCopyWith<$Res>  {
$FileDtoCopyWith(FileDto _, $Res Function(FileDto) __);
}


/// Adds pattern-matching-related methods to [FileDto].
extension FileDtoPatterns on FileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RemoteFileDto value)?  remote,TResult Function( _FromStreamFileDto value)?  fromStream,TResult Function( _FromBytesFileDto value)?  fromBytes,TResult Function( _FromStringFileDto value)?  fromString,TResult Function( _FromPathFileDto value)?  fromPath,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteFileDto() when remote != null:
return remote(_that);case _FromStreamFileDto() when fromStream != null:
return fromStream(_that);case _FromBytesFileDto() when fromBytes != null:
return fromBytes(_that);case _FromStringFileDto() when fromString != null:
return fromString(_that);case _FromPathFileDto() when fromPath != null:
return fromPath(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RemoteFileDto value)  remote,required TResult Function( _FromStreamFileDto value)  fromStream,required TResult Function( _FromBytesFileDto value)  fromBytes,required TResult Function( _FromStringFileDto value)  fromString,required TResult Function( _FromPathFileDto value)  fromPath,}){
final _that = this;
switch (_that) {
case _RemoteFileDto():
return remote(_that);case _FromStreamFileDto():
return fromStream(_that);case _FromBytesFileDto():
return fromBytes(_that);case _FromStringFileDto():
return fromString(_that);case _FromPathFileDto():
return fromPath(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RemoteFileDto value)?  remote,TResult? Function( _FromStreamFileDto value)?  fromStream,TResult? Function( _FromBytesFileDto value)?  fromBytes,TResult? Function( _FromStringFileDto value)?  fromString,TResult? Function( _FromPathFileDto value)?  fromPath,}){
final _that = this;
switch (_that) {
case _RemoteFileDto() when remote != null:
return remote(_that);case _FromStreamFileDto() when fromStream != null:
return fromStream(_that);case _FromBytesFileDto() when fromBytes != null:
return fromBytes(_that);case _FromStringFileDto() when fromString != null:
return fromString(_that);case _FromPathFileDto() when fromPath != null:
return fromPath(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String name)?  remote,TResult Function( Stream<List<int>> stream,  int length,  String? filename,  http.MediaType? contentType)?  fromStream,TResult Function( FutureOr<List<int>> value,  String? filename,  http.MediaType? contentType)?  fromBytes,TResult Function( String value,  String? filename,  http.MediaType? contentType)?  fromString,TResult Function( String field,  String filePath,  String? filename,  http.MediaType? contentType)?  fromPath,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteFileDto() when remote != null:
return remote(_that.name);case _FromStreamFileDto() when fromStream != null:
return fromStream(_that.stream,_that.length,_that.filename,_that.contentType);case _FromBytesFileDto() when fromBytes != null:
return fromBytes(_that.value,_that.filename,_that.contentType);case _FromStringFileDto() when fromString != null:
return fromString(_that.value,_that.filename,_that.contentType);case _FromPathFileDto() when fromPath != null:
return fromPath(_that.field,_that.filePath,_that.filename,_that.contentType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String name)  remote,required TResult Function( Stream<List<int>> stream,  int length,  String? filename,  http.MediaType? contentType)  fromStream,required TResult Function( FutureOr<List<int>> value,  String? filename,  http.MediaType? contentType)  fromBytes,required TResult Function( String value,  String? filename,  http.MediaType? contentType)  fromString,required TResult Function( String field,  String filePath,  String? filename,  http.MediaType? contentType)  fromPath,}) {final _that = this;
switch (_that) {
case _RemoteFileDto():
return remote(_that.name);case _FromStreamFileDto():
return fromStream(_that.stream,_that.length,_that.filename,_that.contentType);case _FromBytesFileDto():
return fromBytes(_that.value,_that.filename,_that.contentType);case _FromStringFileDto():
return fromString(_that.value,_that.filename,_that.contentType);case _FromPathFileDto():
return fromPath(_that.field,_that.filePath,_that.filename,_that.contentType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String name)?  remote,TResult? Function( Stream<List<int>> stream,  int length,  String? filename,  http.MediaType? contentType)?  fromStream,TResult? Function( FutureOr<List<int>> value,  String? filename,  http.MediaType? contentType)?  fromBytes,TResult? Function( String value,  String? filename,  http.MediaType? contentType)?  fromString,TResult? Function( String field,  String filePath,  String? filename,  http.MediaType? contentType)?  fromPath,}) {final _that = this;
switch (_that) {
case _RemoteFileDto() when remote != null:
return remote(_that.name);case _FromStreamFileDto() when fromStream != null:
return fromStream(_that.stream,_that.length,_that.filename,_that.contentType);case _FromBytesFileDto() when fromBytes != null:
return fromBytes(_that.value,_that.filename,_that.contentType);case _FromStringFileDto() when fromString != null:
return fromString(_that.value,_that.filename,_that.contentType);case _FromPathFileDto() when fromPath != null:
return fromPath(_that.field,_that.filePath,_that.filename,_that.contentType);case _:
  return null;

}
}

}






/// @nodoc
mixin _$RemoteFileDto {

 String get name;
/// Create a copy of _RemoteFileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteFileDtoCopyWith<_RemoteFileDto> get copyWith => __$RemoteFileDtoCopyWithImpl<_RemoteFileDto>(this as _RemoteFileDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteFileDto&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return '_RemoteFileDto(name: $name)';
}


}

/// @nodoc
abstract mixin class _$RemoteFileDtoCopyWith<$Res> implements $FileDtoCopyWith<$Res> {
  factory _$RemoteFileDtoCopyWith(_RemoteFileDto value, $Res Function(_RemoteFileDto) _then) = __$RemoteFileDtoCopyWithImpl;
@useResult
$Res call({
 String name
});




}
/// @nodoc
class __$RemoteFileDtoCopyWithImpl<$Res>
    implements _$RemoteFileDtoCopyWith<$Res> {
  __$RemoteFileDtoCopyWithImpl(this._self, this._then);

  final _RemoteFileDto _self;
  final $Res Function(_RemoteFileDto) _then;

/// Create a copy of _RemoteFileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [_RemoteFileDto].
extension _RemoteFileDtoPatterns on _RemoteFileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( __RemoteFileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case __RemoteFileDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( __RemoteFileDto value)  $default,){
final _that = this;
switch (_that) {
case __RemoteFileDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( __RemoteFileDto value)?  $default,){
final _that = this;
switch (_that) {
case __RemoteFileDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case __RemoteFileDto() when $default != null:
return $default(_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name)  $default,) {final _that = this;
switch (_that) {
case __RemoteFileDto():
return $default(_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name)?  $default,) {final _that = this;
switch (_that) {
case __RemoteFileDto() when $default != null:
return $default(_that.name);case _:
  return null;

}
}

}

/// @nodoc


class __RemoteFileDto extends _RemoteFileDto {
  const __RemoteFileDto(this.name): super._();
  

@override final  String name;

/// Create a copy of _RemoteFileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$_RemoteFileDtoCopyWith<__RemoteFileDto> get copyWith => __$_RemoteFileDtoCopyWithImpl<__RemoteFileDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is __RemoteFileDto&&(identical(other.name, name) || other.name == name));
}


@override
int get hashCode => Object.hash(runtimeType,name);

@override
String toString() {
  return '_RemoteFileDto(name: $name)';
}


}

/// @nodoc
abstract mixin class _$_RemoteFileDtoCopyWith<$Res> implements _$RemoteFileDtoCopyWith<$Res> {
  factory _$_RemoteFileDtoCopyWith(__RemoteFileDto value, $Res Function(__RemoteFileDto) _then) = __$_RemoteFileDtoCopyWithImpl;
@override @useResult
$Res call({
 String name
});




}
/// @nodoc
class __$_RemoteFileDtoCopyWithImpl<$Res>
    implements _$_RemoteFileDtoCopyWith<$Res> {
  __$_RemoteFileDtoCopyWithImpl(this._self, this._then);

  final __RemoteFileDto _self;
  final $Res Function(__RemoteFileDto) _then;

/// Create a copy of _RemoteFileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,}) {
  return _then(__RemoteFileDto(
null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$FromStreamFileDto {

 Stream<List<int>> get stream; int get length; String? get filename; http.MediaType? get contentType;
/// Create a copy of _FromStreamFileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FromStreamFileDtoCopyWith<_FromStreamFileDto> get copyWith => __$FromStreamFileDtoCopyWithImpl<_FromStreamFileDto>(this as _FromStreamFileDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FromStreamFileDto&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.length, length) || other.length == length)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}


@override
int get hashCode => Object.hash(runtimeType,stream,length,filename,contentType);

@override
String toString() {
  return '_FromStreamFileDto(stream: $stream, length: $length, filename: $filename, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class _$FromStreamFileDtoCopyWith<$Res> implements $FileDtoCopyWith<$Res> {
  factory _$FromStreamFileDtoCopyWith(_FromStreamFileDto value, $Res Function(_FromStreamFileDto) _then) = __$FromStreamFileDtoCopyWithImpl;
@useResult
$Res call({
 Stream<List<int>> stream, int length, String? filename, http.MediaType? contentType
});




}
/// @nodoc
class __$FromStreamFileDtoCopyWithImpl<$Res>
    implements _$FromStreamFileDtoCopyWith<$Res> {
  __$FromStreamFileDtoCopyWithImpl(this._self, this._then);

  final _FromStreamFileDto _self;
  final $Res Function(_FromStreamFileDto) _then;

/// Create a copy of _FromStreamFileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? stream = null,Object? length = null,Object? filename = freezed,Object? contentType = freezed,}) {
  return _then(_self.copyWith(
stream: null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as Stream<List<int>>,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as http.MediaType?,
  ));
}

}


/// Adds pattern-matching-related methods to [_FromStreamFileDto].
extension _FromStreamFileDtoPatterns on _FromStreamFileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( __FromStreamFileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case __FromStreamFileDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( __FromStreamFileDto value)  $default,){
final _that = this;
switch (_that) {
case __FromStreamFileDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( __FromStreamFileDto value)?  $default,){
final _that = this;
switch (_that) {
case __FromStreamFileDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Stream<List<int>> stream,  int length,  String? filename,  http.MediaType? contentType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case __FromStreamFileDto() when $default != null:
return $default(_that.stream,_that.length,_that.filename,_that.contentType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Stream<List<int>> stream,  int length,  String? filename,  http.MediaType? contentType)  $default,) {final _that = this;
switch (_that) {
case __FromStreamFileDto():
return $default(_that.stream,_that.length,_that.filename,_that.contentType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Stream<List<int>> stream,  int length,  String? filename,  http.MediaType? contentType)?  $default,) {final _that = this;
switch (_that) {
case __FromStreamFileDto() when $default != null:
return $default(_that.stream,_that.length,_that.filename,_that.contentType);case _:
  return null;

}
}

}

/// @nodoc


class __FromStreamFileDto extends _FromStreamFileDto {
  const __FromStreamFileDto(this.stream, this.length, {this.filename, this.contentType}): super._();
  

@override final  Stream<List<int>> stream;
@override final  int length;
@override final  String? filename;
@override final  http.MediaType? contentType;

/// Create a copy of _FromStreamFileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$_FromStreamFileDtoCopyWith<__FromStreamFileDto> get copyWith => __$_FromStreamFileDtoCopyWithImpl<__FromStreamFileDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is __FromStreamFileDto&&(identical(other.stream, stream) || other.stream == stream)&&(identical(other.length, length) || other.length == length)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}


@override
int get hashCode => Object.hash(runtimeType,stream,length,filename,contentType);

@override
String toString() {
  return '_FromStreamFileDto(stream: $stream, length: $length, filename: $filename, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class _$_FromStreamFileDtoCopyWith<$Res> implements _$FromStreamFileDtoCopyWith<$Res> {
  factory _$_FromStreamFileDtoCopyWith(__FromStreamFileDto value, $Res Function(__FromStreamFileDto) _then) = __$_FromStreamFileDtoCopyWithImpl;
@override @useResult
$Res call({
 Stream<List<int>> stream, int length, String? filename, http.MediaType? contentType
});




}
/// @nodoc
class __$_FromStreamFileDtoCopyWithImpl<$Res>
    implements _$_FromStreamFileDtoCopyWith<$Res> {
  __$_FromStreamFileDtoCopyWithImpl(this._self, this._then);

  final __FromStreamFileDto _self;
  final $Res Function(__FromStreamFileDto) _then;

/// Create a copy of _FromStreamFileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? stream = null,Object? length = null,Object? filename = freezed,Object? contentType = freezed,}) {
  return _then(__FromStreamFileDto(
null == stream ? _self.stream : stream // ignore: cast_nullable_to_non_nullable
as Stream<List<int>>,null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as int,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as http.MediaType?,
  ));
}


}

/// @nodoc
mixin _$FromBytesFileDto {

 FutureOr<List<int>> get value; String? get filename; http.MediaType? get contentType;
/// Create a copy of _FromBytesFileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FromBytesFileDtoCopyWith<_FromBytesFileDto> get copyWith => __$FromBytesFileDtoCopyWithImpl<_FromBytesFileDto>(this as _FromBytesFileDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FromBytesFileDto&&(identical(other.value, value) || other.value == value)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}


@override
int get hashCode => Object.hash(runtimeType,value,filename,contentType);

@override
String toString() {
  return '_FromBytesFileDto(value: $value, filename: $filename, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class _$FromBytesFileDtoCopyWith<$Res> implements $FileDtoCopyWith<$Res> {
  factory _$FromBytesFileDtoCopyWith(_FromBytesFileDto value, $Res Function(_FromBytesFileDto) _then) = __$FromBytesFileDtoCopyWithImpl;
@useResult
$Res call({
 FutureOr<List<int>> value, String? filename, http.MediaType? contentType
});




}
/// @nodoc
class __$FromBytesFileDtoCopyWithImpl<$Res>
    implements _$FromBytesFileDtoCopyWith<$Res> {
  __$FromBytesFileDtoCopyWithImpl(this._self, this._then);

  final _FromBytesFileDto _self;
  final $Res Function(_FromBytesFileDto) _then;

/// Create a copy of _FromBytesFileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? filename = freezed,Object? contentType = freezed,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as FutureOr<List<int>>,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as http.MediaType?,
  ));
}

}


/// Adds pattern-matching-related methods to [_FromBytesFileDto].
extension _FromBytesFileDtoPatterns on _FromBytesFileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( __FromBytesFileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case __FromBytesFileDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( __FromBytesFileDto value)  $default,){
final _that = this;
switch (_that) {
case __FromBytesFileDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( __FromBytesFileDto value)?  $default,){
final _that = this;
switch (_that) {
case __FromBytesFileDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( FutureOr<List<int>> value,  String? filename,  http.MediaType? contentType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case __FromBytesFileDto() when $default != null:
return $default(_that.value,_that.filename,_that.contentType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( FutureOr<List<int>> value,  String? filename,  http.MediaType? contentType)  $default,) {final _that = this;
switch (_that) {
case __FromBytesFileDto():
return $default(_that.value,_that.filename,_that.contentType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( FutureOr<List<int>> value,  String? filename,  http.MediaType? contentType)?  $default,) {final _that = this;
switch (_that) {
case __FromBytesFileDto() when $default != null:
return $default(_that.value,_that.filename,_that.contentType);case _:
  return null;

}
}

}

/// @nodoc


class __FromBytesFileDto extends _FromBytesFileDto {
  const __FromBytesFileDto(this.value, {this.filename, this.contentType}): super._();
  

@override final  FutureOr<List<int>> value;
@override final  String? filename;
@override final  http.MediaType? contentType;

/// Create a copy of _FromBytesFileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$_FromBytesFileDtoCopyWith<__FromBytesFileDto> get copyWith => __$_FromBytesFileDtoCopyWithImpl<__FromBytesFileDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is __FromBytesFileDto&&(identical(other.value, value) || other.value == value)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}


@override
int get hashCode => Object.hash(runtimeType,value,filename,contentType);

@override
String toString() {
  return '_FromBytesFileDto(value: $value, filename: $filename, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class _$_FromBytesFileDtoCopyWith<$Res> implements _$FromBytesFileDtoCopyWith<$Res> {
  factory _$_FromBytesFileDtoCopyWith(__FromBytesFileDto value, $Res Function(__FromBytesFileDto) _then) = __$_FromBytesFileDtoCopyWithImpl;
@override @useResult
$Res call({
 FutureOr<List<int>> value, String? filename, http.MediaType? contentType
});




}
/// @nodoc
class __$_FromBytesFileDtoCopyWithImpl<$Res>
    implements _$_FromBytesFileDtoCopyWith<$Res> {
  __$_FromBytesFileDtoCopyWithImpl(this._self, this._then);

  final __FromBytesFileDto _self;
  final $Res Function(__FromBytesFileDto) _then;

/// Create a copy of _FromBytesFileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? filename = freezed,Object? contentType = freezed,}) {
  return _then(__FromBytesFileDto(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as FutureOr<List<int>>,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as http.MediaType?,
  ));
}


}

/// @nodoc
mixin _$FromStringFileDto {

 String get value; String? get filename; http.MediaType? get contentType;
/// Create a copy of _FromStringFileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FromStringFileDtoCopyWith<_FromStringFileDto> get copyWith => __$FromStringFileDtoCopyWithImpl<_FromStringFileDto>(this as _FromStringFileDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FromStringFileDto&&(identical(other.value, value) || other.value == value)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}


@override
int get hashCode => Object.hash(runtimeType,value,filename,contentType);

@override
String toString() {
  return '_FromStringFileDto(value: $value, filename: $filename, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class _$FromStringFileDtoCopyWith<$Res> implements $FileDtoCopyWith<$Res> {
  factory _$FromStringFileDtoCopyWith(_FromStringFileDto value, $Res Function(_FromStringFileDto) _then) = __$FromStringFileDtoCopyWithImpl;
@useResult
$Res call({
 String value, String? filename, http.MediaType? contentType
});




}
/// @nodoc
class __$FromStringFileDtoCopyWithImpl<$Res>
    implements _$FromStringFileDtoCopyWith<$Res> {
  __$FromStringFileDtoCopyWithImpl(this._self, this._then);

  final _FromStringFileDto _self;
  final $Res Function(_FromStringFileDto) _then;

/// Create a copy of _FromStringFileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? filename = freezed,Object? contentType = freezed,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as http.MediaType?,
  ));
}

}


/// Adds pattern-matching-related methods to [_FromStringFileDto].
extension _FromStringFileDtoPatterns on _FromStringFileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( __FromStringFileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case __FromStringFileDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( __FromStringFileDto value)  $default,){
final _that = this;
switch (_that) {
case __FromStringFileDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( __FromStringFileDto value)?  $default,){
final _that = this;
switch (_that) {
case __FromStringFileDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  String? filename,  http.MediaType? contentType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case __FromStringFileDto() when $default != null:
return $default(_that.value,_that.filename,_that.contentType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  String? filename,  http.MediaType? contentType)  $default,) {final _that = this;
switch (_that) {
case __FromStringFileDto():
return $default(_that.value,_that.filename,_that.contentType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  String? filename,  http.MediaType? contentType)?  $default,) {final _that = this;
switch (_that) {
case __FromStringFileDto() when $default != null:
return $default(_that.value,_that.filename,_that.contentType);case _:
  return null;

}
}

}

/// @nodoc


class __FromStringFileDto extends _FromStringFileDto {
  const __FromStringFileDto(this.value, {this.filename, this.contentType}): super._();
  

@override final  String value;
@override final  String? filename;
@override final  http.MediaType? contentType;

/// Create a copy of _FromStringFileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$_FromStringFileDtoCopyWith<__FromStringFileDto> get copyWith => __$_FromStringFileDtoCopyWithImpl<__FromStringFileDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is __FromStringFileDto&&(identical(other.value, value) || other.value == value)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}


@override
int get hashCode => Object.hash(runtimeType,value,filename,contentType);

@override
String toString() {
  return '_FromStringFileDto(value: $value, filename: $filename, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class _$_FromStringFileDtoCopyWith<$Res> implements _$FromStringFileDtoCopyWith<$Res> {
  factory _$_FromStringFileDtoCopyWith(__FromStringFileDto value, $Res Function(__FromStringFileDto) _then) = __$_FromStringFileDtoCopyWithImpl;
@override @useResult
$Res call({
 String value, String? filename, http.MediaType? contentType
});




}
/// @nodoc
class __$_FromStringFileDtoCopyWithImpl<$Res>
    implements _$_FromStringFileDtoCopyWith<$Res> {
  __$_FromStringFileDtoCopyWithImpl(this._self, this._then);

  final __FromStringFileDto _self;
  final $Res Function(__FromStringFileDto) _then;

/// Create a copy of _FromStringFileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? filename = freezed,Object? contentType = freezed,}) {
  return _then(__FromStringFileDto(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as http.MediaType?,
  ));
}


}

/// @nodoc
mixin _$FromPathFileDto {

 String get field; String get filePath; String? get filename; http.MediaType? get contentType;
/// Create a copy of _FromPathFileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FromPathFileDtoCopyWith<_FromPathFileDto> get copyWith => __$FromPathFileDtoCopyWithImpl<_FromPathFileDto>(this as _FromPathFileDto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FromPathFileDto&&(identical(other.field, field) || other.field == field)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}


@override
int get hashCode => Object.hash(runtimeType,field,filePath,filename,contentType);

@override
String toString() {
  return '_FromPathFileDto(field: $field, filePath: $filePath, filename: $filename, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class _$FromPathFileDtoCopyWith<$Res> implements $FileDtoCopyWith<$Res> {
  factory _$FromPathFileDtoCopyWith(_FromPathFileDto value, $Res Function(_FromPathFileDto) _then) = __$FromPathFileDtoCopyWithImpl;
@useResult
$Res call({
 String field, String filePath, String? filename, http.MediaType? contentType
});




}
/// @nodoc
class __$FromPathFileDtoCopyWithImpl<$Res>
    implements _$FromPathFileDtoCopyWith<$Res> {
  __$FromPathFileDtoCopyWithImpl(this._self, this._then);

  final _FromPathFileDto _self;
  final $Res Function(_FromPathFileDto) _then;

/// Create a copy of _FromPathFileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? field = null,Object? filePath = null,Object? filename = freezed,Object? contentType = freezed,}) {
  return _then(_self.copyWith(
field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String,filePath: null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as http.MediaType?,
  ));
}

}


/// Adds pattern-matching-related methods to [_FromPathFileDto].
extension _FromPathFileDtoPatterns on _FromPathFileDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( __FromPathFileDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case __FromPathFileDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( __FromPathFileDto value)  $default,){
final _that = this;
switch (_that) {
case __FromPathFileDto():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( __FromPathFileDto value)?  $default,){
final _that = this;
switch (_that) {
case __FromPathFileDto() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String field,  String filePath,  String? filename,  http.MediaType? contentType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case __FromPathFileDto() when $default != null:
return $default(_that.field,_that.filePath,_that.filename,_that.contentType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String field,  String filePath,  String? filename,  http.MediaType? contentType)  $default,) {final _that = this;
switch (_that) {
case __FromPathFileDto():
return $default(_that.field,_that.filePath,_that.filename,_that.contentType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String field,  String filePath,  String? filename,  http.MediaType? contentType)?  $default,) {final _that = this;
switch (_that) {
case __FromPathFileDto() when $default != null:
return $default(_that.field,_that.filePath,_that.filename,_that.contentType);case _:
  return null;

}
}

}

/// @nodoc


class __FromPathFileDto extends _FromPathFileDto {
  const __FromPathFileDto(this.field, this.filePath, {this.filename, this.contentType}): super._();
  

@override final  String field;
@override final  String filePath;
@override final  String? filename;
@override final  http.MediaType? contentType;

/// Create a copy of _FromPathFileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$_FromPathFileDtoCopyWith<__FromPathFileDto> get copyWith => __$_FromPathFileDtoCopyWithImpl<__FromPathFileDto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is __FromPathFileDto&&(identical(other.field, field) || other.field == field)&&(identical(other.filePath, filePath) || other.filePath == filePath)&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.contentType, contentType) || other.contentType == contentType));
}


@override
int get hashCode => Object.hash(runtimeType,field,filePath,filename,contentType);

@override
String toString() {
  return '_FromPathFileDto(field: $field, filePath: $filePath, filename: $filename, contentType: $contentType)';
}


}

/// @nodoc
abstract mixin class _$_FromPathFileDtoCopyWith<$Res> implements _$FromPathFileDtoCopyWith<$Res> {
  factory _$_FromPathFileDtoCopyWith(__FromPathFileDto value, $Res Function(__FromPathFileDto) _then) = __$_FromPathFileDtoCopyWithImpl;
@override @useResult
$Res call({
 String field, String filePath, String? filename, http.MediaType? contentType
});




}
/// @nodoc
class __$_FromPathFileDtoCopyWithImpl<$Res>
    implements _$_FromPathFileDtoCopyWith<$Res> {
  __$_FromPathFileDtoCopyWithImpl(this._self, this._then);

  final __FromPathFileDto _self;
  final $Res Function(__FromPathFileDto) _then;

/// Create a copy of _FromPathFileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? field = null,Object? filePath = null,Object? filename = freezed,Object? contentType = freezed,}) {
  return _then(__FromPathFileDto(
null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String,null == filePath ? _self.filePath : filePath // ignore: cast_nullable_to_non_nullable
as String,filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,contentType: freezed == contentType ? _self.contentType : contentType // ignore: cast_nullable_to_non_nullable
as http.MediaType?,
  ));
}


}

// dart format on
