/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
    const usersCollection = app.findCollectionByNameOrId("_pb_users_auth_");

    const collection = new Collection({
        "name": "follows",
        "type": "base",
        "system": false,
        "listRule": null,
        "viewRule": null,
        "createRule": null,
        "updateRule": null,
        "deleteRule": null,
    });

    collection.fields.addAt(0, new Field({
        "name": "follower",
        "type": "relation",
        "required": true,
        "system": false,
        "unique": false,
        "collectionId": usersCollection.id,
        "cascadeDelete": false,
        "minSelect": 1,
        "maxSelect": 1,
        "displayFields": []
    }));

    collection.fields.addAt(1, new Field({
        "name": "following",
        "type": "relation",
        "required": true,
        "system": false,
        "unique": false,
        "collectionId": usersCollection.id,
        "cascadeDelete": false,
        "minSelect": 1,
        "maxSelect": 1,
        "displayFields": []
    }));

    collection.indexes = [
        "CREATE UNIQUE INDEX `idx_follows_follower_following` ON `follows` (`follower`, `following`)"
    ];

    return app.save(collection);
}, (app) => {
    const collection = app.findCollectionByNameOrId("follows");

    if (collection) {
        return app.delete(collection);
    }
})
