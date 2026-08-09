# ZEYN — two ventures, one repository

This repository holds two separate operating systems. **Neither runs from here.** Open a session inside the venture you are working on — each has its own constitution, its own commands, and its own data.

```
cd araku-ops && claude     # Araku coffee — the live sprint
cd gift-ops  && claude     # gift-ops — personalized wooden gifts
```

## Why the root is empty of commands

Claude Code discovers commands and skills at the **root of the directory you open**. Both ventures define `/daily`, `/log`, `/review`, and `/gate` — the same four names, different meanings. Placing either at the repository root would silently hijack the other. So the root holds nothing but this signpost, and each venture owns its own subtree.

If a command is "unknown", you are one directory too high. `cd` into the venture and reopen.

| | `araku-ops/` | `gift-ops/` |
|---|---|---|
| Venture | Araku coffee, Visakhapatnam | Personalized wooden/engraved gifts, US Muslim households |
| Status | **Live sprint**, 7 Aug – 15 Sep 2026 | Foundation phase, pre-Gate A |
| Constitution | `araku-ops/CLAUDE.md` | `gift-ops/CLAUDE.md` |
| Commands via | `.claude/skills/` (4 skills) | `.claude/commands/` (9 commands) |
| Gate | 15 Sep 2026 — 10 unrelated buyers + supplier confirmation | Gate A 15 Sep 2026, Gate B 31 Oct, Gate C 31 Dec |
| Automation | cron: `/daily` 07:00, `/review` 18:00 Sundays | none — manual, file-only |

## How the two relate

They are sequenced, not parallel. Araku's constitution states that if its 15 Sep gate is missed, *"the venture closes and the gifting plan replaces it."* gift-ops' constitution assumes ~5 hrs/week until 15 Sep because the coffee sprint holds priority, rising to 10–15 hrs/week afterwards. Both gates land on 15 Sep 2026 — that date decides which venture carries into 2027.

Shared rules, held independently by each constitution: data lives in append-only CSVs, metrics are never estimated, and neither system sells — the operator sells.

## After pulling this restructure

Araku's cron entries point at the old paths. Re-install them once:

```
cd araku-ops && bash setup.sh
```

`setup.sh` is idempotent and self-locating: it recomputes the repository path, rewrites the `# araku-ops` crontab lines, and re-grants workspace trust for its new directory.
