/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
    const collection = new Collection({
        "name": "autogen_posts",
        "type": "base",
        "system": false,
        "listRule": null,
        "viewRule": null,
        "createRule": null,
        "updateRule": null,
        "deleteRule": null,
    });

    collection.fields.addAt(0, new Field({
        "name": "slug",
        "type": "text",
        "required": true,
        "system": false,
        "unique": true,
        "min": 0,
        "max": 0,
        "pattern": "^[a-z0-9-]+$",
        "autogeneratePattern": "[a-z0-9]{15}",
    }));

    collection.fields.addAt(1, new Field({
        "name": "title",
        "type": "text",
        "required": true,
        "system": false,
        "unique": false,
        "min": 0,
        "max": 0,
        "pattern": "",
        "autogeneratePattern": "",
    }));

    return app.save(collection);
}, (app) => {
    const collection = app.findCollectionByNameOrId("autogen_posts");

    if (collection) {
        return app.delete(collection);
    }
})
