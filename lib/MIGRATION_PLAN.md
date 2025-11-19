# PocketBase DTO Generator Migration Plan

This document outlines the plan to convert the existing Flutter project into a pure Dart package for generating PocketBase DTOs.

## 1. [DONE] Project Restructuring

The first step is to remove all Flutter-specific code and directories, transforming the project into a pure Dart package.

- **Delete Flutter directories:** `android`, `ios`, `linux`, `macos`, `web`, `windows`.
- **Delete Flutter UI code:** The majority of the `lib` directory will be deleted, including `about`, `controller`, `donut_browser`, `review_view`, `search`, and several files in the root of `lib`.
- **Delete UI assets:** The `assets` directory will be deleted.
- **Update `.gitignore`:** Remove Flutter-specific entries from `.gitignore`.

## 2. [DONE] Dependency Management

The `pubspec.yaml` file will be updated to reflect the new project's dependencies.

- **Remove Flutter dependencies:** `flutter`, `provider`, `flutter_secure_storage`,`petitparser`.
- **Keep core dependencies:** `pocketbase`, `json_annotation`, `freezed_annotation`, `meta`, `dcli`, `mustache_template`, `recase`.
- **Keep dev dependencies:**  `json_serializable`, `mockito`, `build_runner`, `freezed`, `args`, `csv`, `flutter_lints` (will be replaced with `lints`).
- **Add new dependencies:** `lints`.

## 3. [DONE] Code Refactoring

The core logic of the project will be refactored to be more generic and reusable.

- **Move code generation logic:** The contents of `lib/gen` will be moved to the root `lib` directory.
- **Refactor `lib/remote.dart`:**
    - Create a new generic `PocketBaseApiClient` class that is not tied to any specific application state.
    - This class will contain the generic methods for interacting with the PocketBase API (`getFullList`, `getList`, `getOne`, `create`, `update`, `delete`, `watch`).
    - The application-specific logic will be removed.
- **Move `lib/truly_async_auth_store.dart`:** This file will be moved to the new `lib` directory.
- **Move generated DTO base classes:** The generic DTO classes in `lib/pb/dto` will be moved to the new `lib` directory.

## 4. [DONE] Configuration

A configuration file will be introduced to make the code generator more flexible.

- **Create a configuration file:** A new configuration file (e.g., `pb_dto_gen.yaml`) will be created to specify:
    - The PocketBase URL.
    - The output directory for the generated DTOs.

## 5. Testing

A comprehensive test suite will be added to ensure the reliability of the code generator.

### A. [DONE] Sample schema

We will create a new directory under test called test_schema, containing migrations to create a thorough schema. This should be a realistic set of collections, allowing us to fully test all of the features of the code generator.

The schema will be for a fictional social network. This is not meant to be a perfect schema for a social network.

Collections:
- permissions
  - name: non-empty text (unique index)
- roles
  - name: non-empty text (unique index)
  - permissions: multiple relation to permissions
- users - default auth collection plus additional fields:
  - roles: multiple relation to roles
  - birthday: date (optional)
- follows
  - follower: single required relation to users
  - following: single required relation to users
  - unique index on (follower, following)
- friends
  - requester: single required relation to users
  - accepter: single required relation to users
  - state: required single select of 'pending', 'accepted', 'rejected'
  - unique index on (requester, accepter)
  - index on (requester, state)
  - index on (accepter, state)
- blocks
  - blocker: single required relation to users
  - blocked: single required relation to users
  - type: required single select of 'mute', 'block'
  - unique index on (requester, accepter)
- posts
  - message: non-empty editor
  - photo: file (optional)
  - link: url (optional)
  - location: geoPoint (optional)
  - review_stars: number (optional, max is 5)
  - tagged: multiple relation to users (optional)
  - draft: bool
  - scheduled: date

### B. [DONE] Golden tests

We will have golden tests to ensure that the code generator generates exactly the expected code for the sample schema.

The test should generate the code into temporary directories and compare it to golden files.

Generating the code requires starting pocketbase using start_pocketbase.sh.

Then run dump_schema.dart, which will need an argument to override the default yaml file's location.

If the files do not all match, the tests fail, but the error message should print a command to overwrite the goldens.

### C. [STARTED] Sample schema tests

Tests using the generated DTOs, testing the various features of the code generation library.

#### Test cases
We need to test the following cases, keeping in mind that we are not worrying about access control yet.

Also, we will be using the simple primitives, so we are not worrying about transactionality for now.

- Setup: Create two users, friend request is created as pending, then moves to accepted, also creating the reciprocal relationship.
  - Test: One of the users creates a post. We load it via the other user by expanding.
- 

### D. PocketBaseApiClient tests

Tests using the sample schema to validate using http mocks that the right URLs are sent. Also, a good resource to see how the SDK translates to URIs.

### E. Stretch goal: CLI application for the social network, 

Serves as sample code for users of the library.

## 6. Documentation

The project will be documented to make it easy for other developers to use.

- **Create a `README.md`:** The `README.md` will explain how to install, configure, and use the code generator.
- **Add comments to the code:** The code will be commented to explain the purpose of each class and method.

## 7. Entry Point

The entry point for the code generator will be updated to use the new configuration file.

- **Update `bin/dump_schema.dart`:** The script will be updated to:
    - Read the configuration from the `pb_dto_gen.yaml` file.
    - Use the refactored code generator to generate the DTOs.
    - The credentials will be passed as command-line arguments or environment variables, not interactively.
