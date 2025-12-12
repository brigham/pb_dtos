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
        "mimeTypes": ["image/jpeg", "image/png", "image/gif", "image/webp"],
        "thumbs": ['50x50', '150x150'],
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

    collection.fields.addAt(9, new SelectField({
        "name": "visibility",
        "type": "select",
        "required": false,
        "system": false,
        "unique": false,
        "values": [
            "public", "private", "friends"
        ],
    }));

    collection.fields.addAt(10, new AutodateField({
        "name": "created",
        "type": "autodate",
        "required": true,
        "system": false,
        "unique": false,
        "onCreate": true,
        "onUpdate": false,
    }));

    collection.fields.addAt(11, new JSONField({
        "name": "metadata",
        "type": "json",
        "required": false,
        "system": false,
        "unique": false,
    }));

    return app.save(collection);
}, (app) => {
    const collection = app.findCollectionByNameOrId("posts");

    if (collection) {
        return app.delete(collection);
    }
})
