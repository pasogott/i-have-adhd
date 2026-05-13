#!/usr/bin/env bash
# Install i-have-adhd at the user level (~/.claude).
# Available in every Claude Code session. Still opt-in: type /i-have-adhd to activate.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

SKILL_SRC="$SCRIPT_DIR/skills/i-have-adhd/SKILL.md"
CMD_SRC="$SCRIPT_DIR/commands/i-have-adhd.md"

SKILL_DST_DIR="$CLAUDE_DIR/skills/i-have-adhd"
CMD_DST_DIR="$CLAUDE_DIR/commands"

if [[ ! -f "$SKILL_SRC" ]]; then
  echo "error: $SKILL_SRC not found. Run from repo root." >&2
  exit 1
fi
if [[ ! -f "$CMD_SRC" ]]; then
  echo "error: $CMD_SRC not found. Run from repo root." >&2
  exit 1
fi

mkdir -p "$SKILL_DST_DIR" "$CMD_DST_DIR"
cp "$SKILL_SRC" "$SKILL_DST_DIR/SKILL.md"
cp "$CMD_SRC"   "$CMD_DST_DIR/i-have-adhd.md"

echo "installed:"
echo "  $SKILL_DST_DIR/SKILL.md"
echo "  $CMD_DST_DIR/i-have-adhd.md"
echo
echo "next: open Claude Code, type /i-have-adhd"
