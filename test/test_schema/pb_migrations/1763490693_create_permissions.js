/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
    const collection = new Collection({
        "name": "permissions",
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

    collection.indexes = [
        "CREATE UNIQUE INDEX `idx_permissions_name` ON `permissions` (`name`)"
    ];

    return app.save(collection);
}, (app) => {
    const collection = app.findCollectionByNameOrId("permissions");
    if (collection) {
        return app.delete(collection);
    }
})
