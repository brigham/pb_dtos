import 'dart:async';
import 'dart:collection';

import 'package:pocketbase/pocketbase.dart';

import 'pb/dto/dto.dart';
import 'pb/dto/dto_expand.dart';
import 'pb/dto/dto_field.dart';
import 'pb/dto/dto_filter.dart';
import 'pb/dto/dto_meta.dart';
import 'pb/dto/dto_sort.dart';
import 'pb/dto/patch_dto.dart';

class WatchEvent<D extends Dto<D>> {
  final String action;
  final D? record;

  WatchEvent(this.action, this.record);
}

class PageRequest {
  final int page;
  final int? perPage;

  PageRequest({required this.page, this.perPage});
}

class Page<D extends Dto<D>> extends ListBase<D> {
  /// The page number of these results.
  final int page;

  /// The number of results per page.
  final int perPage;

  /// The total number of results across all pages.
  final int? totalItems;

  /// The total number of pages, given [perPage].
  final int? totalPages;

  final UnmodifiableListView<D> _delegate;

  PageRequest? get nextPage {
    var totalPages2 = totalPages;
    if (totalPages2 == null) {
      if (length == perPage) {
        return PageRequest(page: page + 1, perPage: perPage);
      }
      return null;
    }
    return page < totalPages2
        ? PageRequest(page: page + 1, perPage: perPage)
        : null;
  }

  PageRequest? get previousPage =>
      page > 1 ? PageRequest(page: page - 1, perPage: perPage) : null;

  Page._fromResult(DtoMeta<D> meta, ResultList<RecordModel> result)
    : _delegate = UnmodifiableListView(
        result.items.map(meta.fromRecord).toList(),
      ),
      page = result.page,
      perPage = result.perPage,
      totalItems = result.totalItems == -1 ? null : result.totalItems,
      totalPages = result.totalPages == -1 ? null : result.totalPages;

  @override
  D operator [](int index) => _delegate[index];

  @override
  int get length => _delegate.length;

  @override
  void operator []=(int index, D value) {
    _delegate[index] = value;
  }

  @override
  set length(int newLength) {
    _delegate.length = newLength;
  }

  @override
  void add(D element) {
    _delegate.add(element);
  }

  @override
  void addAll(Iterable<D> iterable) {
    _delegate.addAll(iterable);
  }
}

class PocketBaseApiClient {
  final PocketBase _pb;

  PocketBase get raw => _pb;

  PocketBaseApiClient(String baseUrl) : _pb = PocketBase(baseUrl);

  PocketBaseApiClient.withPocketBase(this._pb);

  Stream<AuthStoreEvent> get authStore => _pb.authStore.onChange;

  bool get isValid => _pb.authStore.isValid;

  RecordModel? get authRecord => _pb.authStore.record;

  Future<D> authWithPassword<D extends Dto<D>>(
    DtoMeta<D> meta,
    String username,
    String password, {
    DtoField<D>? identityField,
    DtoExpand<D>? expand,
    DtoRootFieldSelect<D>? fields,
  }) async {
    var recordAuth = await _pb
        .collection(meta.collectionName)
        .authWithPassword(
          username,
          password,
          body: identityField != null
              ? {"identityField": identityField.pbName}
              : const {},
          expand: expand?.toString(),
          fields: fields?.toString(),
        );
    return meta.fromRecord(recordAuth.record);
  }

