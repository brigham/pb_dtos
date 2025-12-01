# AGENTS.md

This document provides guidance for AI agents working on this Dart project.

## TL;DR

This section contains the most important information that must be followed.

### Precommit

Before submitting changes, ALWAYS run `bin/precommit.sh` to:

- Update build_runner generated files.
- Format and fix files.
- Update code coverage stats.

If the script identifies a code coverage regression, it will list the affected paths. In that case, use COVERAGE.csv to
identify which tests have regressed.

Always commit the updated COVERAGE.csv file as part of your changes.

## Introduction

This is a Dart project for generating Data Transfer Objects (DTOs) from a PocketBase schema.

## Development Workflow

### PocketBase Server (`bin/start_pocketbase.sh`)

The `bin/start_pocketbase.sh` script can be used to start the PocketBase server independently.

The agent_setup.sh script has placed the pocketbase binary at $HOME/develop/pocketbase/pocketbase, which
is the default for the script.

* **Persistent Data:** To start the server with a persistent database, provide a directory path:
  ```bash
  dart run pb_obtain:start --config test/test_schema --output .pocketbase_data
  ```
* **Temporary Data:** To start the server with a temporary database directory, run the script without any arguments:
  ```bash
  dart run pb_obtain:start --config test/test_schema
  ```

### Code Generation

The project uses `build_runner` to generate code for `json_serializable` and `mockito`. To run the code generator, use
the following command:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Testing

- **Framework:** The project uses the `test` framework for unit testing.
- **Running Tests:** To run all tests, use the command `dart test`. For more detailed output on failing tests, use
  `dart test --reporter expanded`.
- **Test Structure:** The `test/` directory mirrors the `lib/` directory structure.
- **Mocks:** The project uses the `mockito` package to generate mock objects for testing.

### Code Style

The project uses `lints` to enforce a consistent code style.
