#!/usr/bin/env bash
# Copy every skill folder (one containing SKILL.md) from the submodules into a Claude skills directory.
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
dest="${1:-$HOME/.claude/skills}"
mkdir -p "$dest"

count=0
while IFS= read -r skill_md; do
  dir="$(dirname "$skill_md")"
  name="$(basename "$dir")"
  rm -rf "${dest:?}/$name"
  cp -R "$dir" "$dest/$name"
  echo "installed $name  <-  ${dir#"$here"/}"
  count=$((count + 1))
done < <(find "$here/skills" -name SKILL.md -not -path '*/node_modules/*' -not -path '*/.git/*' | sort)

if [ "$count" -eq 0 ]; then
  echo "No skills found. Run: git submodule update --init --depth 1 claude-design-skills/skills" >&2
  exit 1
fi
echo "$count skills installed to $dest"
