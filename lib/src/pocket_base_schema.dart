import 'package:pocketbase/pocketbase.dart';

import 'back_relation.dart';
import 'collection_schema.dart';

class PocketBaseSchema {
  final List<CollectionSchema> collections;
  final Map<String, CollectionSchema> byId;
  final Map<String, List<BackRelation>> backRelations;

  PocketBaseSchema._(this.collections, this.byId, this.backRelations);

  static Map<String, List<BackRelation>> _calculateBackRelations(
    List<CollectionSchema> collections,
    Map<String, CollectionSchema> byId,
  ) {
    final result = <String, List<BackRelation>>{};
    for (final collection in collections) {
      for (final field in collection.model.fields) {
        if (field.type != 'relation') {
          continue;
        }
        final relatedCollectionId = field.data['collectionId'];
        if (result[relatedCollectionId] == null) {
          result[relatedCollectionId] = [];
        }
        final unique = collection.uniqueFields.contains(field.name);
        result[relatedCollectionId]!.add(
          BackRelation(collection, field, unique),
        );
      }
    }
    return result;
  }

  static Map<String, CollectionSchema> _mapById(
    List<CollectionSchema> collections,
  ) {
    Map<String, CollectionSchema> result = {};
    for (var collection in collections) {
      result[collection.model.id] = collection;
    }
    return result;
  }

  static Future<PocketBaseSchema> create(
    String pocketbaseUrl, {
    required String email,
    required String password,
  }) async {
    final pb = PocketBase(pocketbaseUrl);

    await pb.collection('_superusers').authWithPassword(email, password);

    var collections = (await pb.collections.getFullList())
        .where((coll) => !coll.name.startsWith('_'))
        .toList()
        .map(CollectionSchema.new)
        .toList();
    final byId = _mapById(collections);
    final backRelations = _calculateBackRelations(collections, byId);
    return PocketBaseSchema._(collections, byId, backRelations);
  }

  CollectionSchema findCollection(String collectionName) =>
      byId[collectionName]!;
}
