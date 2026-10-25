# claude-design-skills

A curated list of Claude Code skills for UI/UX and frontend design. Star counts were checked on GitHub on Oct 25, 2026.

## Core picks

| Skill | Stars | Use it for |
|---|---|---|
| [anthropics/skills](https://github.com/anthropics/skills) → `frontend-design` | ~184k (repo) | Anthropic's official frontend design skill and the usual starting point |
| [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | ~140k | Reference of styles, palettes and font pairings across many stacks |
| [Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) | ~102k | Art direction, tunable motion and density, browser check |
| [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | ~87k | Design language that keeps AI UI from looking generic |
| [emilkowalski/skills](https://github.com/emilkowalski/skills) | ~50k | Motion and interaction polish |
| [Nutlope/hallmark](https://github.com/Nutlope/hallmark) | ~33k | Anti-slop design rules |
| [Dammyjay93/interface-design](https://github.com/Dammyjay93/interface-design) | ~5.9k | Keeps UI decisions consistent across long projects |

## Also worth a look

- [oil-oil/oil-ui](https://github.com/oil-oil/oil-ui): explore several directions side by side, refine against screenshots
- [superdesigndev/superdesign-skill](https://github.com/superdesigndev/superdesign-skill): `npx skills add superdesigndev/superdesign-skill`
- [edisonmbli/refactoring-ui-skill](https://github.com/edisonmbli/refactoring-ui-skill): 151 rules from *Refactoring UI*, tokens and Tailwind mappings

## Suggested setup

1. **Base:** `frontend-design`
2. **Less generic output:** `impeccable` or `taste-skill`
3. **Reference:** `ui-ux-pro-max`
4. **Motion:** `emilkowalski/skills`
5. **Larger apps:** `interface-design`

## What's in this folder

Each skill repo is linked as a git submodule under `skills/`, pinned to the commit current on Oct 25, 2026. The authors' files are not copied here, so their own licenses apply.

| Folder | Upstream repo |
|---|---|
| `skills/anthropic-skills` | anthropics/skills (use the `frontend-design` skill) |
| `skills/ui-ux-pro-max` | nextlevelbuilder/ui-ux-pro-max-skill |
| `skills/taste-skill` | Leonxlnx/taste-skill |
| `skills/impeccable` | pbakaus/impeccable |
| `skills/emil-kowalski` | emilkowalski/skills |
| `skills/hallmark` | Nutlope/hallmark |
| `skills/interface-design` | Dammyjay93/interface-design |
| `skills/oil-ui` | oil-oil/oil-ui |
| `skills/superdesign` | superdesigndev/superdesign-skill |
| `skills/refactoring-ui` | edisonmbli/refactoring-ui-skill |

## Installing

Fetch the skills (from the repo root):

```sh
git submodule update --init --depth 1 claude-design-skills/skills
```

Copy every skill folder (each one with a `SKILL.md`) into `~/.claude/skills/`:

```sh
./claude-design-skills/install.sh            # all projects
./claude-design-skills/install.sh .claude/skills   # or a specific folder
```

If two repos ship a skill with the same name, the one installed later wins. The script prints each skill it copies.

To update every skill to its latest commit:

```sh
git submodule update --remote --depth 1 claude-design-skills/skills
```

Read each `SKILL.md` before installing. A skill is a set of instructions Claude will follow.
