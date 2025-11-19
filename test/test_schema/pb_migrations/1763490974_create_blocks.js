/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
    const usersCollection = app.findCollectionByNameOrId("_pb_users_auth_");

    const collection = new Collection({
        "name": "blocks",
        "type": "base",
        "system": false,
        "listRule": null,
        "viewRule": null,
        "createRule": null,
        "updateRule": null,
        "deleteRule": null,
    });

    collection.fields.addAt(0, new Field({
        "name": "blocker",
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
        "name": "blocked",
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

    collection.fields.addAt(2, new Field({
        "name": "type",
        "type": "select",
        "required": true,
        "system": false,
        "unique": false,
        "maxSelect": 1,
        "values": [
            "mute",
            "block"
        ]
    }));

    collection.indexes = [
        "CREATE UNIQUE INDEX `idx_blocks_blocker_blocked` ON `blocks` (`blocker`, `blocked`)"
    ];

    return app.save(collection);
}, (app) => {
    const collection = app.findCollectionByNameOrId("blocks");

    if (collection) {
        return app.delete(collection);
    }
})
