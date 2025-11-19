This is a scratchpad for future plans.

# Developer Experience
The main purpose of this package is to generate DTOs that simplify
building requests and parsing responses to/from PocketBase.

We need to look into removing the required meta argument.

We should consider whether a builder for the whole request would
be better than separate arguments that require multiple references
to the DTO type.

# build_runner
My current understanding is that it would better to use build_runner
instead of our custom script.

# Dependency Optimization
This package contains a lot of code generation code, but also
dependencies needed during runtime. At some point, we may want to
split it into two packages to allow for cleaner dependency trees.
