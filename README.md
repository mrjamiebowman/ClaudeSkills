# ClaudeSkills

Claude skills for software architecture and development, packaged as a
[Claude Code plugin marketplace](https://docs.claude.com/en/docs/claude-code/plugin-marketplaces).

## Plugins

| Plugin | Skills | Description |
|---|---|---|
| [`dotnet`](plugins/dotnet) | [`mrjb-architecture`](plugins/dotnet/skills/mrjb-architecture) | Scaffold and review .NET APIs and messaging services using the [MrJB Application Architecture templates](https://github.com/mrjamiebowman/Templates-Application-Architecture) |

## Install (Claude Code)

```
/plugin marketplace add mrjamiebowman/ClaudeSkills
/plugin install dotnet@mrjb-skills
```

Update later with `/plugin marketplace update mrjb-skills`.

## Install a single skill (claude.ai / Claude desktop)

Zip a skill folder (for example `plugins/dotnet/skills/mrjb-architecture`)
and upload it under **Settings → Capabilities → Skills**.

## Adding a skill

1. Pick or create a plugin under `plugins/<plugin>/`. A new plugin needs
   `.claude-plugin/plugin.json` and an entry in `.claude-plugin/marketplace.json`.
2. Copy `templates/skill/` to `plugins/<plugin>/skills/<skill-name>/`.
3. Fill in `SKILL.md`: the `name` must match the folder name, and the
   `description` says what the skill does **and when to use it**.
4. Bump `version` in the plugin's `plugin.json`.
5. Validate with `claude plugin validate .`

## Repo layout

```
.claude-plugin/marketplace.json   # marketplace catalog
plugins/<plugin>/
  .claude-plugin/plugin.json      # plugin manifest
  skills/<skill>/SKILL.md         # one folder per skill
templates/skill/                  # starter for new skills
```

## License

[MIT](LICENSE)
