# Install i-have-adhd

Claude Code only. Three ways to install, depending on where you want it to live.

## TL;DR

```bash
git clone https://github.com/ayghri/i-have-adhd ~/i-have-adhd
claude plugin marketplace add ~/i-have-adhd
claude plugin install i-have-adhd@i-have-adhd
```

Then in any Claude Code session: `/i-have-adhd`.

Stop with `stop adhd mode` or `normal mode`.

---

## 1. Local plugin (recommended)

Use this if you cloned the repo and want to iterate on the rules.

```bash
# 1. Clone (or use the existing checkout)
git clone https://github.com/ayghri/i-have-adhd ~/i-have-adhd

# 2. Register the local marketplace
claude plugin marketplace add ~/i-have-adhd

# 3. Install the plugin
claude plugin install i-have-adhd@i-have-adhd
```

Verify:

```bash
claude plugin list
# should show: i-have-adhd  (enabled)
```

Open Claude Code, type `/i-have-adhd`, hit enter. Subsequent replies follow the ADHD-friendly rules.

## 2. Project-level skill (no marketplace)

Use this if you only want the rules in one repo.

```bash
mkdir -p .claude/skills/i-have-adhd
cp /path/to/i-have-adhd/skills/i-have-adhd/SKILL.md .claude/skills/i-have-adhd/SKILL.md

mkdir -p .claude/commands
cp /path/to/i-have-adhd/commands/i-have-adhd.md .claude/commands/i-have-adhd.md
```

Claude Code auto-discovers `.claude/skills/` and `.claude/commands/` in the working directory. No marketplace, no plugin manifest. `/i-have-adhd` works in that repo only.

## 3. User-level skill (every project)

Use this if you want the rules in every Claude Code session, everywhere.

**One-liner:**

```bash
./install-user.sh
```

Run from the repo root. Copies the skill to `~/.claude/skills/i-have-adhd/SKILL.md` and the slash command to `~/.claude/commands/i-have-adhd.md`. Honors `$CLAUDE_CONFIG_DIR` if set. Re-running is safe (overwrites).

**Manual equivalent:**

```bash
mkdir -p ~/.claude/skills/i-have-adhd
cp skills/i-have-adhd/SKILL.md ~/.claude/skills/i-have-adhd/SKILL.md

mkdir -p ~/.claude/commands
cp commands/i-have-adhd.md ~/.claude/commands/i-have-adhd.md
```

Available in every session. Still opt-in per session. Type `/i-have-adhd` to activate.

## Always-on (optional)

If you want the rules applied automatically every session (no `/i-have-adhd` needed), add a reminder to `~/.claude/CLAUDE.md`:

```markdown
## Output style

Always follow the rules in `skills/i-have-adhd/SKILL.md`: action-first, numbered steps, no preamble, no closers, state restated each turn.
```

Claude Code reads `CLAUDE.md` at session start, so the rules apply from message one.

## Uninstall

```bash
# Plugin install
claude plugin uninstall i-have-adhd

# Project-level
rm -rf .claude/skills/i-have-adhd .claude/commands/i-have-adhd.md

# User-level
rm -rf ~/.claude/skills/i-have-adhd ~/.claude/commands/i-have-adhd.md
```

## Troubleshooting

**`/i-have-adhd` isn't suggested in autocomplete.**
Restart Claude Code. The plugin/command index is read at startup.

**`claude plugin marketplace add` fails.**
Make sure the path you give it contains `.claude-plugin/marketplace.json`. For this repo, point at the repo root, not at `.claude-plugin/`.

**The skill activates but the model still preambles.**
Open a new session. Old session context may carry over. If it still drifts, edit `skills/i-have-adhd/SKILL.md` and tighten the rule wording, then re-invoke.

**I want different rules.**
Edit `skills/i-have-adhd/SKILL.md`. Re-invoke `/i-have-adhd` (or restart the session) and the new rules apply.
