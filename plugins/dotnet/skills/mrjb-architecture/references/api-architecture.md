# API Architecture

Template: `projects/api/` in the templates repo.

## Project layout

```
src/
  MrJB.API.<Service>              # Host: ASP.NET Core (Microsoft.NET.Sdk.Web), endpoints/controllers, DI wiring
  MrJB.<Service>.Application      # Use cases / services; depends on Domain + abstractions
  MrJB.<Service>.Domain           # Domain models, no infrastructure dependencies
  MrJB.<Service>.Data             # Data access + persistence entities (EF Core / Dapper)
  MrJB.<Service>.Infrastructure   # External integrations (HTTP clients, brokers, cache, etc.)
  MrJB.<Service>.ServiceDefaults  # Aspire service defaults: OpenTelemetry, health checks, resilience
test/
charts/mrjb-app-<service>/        # Helm chart
build.ps1, run.ps1, run-it.ps1, helm-install.ps1, helm-template.ps1, helm-uninstall.ps1
```

Shared libraries sit in a `libs` solution folder in Visual Studio so dependent
libraries build together.

## Dependency direction

```
API → Application → Domain
API → Infrastructure, Data (DI registration only)
Data → Domain (maps persistence entities ⇄ domain models)
```

- The Application layer never references EF Core, Dapper, or persistence entities.
- The Data layer owns mapping between persistence entities and domain models.

## Project settings

- Target framework: whatever `global.json` / the template pins (currently `net11.0`).
- `<Nullable>enable</Nullable>`, `<ImplicitUsings>enable</ImplicitUsings>`.
- `DockerDefaultTargetOS` = Linux; Docker build context at the repo root.
- `UserSecretsId` unique per service.

## Configuration

- Local: User Secrets.
- Deployed: Azure App Configuration + Key Vault references.
- <!-- TODO: options pattern / validation rules -->

## Preferences to fill in

<!-- TODO: fill these in so Claude stops guessing -->
- Endpoints style: Controllers or Minimal APIs?
- Versioning approach:
- Error responses: ProblemDetails?
- Validation library:
- AuthN/AuthZ:
- Pagination / filtering conventions:
- OpenAPI tooling:
