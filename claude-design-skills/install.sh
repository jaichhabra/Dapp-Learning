#!/usr/bin/env bash
# Copy the curated design skills from the submodules into a Claude skills directory.
# Some repos ship the same skill once per editor, or skills unrelated to design,
# so each skill folder is listed explicitly rather than found by searching.
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)/skills"
dest="${1:-$HOME/.claude/skills}"

skills=(
  anthropic-skills/skills/frontend-design
  anthropic-skills/skills/canvas-design
  anthropic-skills/skills/theme-factory
  emil-kowalski/skills/emil-design-eng
  emil-kowalski/skills/animate
  emil-kowalski/skills/animate-expo
  emil-kowalski/skills/animation-performance
  emil-kowalski/skills/animation-vocabulary
  emil-kowalski/skills/apple-design
  emil-kowalski/skills/ask-sonner
  emil-kowalski/skills/break-ui
  emil-kowalski/skills/find-animation-opportunities
  emil-kowalski/skills/improve-animations
  emil-kowalski/skills/mobile-native
  emil-kowalski/skills/pick-ui-library
  emil-kowalski/skills/prototype
  emil-kowalski/skills/review-animations
  emil-kowalski/skills/write-swift
  hallmark/skills/hallmark
  impeccable/.claude/skills/impeccable
  interface-design/.claude/skills/interface-design
  oil-ui
  refactoring-ui/skills/refactoring-ui
  superdesign/skills/superdesign
  taste-skill/skills/taste-skill
  ui-ux-pro-max/.claude/skills/ui-ux-pro-max
  ui-ux-pro-max/.claude/skills/design
  ui-ux-pro-max/.claude/skills/design-system
  ui-ux-pro-max/.claude/skills/ui-styling
  ui-ux-pro-max/.claude/skills/brand
  ui-ux-pro-max/.claude/skills/banner-design
  ui-ux-pro-max/.claude/skills/slides
)

if [ ! -f "$here/ui-ux-pro-max/LICENSE" ]; then
  echo "Skills not downloaded. Run: git submodule update --init --depth 1 claude-design-skills/skills" >&2
  exit 1
fi

mkdir -p "$dest"
for path in "${skills[@]}"; do
  src="$here/$path"
  name="$(basename "$path")"
  repo="${path%%/*}"
  if [ ! -f "$src/SKILL.md" ]; then
    echo "skipped $name: no SKILL.md at $path" >&2
    continue
  fi
  rm -rf "${dest:?}/$name"
  mkdir -p "$dest/$name"
  (cd "$src" && tar --exclude=.git -cf - .) | (cd "$dest/$name" && tar -xf -)
  # Keep the upstream license next to the skill when the folder has none of its own.
  if ! ls "$dest/$name" | grep -qiE '^licen[cs]e'; then
    cp "$here/$repo/LICENSE" "$dest/$name/LICENSE"
  fi
  echo "installed $name  <-  $path"
done
echo "${#skills[@]} skills installed to $dest"
