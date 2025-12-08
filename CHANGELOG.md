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
