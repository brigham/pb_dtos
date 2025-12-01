/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
    const usersCollection = app.findCollectionByNameOrId("_pb_users_auth_");

    const collection = new Collection({
        "name": "posts",
        "type": "base",
        "system": false,
        "listRule": null,
        "viewRule": null,
        "createRule": null,
        "updateRule": null,
        "deleteRule": null,
    });

    collection.fields.addAt(0, new Field({
        "name": "poster",
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
        "name": "message",
        "type": "editor",
        "required": true,
        "system": false,
        "unique": false,
    }));

    collection.fields.addAt(2, new Field({
        "name": "photo",
        "type": "file",
        "required": false,
        "system": false,
        "unique": false,
        "maxSelect": 1,
        "maxSize": 5242880,
        "mimeTypes": [],
        "thumbs": [],
        "protected": false
    }));

    collection.fields.addAt(3, new Field({
        "name": "link",
        "type": "url",
        "required": false,
        "system": false,
        "unique": false,
        "exceptDomains": null,
        "onlyDomains": null
    }));

    collection.fields.addAt(4, new Field({
        "name": "location",
        "type": "geoPoint",
        "required": false,
        "system": false,
        "unique": false,
    }));

    collection.fields.addAt(5, new Field({
        "name": "review_stars",
        "type": "number",
        "required": false,
        "system": false,
        "unique": false,
        "min": 0,
        "max": 5
    }));

    collection.fields.addAt(6, new Field({
        "name": "tagged",
        "type": "relation",
        "required": false,
        "system": false,
        "unique": false,
        "collectionId": usersCollection.id,
        "cascadeDelete": false,
        "minSelect": 0,
        "maxSelect": 999,
        "displayFields": []
    }));

    collection.fields.addAt(7, new Field({
        "name": "draft",
        "type": "bool",
        "required": false,
        "system": false,
        "unique": false,
    }));

    collection.fields.addAt(8, new Field({
        "name": "scheduled",
        "type": "date",
        "required": false,
        "system": false,
        "unique": false,
        "min": "",
        "max": ""
    }));

    return app.save(collection);
}, (app) => {
    const collection = app.findCollectionByNameOrId("posts");

    if (collection) {
        return app.delete(collection);
    }
})
