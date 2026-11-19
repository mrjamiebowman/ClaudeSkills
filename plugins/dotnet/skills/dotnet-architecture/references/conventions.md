# Conventions (all services)

## Philosophy

1. Use abstractions when they make code easier to understand, maintain, test, or extend.
2. Keep patterns repeatable so developers can copy and adapt straightforward implementations.
3. Organize projects and dependencies around what the application actually needs.
4. Keep simplicity deliberate. Complexity isn't sophistication.
5. Prefer predictable, consistent code over clever one-off designs.

## Naming

- Solution prefix: `MrJB.` (replace with the user's own prefix if they're not MrJB).
- Projects: `MrJB.API.<Service>`, `MrJB.<Service>.<Layer>`.
- Helm charts: `mrjb-app-<service>`.

## Build and run

- SDK pinned via `global.json`; feeds via `nuget.config`.
- Local dependencies: `docker-compose.yml` / `up.ps1`; orchestration via the Aspire AppHost (`aspire.ps1`).
- Per-service scripts: `build.ps1` (container image), `run.ps1`, `run-it.ps1` (integration tests), `helm-*.ps1`.

## Observability

- OpenTelemetry, health checks, and resilience come from `ServiceDefaults`. Don't re-wire them per service.

## Preferences to fill in

<!-- TODO -->
- Test frameworks (xUnit / NUnit, assertion and mocking libraries, Testcontainers?):
- Logging (Serilog? structured logging rules):
- Code style / analyzers:
