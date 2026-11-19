---
name: dotnet-architecture
description: Scaffold, extend, and review .NET microservices — HTTP APIs and messaging services (consumers, publishers, workers) — using the MrJB Application Architecture templates (simple, linear N-layer; .NET Aspire; Docker; Helm). Use when creating a new .NET Web API or message-driven service, adding endpoints, consumers, repositories or data access, containerizing or adding Helm charts to a .NET service, or checking a .NET service against these architecture conventions.
---

# .NET API & Messaging Architecture

An opinionated, simplicity-first architecture for .NET microservices: APIs and
messaging consumers with a simple, linear flow. Favor predictable, repeatable
patterns over clever one-off designs.

## Templates

Source of truth: https://github.com/mrjamiebowman/Templates-Application-Architecture

Before scaffolding or answering structure questions, get a local copy:

```powershell
pwsh <skill-dir>/scripts/fetch-templates.ps1
```

This clones (or pulls) the repo into `~/.cache/mrjb-templates` and prints the
path. Copy from the template rather than writing projects from scratch. If the
template and these instructions disagree, the template wins — tell the user
about the mismatch.

Repo layout:

| Path | Contents |
|---|---|
| `projects/api/` | API template: `src/`, `test/`, `charts/mrjb-app-api`, build/run/helm scripts |
| `projects/messaging/` | Messaging template: `charts/mrjb-app-messaging`, `run-it.ps1` |
| `projects/nuget/src/MrJB.Packages.Abstractions` | Shared abstractions package |
| `aspire/` | .NET Aspire AppHost |
| `.docker/`, `docker-compose.yml`, `up.ps1` | Local infrastructure (e.g. SQL Server) |
| `.pipelines/` | CI/CD pipelines |
| `MrJB.AppArch.slnx`, `global.json`, `nuget.config` | Solution, SDK pin, feeds |

## Workflow

1. **Pick the service type:** HTTP API, messaging service, or both.
2. **Read the matching reference:**
   - API → [references/api-architecture.md](references/api-architecture.md)
   - Messaging → [references/messaging.md](references/messaging.md)
   - Tests → [references/testing.md](references/testing.md)
   - Unit Tests → [references/unit-testing.md](references/unit-testing.md)
   - Integration Tests → [references/integration-testing.md](references/integration-testing.md)
   - Developer Tests → [references/developer-testing.md](references/developer-testing.md)
   - Always → [references/conventions.md](references/conventions.md)
   - Always → [references/solution-files.md](references/solution-files.md)
3. **Scaffold from the template:** copy the template project, rename
   `MrJB.Sample.*` / `MrJB.API.Sample` to the new service name (namespaces,
   folders, `.csproj`, `.slnx` entries, Helm chart name, `UserSecretsId`).
4. **Implement** following the layer rules: never let persistence entities leak
   past the Data layer.
5. **Verify:** `dotnet build` and `dotnet test`; if Docker is available, run
   the project's `build.ps1`.

## Non-negotiables

- Data access and persistence entities stay in the Data layer, decoupled from
  the Application layer, so EF Core ↔ Dapper or SQL Server ↔ PostgreSQL can be
  swapped without rewriting the application.
- Add an abstraction only when it makes code easier to understand, test, or
  extend. Don't abstract everything.
- Every service is containerized (Linux) and buildable both from Visual Studio
  and from the command line (`build.ps1` / `build.sh`). "Two is one, and one is
  none."
- Every deployable service gets a Helm chart under `charts/`.
