/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
    const usersCollection = app.findCollectionByNameOrId("_pb_users_auth_");

    const collection = new Collection({
        "name": "friends",
        "type": "base",
        "system": false,
        "listRule": null,
        "viewRule": null,
        "createRule": null,
        "updateRule": null,
        "deleteRule": null,
    });

    collection.fields.addAt(0, new Field({
        "name": "requester",
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
        "name": "accepter",
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
        "name": "state",
        "type": "select",
        "required": true,
        "system": false,
        "unique": false,
        "maxSelect": 1,
        "values": [
            "pending",
            "accepted",
            "rejected"
        ]
    }));

    collection.indexes = [
        "CREATE UNIQUE INDEX `idx_friends_requester_accepter` ON `friends` (`requester`, `accepter`)",
        "CREATE INDEX `idx_friends_requester_state` ON `friends` (`requester`, `state`)",
        "CREATE INDEX `idx_friends_accepter_state` ON `friends` (`accepter`, `state`)"
    ];

    return app.save(collection);
}, (app) => {
    const collection = app.findCollectionByNameOrId("friends");

    if (collection) {
        return app.delete(collection);
    }
})
