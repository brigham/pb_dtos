# 0.11.1

* Make the field type tree cleaner to enable generic entities.

# 0.11.0

* Generic getter on DtoTypedField.
* Pass arguments to sample test runner.
* Refactor to remove unimplemented methods from expand enums.

# 0.10.0

* Can now just pass lambda to create filter, sort, field, and expand.
* Intermediate fields in the chain are just property getters instead of
  a method call. Also, cleaned up code to support more functional creation.
* Fix unusual authWithPassword API.

# 0.9.0+1

* Simplified some generics on some classes.

# 0.9.0

* Improved interface for `and` and `or`.

# 0.8.1+1

* Don't create URIs for missing images.

# 0.8.1

* Fix bug with optional relations.

# 0.8.0

* Fixed lots of bugs with filtering pocketbase types.

# 0.7.0

* Filters support comparing to another field now, but this requires
  wrapping literals in .val(...).

# 0.6.0

* `getList` returns a `Page` instead of a `List`.

# 0.5.0

* Removed `pbId` field as PocketBase view ids are not consistent
  between migrations.

# 0.4.2

* Add `thumb` parameter to `toUri`.
* Add `pbId` and `settings` to generated field enum.
* Add `debug` options to dump_schema.

# 0.4.1

* Fix CLI bug with mutually exclusive options.

# 0.4.0

* Rely on `pb_obtain` for downloading and launching
  PocketBase during code generation and testing.
* Simplified config code requires lowerCamelCase field names instead of
  snake_case.

# 0.3.0

* PocketBase `json` fields are now typed as `dynamic` instead of
  a nullable map.
* Support for using a PocketBase release version in multiple places.
  When set, the binary will be downloaded to a user-selected
  location and used.
* Better handling when tests fail to stop PocketBase server
  during tear down.

# 0.2.0

* `PocketBaseApiClient.watch` now has all expected parameters. This
  required making `topic` a named parameter.
* Added `PocketBaseApiClient.authRefresh`.

# 0.1.1

* `FileDto.toUri` for creating the PocketBase URI to a file.

# 0.1.0

* Enhanced support for files. `FileDto` offers new constructors and
  `PocketBaseApiClient` automatically populates files.

# 0.0.2

* Fixes for start_pocketbase.dart output directory reusability.
* Testing improvements.

# 0.0.1

* Experimental initial release.