  Future<D> authRefresh<D extends Dto<D>>(
    DtoMeta<D> meta, {
    DtoExpand<D>? expand,
    DtoRootFieldSelect<D>? fields,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    var recordAuth = await _pb
        .collection(meta.collectionName)
        .authRefresh(
          expand: expand?.toString(),
          fields: fields?.toString(),
          query: query,
          headers: headers,
        );
    return meta.fromRecord(recordAuth.record);
  }

  Future<void> clearAuth() async => _pb.authStore.clear();

  Stream<WatchEvent<D>> watch<D extends Dto<D>>(
    DtoMeta<D> meta, {
    String topic = '*',
    DtoExpand<D>? expand,
    DtoFilter<D>? filter,
    DtoRootFieldSelect<D>? fields,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) {
    var collection = meta.collectionName;
    var converter = meta.fromRecord;
    late StreamController<WatchEvent<D>> controller;
    Future<UnsubscribeFunc>? unsubscribeFuture;

    void startListening() {
      unsubscribeFuture = _pb
          .collection(collection)
          .subscribe(
            topic,
            (event) {
              controller.add(
                WatchEvent(
                  event.action,
                  event.record != null ? converter(event.record!) : null,
                ),
              );
            },
            expand: expand?.toString(),
            filter: filter?.toString(),
            fields: fields?.toString(),
            query: query,
            headers: headers,
          );
    }

    void stopListening() async {
      if (unsubscribeFuture != null) {
        var unsubscribe = await unsubscribeFuture!;
        await unsubscribe();
        unsubscribeFuture = null;
      }
    }

    controller = StreamController<WatchEvent<D>>(
      onListen: () async {
        startListening();
      },
      onPause: () {
        stopListening();
      },
      onResume: () {
        startListening();
      },
      onCancel: () {
        stopListening();
      },
    );

    return controller.stream;
  }

  Future<List<D>> getFullList<D extends Dto<D>>(
    DtoMeta<D> meta, {
    int? batch,
    DtoExpand<D>? expand,
    DtoFilter<D>? filter,
    DtoSort<D>? sort,
    DtoRootFieldSelect<D>? fields,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    var result = batch == null
        ? await _pb
              .collection(meta.collectionName)
              .getFullList(
                expand: expand?.toString(),
                filter: filter?.toString(),
                sort: sort?.toString(),
                fields: fields?.toString(),
                query: query,
                headers: headers,
              )
        : await _pb
              .collection(meta.collectionName)
              .getFullList(
                batch: batch,
                expand: expand?.toString(),
                filter: filter?.toString(),
                sort: sort?.toString(),
                fields: fields?.toString(),
                query: query,
                headers: headers,
              );
    return result.map(meta.fromRecord).cast<D>().toList();
  }

  Future<Page<D>> getList<D extends Dto<D>>(
    DtoMeta<D> meta, {
    PageRequest? page,
    bool skipTotal = false,
    DtoExpand<D>? expand,
    DtoFilter<D>? filter,
    DtoSort<D>? sort,
    DtoRootFieldSelect<D>? fields,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    var collection = meta.collectionName;
    var perPage = page?.perPage;
    ResultList<RecordModel> result = perPage == null
        ? await _pb
              .collection(collection)
              .getList(
                page: page?.page ?? 1,
                skipTotal: skipTotal,
                expand: expand?.toString(),
                filter: filter?.toString(),
                sort: sort?.toString(),
                fields: fields?.toString(),
                query: query,
                headers: headers,
              )
        : await _pb
              .collection(collection)
              .getList(
                page: page?.page ?? 1,
                perPage: perPage,
                skipTotal: skipTotal,
                expand: expand?.toString(),
                filter: filter?.toString(),
                sort: sort?.toString(),
                fields: fields?.toString(),
                query: query,
                headers: headers,
              );
    return Page._fromResult(meta, result);
  }

  Future<D> getOne<D extends Dto<D>>(
    DtoMeta<D> meta,
    String id, {
    DtoExpand<D>? expand,
    DtoRootFieldSelect<D>? fields,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    var collection = meta.collectionName;
    var converter = meta.fromRecord;
    var result = await _pb
        .collection(collection)
        .getOne(
          id,
          expand: expand?.toString(),
          fields: fields?.toString(),
          query: query,
          headers: headers,
        );
    return converter(result);
  }

  Future<D> getFirstListItem<D extends Dto<D>>(
    DtoMeta<D> meta,
    DtoFilter<D> filter, {
    DtoExpand<D>? expand,
    DtoRootFieldSelect<D>? fields,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    var collection = meta.collectionName;
    var converter = meta.fromRecord;
    var result = await _pb
        .collection(collection)
        .getFirstListItem(
          filter.toString(),
          expand: expand?.toString(),
          fields: fields?.toString(),
          query: query,
          headers: headers,
        );
    return converter(result);
  }

  Future<D> create<D extends Dto<D>>(
    DtoMeta<D> meta, {
    D? body,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
    DtoExpand<D>? expand,
    DtoRootFieldSelect<D>? fields,
  }) async {
    var collection = meta.collectionName;
    var converter = meta.fromRecord;
    var created = await _pb
        .collection(collection)
        .create(
          body: body?.toJson() ?? const {},
          query: query,
          files: await Future.wait(body?.toFiles() ?? const []),
          headers: headers,
          expand: expand?.toString(),
          fields: fields?.toString(),
        );
    return converter(created);
  }

  Future<D> update<D extends Dto<D>>(
    DtoMeta<D> meta,
    String id, {
    PatchDto<D>? body,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
    DtoExpand<D>? expand,
    DtoRootFieldSelect<D>? fields,
  }) async {
    var collection = meta.collectionName;
    var converter = meta.fromRecord;
    var updated = await _pb
        .collection(collection)
        .update(
          id,
          body: body?.toJson() ?? const {},
          query: query,
          files: await Future.wait(body?.toFiles() ?? const []),
          headers: headers,
          expand: expand?.toString(),
          fields: fields?.toString(),
        );
    return converter(updated);
  }

  Future<void> delete<D extends Dto<D>>(
    DtoMeta<D> meta,
    String id, {
    Map<String, dynamic> body = const {},
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) {
    return _pb.collection(meta.collectionName).delete(id);
  }
}
