This is a scratchpad for future plans.

# Developer Experience
The main purpose of this package is to generate DTOs that simplify
building requests and parsing responses to/from PocketBase.

We need to look into removing the required meta argument.

We should consider whether a builder for the whole request would
be better than separate arguments that require multiple references
to the DTO type.

# build_runner
We plan to migrate from the custom `bin/dump_schema.dart` script to a standard `build_runner` approach. This improves integration with the Dart ecosystem and allows for incremental builds.

## Feasibility & Architecture

### 1. Opt-in Generation Strategy
Instead of "bulk generating" files for every collection found in the schema (which is hard for `build_runner` to track), we will use an **opt-in annotation** approach.
*   **User Action:** The developer creates a file (e.g., `lib/dtos/users.dart`) and annotates a class or defines the file with `@PocketBaseCollection('users')`.
*   **Builder Action:** The builder detects this annotation and generates the corresponding DTO code as a **standalone library** (e.g., `lib/dtos/users.pb.dart`), *not* a part file.

### 2. Schema Access (Handling the PocketBase Binary)
To preserve the ease of use where the schema is fetched directly from PocketBase (potentially spinning up the binary), we need to address the concurrency of `build_runner`.
*   **Challenge:** Multiple builders running in parallel must not try to spin up multiple PocketBase instances.
*   **Solution:** We will implement a **Schema Loader Singleton** using a file-system lock and a temporary cache file.
    *   The first builder to run acquires a lock.
    *   It checks if a cached `schema.json` exists and is fresh (e.g., < 1 minute old, or based on a hash).
    *   If stale/missing, it spins up the PocketBase binary (or connects to the URL from config), fetches the schema, writes it to the cache, and shuts down the binary.
    *   Subsequent builders simply read the cached schema.
*   **Outcome:** This maintains the "zero-config" feel (no manual schema dump step) without resource conflicts.

### 3. Handling Relations
To handle inter-collection relations (e.g., `User` has `List<Post>`) without circular dependency issues or generating code for unrequested collections:
*   **Import-Driven Resolution:** The builder analyzes the imports of the input file.
*   If `users.dart` imports `posts.dart` (and `posts.dart` is a valid collection DTO), the generator produces a strongly-typed field (`List<Post>`).
*   If the import is missing, the generator falls back to the ID type (`List<String>`).
*   This ensures that the generator never crashes due to a missing collection and allows developers to prune the graph of generated code.

### 4. File Structure & Build Phases
We will consolidate the currently generated ~8 files per collection into a single **standalone library file** (e.g., `.pb.dart`).
*   **Reasoning:** Since we rely on `freezed` and `json_serializable`, our generated code must act as an input for those builders. By generating a standalone `.pb.dart` file (which contains `part '....freezed.dart'`), we allow `build_runner` to cascade the build:
    1.  **Phase 1:** `pb_dtos` builder generates `users.pb.dart`.
    2.  **Phase 2:** `freezed`/`json_serializable` run on `users.pb.dart` to generate `users.pb.freezed.dart` and `users.pb.g.dart`.

# Dependency Optimization
This package contains a lot of code generation code, but also
dependencies needed during runtime. At some point, we may want to
split it into two packages to allow for cleaner dependency trees.
