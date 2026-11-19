# Unit Tests
Unit tests will always fake, stub, and mock depencies. Unit tests should not use a WebApplicationFactory ever. Unit tests are light weight, quick, and efficient. I prefer a mixture of low level solitary tests and social tests that cover end-to-end.

## Project Naming Convention
The project should always be NAME.Tests.Unit and always end in ".Tests.Unit".

## Unit Test Structure
- Should always include comments for arrange, act, assert.

## Preferences
- Comments are always lowercase.

<!-- TODO: fill these in so Claude stops guessing -->
- Endpoints style: Controllers or Minimal APIs?
- Versioning approach:
- Error responses: ProblemDetails?
- Validation library:
- AuthN/AuthZ:
- Pagination / filtering conventions:
- OpenAPI tooling:
