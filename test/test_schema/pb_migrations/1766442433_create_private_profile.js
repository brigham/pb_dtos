/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
    const usersCollection = app.findCollectionByNameOrId("_pb_users_auth_");

    const privateProfileCollection = new Collection({
        "name": "private_profiles",
        "type": "base",
        "system": false,
        "listRule": null,
        "viewRule": null,
        "createRule": null,
        "updateRule": null,
        "deleteRule": null,
        "fields": [{
            "name": "user",
            "type": "relation",
            "cascadeDelete": true,
            "collectionId": usersCollection.id,
            "minSelect": 1,
            "maxSelect": 1,
            "required": true,
            "presentable": true,
        }, {
            "name": "note", "type": "text", "required": false, "presentable": true,

        }],
        "indexes": ["CREATE UNIQUE INDEX `unique_user` ON `private_profiles` (`user`)"]
    });
    app.save(privateProfileCollection);
}, (app) => {
    const privateProfileCollection = app.findCollectionByNameOrId('private_profiles');
    app.delete(privateProfileCollection);
})