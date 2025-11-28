import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'file_dto.freezed.dart';

@freezed
sealed class FileDto with _$FileDto {
  const FileDto._();

  const factory FileDto.remote(String name) = _RemoteFileDto;

  const factory FileDto.fromStream(
    Stream<List<int>> stream,
    int length, {
    String? filename,
    http.MediaType? contentType,
  }) = _FromStreamFileDto;

  const factory FileDto.fromBytes(
    FutureOr<List<int>> value, {
    String? filename,
    http.MediaType? contentType,
  }) = _FromBytesFileDto;

  const factory FileDto.fromString(
    String value, {
    String? filename,
    http.MediaType? contentType,
  }) = _FromStringFileDto;

  const factory FileDto.fromPath(
    String field,
    String filePath, {
    String? filename,
    http.MediaType? contentType,
  }) = _FromPathFileDto;

  factory FileDto.fromJson(String json) {
    return FileDto.remote(json);
  }

  String? toJson();

  Future<http.MultipartFile>? toFile(String field);
}

@freezed
abstract class _RemoteFileDto extends FileDto with _$RemoteFileDto {
  const _RemoteFileDto._() : super._();

  const factory _RemoteFileDto(String name) = __RemoteFileDto;

  @override
  String? toJson() {
    return name;
  }

  @override
  Future<http.MultipartFile>? toFile(String field) {
    return null;
  }
}

@freezed
abstract class _FromStreamFileDto extends FileDto with _$FromStreamFileDto {
  const _FromStreamFileDto._() : super._();

  const factory _FromStreamFileDto(
    Stream<List<int>> stream,
    int length, {
    String? filename,
    http.MediaType? contentType,
  }) = __FromStreamFileDto;

  @override
  String? toJson() {
    return null;
  }

  @override
  Future<http.MultipartFile>? toFile(String field) async {
    return http.MultipartFile(
      field,
      stream,
      length,
      filename: filename,
      contentType: contentType,
    );
  }
}

@freezed
abstract class _FromBytesFileDto extends FileDto with _$FromBytesFileDto {
  const _FromBytesFileDto._() : super._();

  const factory _FromBytesFileDto(
    FutureOr<List<int>> value, {
    String? filename,
    http.MediaType? contentType,
  }) = __FromBytesFileDto;

  @override
  String? toJson() {
    return null;
  }

  @override
  Future<http.MultipartFile>? toFile(String field) async {
    return http.MultipartFile.fromBytes(
      field,
      await value,
      filename: filename,
      contentType: contentType,
    );
  }
}

@freezed
abstract class _FromStringFileDto extends FileDto with _$FromStringFileDto {
  const _FromStringFileDto._() : super._();

  const factory _FromStringFileDto(
    String value, {
    String? filename,
    http.MediaType? contentType,
  }) = __FromStringFileDto;

  @override
  String? toJson() {
    return null;
  }

  @override
  Future<http.MultipartFile>? toFile(String field) async {
    return http.MultipartFile.fromString(
      field,
      value,
      filename: filename,
      contentType: contentType,
    );
  }
}

@freezed
abstract class _FromPathFileDto extends FileDto with _$FromPathFileDto {
  const _FromPathFileDto._() : super._();

  const factory _FromPathFileDto(
    String field,
    String filePath, {
    String? filename,
    http.MediaType? contentType,
  }) = __FromPathFileDto;

  @override
  String? toJson() {
    return null;
  }

  @override
  Future<http.MultipartFile>? toFile(String field) {
    return http.MultipartFile.fromPath(
      field,
      filePath,
      filename: filename,
      contentType: contentType,
    );
  }
}
