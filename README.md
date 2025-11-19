# pb_dtos

PocketBase is a very useful tool with simple APIs. This project
enables developers who want helpful autocomplete and to avoid typos
in their request building and response parsing.

It strives to create DTOs that are as close as possible to the
actual requests and responses, while simplifying creation.

## Experimental
This package is very experimental and will have significant 
changes. I don't recommend using it for now if you aren't
willing to make lots of changes when you upgrade.

In particular, even the names of classes and methods will change.

## Getting Started

You will need to have a PocketBase binary (POCKETBASE_EXECUTABLE)
available. See http://www.pocketbase.io for download instructions.

Create a directory (`POCKETBASE_CONFIG`) to store your migrations and hooks that will be
used to start up PocketBase (alternatively, you can connect directly
to a running PocketBase instance). The directory will need at least
a pb_migrations directory. 

You should include a migration to create
a superuser with a known EMAIL and PASSWORD (see 
test/test_schema/dev_migrations/1761945074_create_superuser.js for
an example). If you are also using this pb_migrations directory
as the source of truth for your real server, put the superuser
migration in a dev_migrations directory to keep it separate.

Decide where you want the generator to create your DTOs (OUTPUT_DIR). 

Create a file called `pb_dto_gen.yaml` in the root of your project.

It should look like this (replace UPPER_CASE with the values 
based on your setup):

```yaml
# PocketBase DTO Generator Configuration

# The PocketBase spec to build and launch.
pocketbase_spec:
  config: POCKETBASE_CONFIG
  executable: POCKETBASE_EXECUTABLE
  port: 8988
# Username and password for a superuser. Don't use with production servers!
credentials:
  email: EMAIL
  password: PASSWORD
# The output directory for the generated DTOs.
output_dir: OUTPUT_DIR
```

Add this package as a dependency.

```shell
$ dart pub add dev:pb_dtos
```

Run `dart run pb_dtos:dump_schema`. You should run this command
when you update your migrations or when you upgrade this package.

## Examples
See test/sample_test.dart for examples of how to use the generated
code.
