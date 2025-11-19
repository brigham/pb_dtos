/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
    const rolesCollection = app.findCollectionByNameOrId("roles");
    const collection = app.findCollectionByNameOrId("_pb_users_auth_");

    collection.fields.addAt(8, new Field({
        "name": "roles",
        "type": "relation",
        "required": false,
        "system": false,
        "unique": false,
        "collectionId": rolesCollection.id,
        "cascadeDelete": false,
        "minSelect": 0,
        "maxSelect": 999,
        "displayFields": []
    }));

    collection.fields.addAt(9, new Field({
        "name": "birthday",
        "type": "date",
        "required": false,
        "system": false,
        "unique": false,
        "min": "",
        "max": ""
    }));

    return app.save(collection);
}, (app) => {
    const collection = app.findCollectionByNameOrId("_pb_users_auth_");

    if (collection) {
        collection.fields.removeByName("roles");
        collection.fields.removeByName("birthday");

        return app.save(collection);
    }
})
