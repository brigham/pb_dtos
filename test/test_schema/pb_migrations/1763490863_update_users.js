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

    collection.fields.addAt(10, new Field({
        "name": "homepage",
        "type": "url",
        "required": false,
        "system": false,
        "unique": false,
        "exceptDomains": null,
        "onlyDomains": null
    }));

    collection.fields.addAt(11, new JSONField({
        "name": "metadata",
        "type": "json",
        "required": false,
        "system": false,
        "unique": false,
    }));

    collection.fields.addAt(12, new JSONField({
        "name": "biography",
        "type": "editor",
        "required": false,
        "system": false,
        "unique": false,
    }));

    collection.fields.addAt(13, new GeoPointField({
        "name": "hometown",
        "type": "geoPoint",
        "required": false,
        "system": false,
        "unique": false,
    }));

    collection.fields.addAt(14, new SelectField({
        "name": "zodiac",
        "type": "select",
        "required": false,
        "system": false,
        "unique": false,
        "values": [
            "aries",
            "taurus",
            "gemini",
            "cancer",
        ]
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
