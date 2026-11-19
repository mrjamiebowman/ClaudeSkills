# mrjb-architecture: a Claude skill

A [Claude skill](https://docs.claude.com/en/docs/claude-code/skills) for scaffolding and reviewing
.NET microservices (HTTP APIs and messaging services) using the
[MrJB Application Architecture templates](https://github.com/mrjamiebowman/Templates-Application-Architecture).

## Install (Claude Code)

This skill is part of the `dotnet` plugin in the
[ClaudeSkills](https://github.com/mrjamiebowman/ClaudeSkills) marketplace:

```
/plugin marketplace add mrjamiebowman/ClaudeSkills
/plugin install dotnet@mrjb-skills
```

You can also copy this folder into `~/.claude/skills/` (personal) or
`<repo>/.claude/skills/` (per project).

## Install (claude.ai / Claude desktop)

Zip this folder and upload it under **Settings → Capabilities → Skills**.

## Contents

- `SKILL.md`: entry point and workflow
- `references/`: API, messaging, and general conventions
- `scripts/fetch-templates.ps1`: clones or updates the template repo locally

## License

MIT. See the repository [LICENSE](../../../../LICENSE).
