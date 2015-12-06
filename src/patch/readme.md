All game data is held in the "patch database".
This is a large, JSON-serializable object created by applying "patches" (JSON documents roughly equivalent to .esm/.esp/.ess files) which can add, change or remove data.

# Modules

## init

An initial patch to be applied to new databases.
Defines the following:

- rooms (empty object)
- bases (empty object; where inheritable data will be stored)
- references (empty object; where entity instances will be stored)
- factions (empty object)
- dialogue (empty object)

## apply

Given:

- A database object.
- A patch object.

Applies the patch to the database.

This works to the following rules:

- If the patch is null, the database is not modified
- If the patch defines a property which is an array, string, boolean or integer, the equivalent in the database is overwritten.
- If the patch defines a property which is an object, and the database already has an object for that property, the algorithm recurses to those objects.
- If the patch defines a property which is an object, and the database does not have an object for that property, if the patch's object has a "created" property of true, the patch's object is used, otherwise it is ignored.  This is so changes made to objects introduced by patches no longer present do not cause "phantom", half-present entities.

The following will be logged:

- A warning when an entity was updated but previously deleted by a previous patch.
- A warning when an entity was updated but not created by a previous patch
- A warning when the patch attempts to create an object which already exists in the database.
- An error when the patch attempts to replace an object with a value, and vice versa.

## generate

Given:

- A database object.
- A database object.

Returns a new patch object which can be used to applied to the first argument to create the second.

This works to the following rules:

- Properties present in the first database and not the second will be included as null.
- Properties with values present in the second database and not the first will be included.
- Properties with values different between the databases will be included.
- Properties with objects or values which have not changed will not be included.
- Properties with objects present in the second database and not the first will be included, with a "created" property of true.
- Properties with objects present in both databases recurse.
- If there are no changes at all, null is returned.

The following will be logged:

- An error when a property is an object in one database and a value in the other, and vice versa.
