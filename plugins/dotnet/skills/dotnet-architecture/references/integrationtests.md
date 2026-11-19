# Integration Tests
Integration Tests will always use real resources like SQL Servers, Networks, Files, File Shares, APIs and run tests against real infrastructure.

## Project Naming Convention
The project should always be ProjectName.Tests.Integration and always end in ".Tests.Integration".

## Integration Test Structure
- WebApplicationFactory
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
