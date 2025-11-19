/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
    const permissionsCollection = app.findCollectionByNameOrId("permissions");

    const collection = new Collection({
        "name": "roles",
        "type": "base",
        "system": false,
        "listRule": null,
        "viewRule": null,
        "createRule": null,
        "updateRule": null,
        "deleteRule": null,
    });

    collection.fields.addAt(0, new Field({
        "name": "name",
        "type": "text",
        "required": true,
        "min": 1,
        "max": null,
        "pattern": ""
    }));

    collection.fields.addAt(1, new Field({
        "name": "permissions",
        "type": "relation",
        "required": false,
        "system": false,
        "unique": false,
        "collectionId": permissionsCollection.id,
        "cascadeDelete": false,
        "minSelect": 0,
        "maxSelect": 999,
        "displayFields": []
    }));

    collection.indexes = [
        "CREATE UNIQUE INDEX `idx_roles_name` ON `roles` (`name`)"
    ];

    return app.save(collection);
}, (app) => {
    const collection = app.findCollectionByNameOrId("roles");

    if (collection) {
        return app.delete(collection);
    }
})
