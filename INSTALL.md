# Install i-have-adhd

One skill. Claude Code, Codex, Antigravity, Cursor.

<details>
<summary><strong>Claude Code</strong></summary>

### Install

```bash
claude plugin marketplace add ayghri/i-have-adhd
claude plugin install i-have-adhd@i-have-adhd
```

Type `/i-have-adhd`.

### Verify

```bash
claude plugin list
```

### Update

```bash
claude plugin marketplace update i-have-adhd
```

### Uninstall

```bash
claude plugin uninstall i-have-adhd
claude plugin marketplace remove i-have-adhd
```

Or keep it installed and turn it off: `claude plugin disable i-have-adhd`.

### Always-on (optional)

Add to `~/.claude/CLAUDE.md`:

```markdown
## Output style

Always follow the rules in the `i-have-adhd` skill: action-first, numbered steps, no preamble, no closers, state restated each turn.
```

</details>

<details>
<summary><strong>Codex</strong></summary>

### Install

```bash
codex plugin marketplace add ayghri/i-have-adhd --ref main
codex plugin add i-have-adhd@i-have-adhd
```

Type `$i-have-adhd`.

### Verify

```bash
codex plugin list
```

### Update

```bash
codex plugin marketplace upgrade i-have-adhd
codex plugin remove i-have-adhd
codex plugin add i-have-adhd@i-have-adhd
```

### Uninstall

```bash
codex plugin remove i-have-adhd
codex plugin marketplace remove i-have-adhd
```

### Always-on (optional)

Add to `~/.codex/AGENTS.md`:

```markdown
## Output style

Always follow the rules in the `i-have-adhd` skill: action-first, numbered steps, no preamble, no closers, state restated each turn.
```

</details>

<details>
<summary><strong>Antigravity (<code>agy</code>)</strong></summary>

### Install

```bash
agy plugin install https://github.com/ayghri/i-have-adhd
```

### Verify

```bash
agy plugin list
```

### Update

```bash
agy plugin uninstall i-have-adhd
agy plugin install https://github.com/ayghri/i-have-adhd
```

### Uninstall

```bash
agy plugin uninstall i-have-adhd
```

Or keep it installed and turn it off: `agy plugin disable i-have-adhd`.

### Always-on (optional)

Add to `~/.gemini/GEMINI.md`:

```markdown
## Output style

Always follow the rules in the `i-have-adhd` skill: action-first, numbered steps, no preamble, no closers, state restated each turn.
```

</details>

<details>
<summary><strong>Cursor</strong></summary>

### Install

```bash
npx skills add ayghri/i-have-adhd        # this workspace
npx skills add ayghri/i-have-adhd -g     # all projects
npx skills add ayghri/i-have-adhd -a cursor -y   # Cursor only
```

New Agent chat, type `/i-have-adhd`.

Without the CLI:

```bash
git clone https://github.com/ayghri/i-have-adhd
mkdir -p ~/.cursor/skills                              # or .cursor/skills for this project only
cp -R i-have-adhd/skills/i-have-adhd ~/.cursor/skills/
```

### Verify

```bash
npx skills list
npx skills ls -g    # if installed globally
```

### Update

```bash
npx skills update i-have-adhd
npx skills update -g    # if installed globally
```

### Uninstall

```bash
npx skills remove i-have-adhd
npx skills remove i-have-adhd -g    # if installed globally
```

### Always-on (optional)

Paste into **Cursor Settings → Rules → User Rules**, or a project rule under `.cursor/rules/` with `alwaysApply: true`:

```markdown
## Output style

Always follow the rules in the `i-have-adhd` skill: action-first, numbered steps, no preamble, no closers, state restated each turn.
```

</details>

## How activation works

1. **Installed, not invoked.** Nothing happens. `SKILL.md` sets `disable-model-invocation: true`, so the model never sees the skill and never applies the rules on its own.
2. **You type `/i-have-adhd`.** Rules on for that session. "stop adhd mode" or "normal mode" turns them off.
3. **You add the always-on config above.** Rules on from message one, every session.

No middle ground. If you did not turn it on, it is off.

## Troubleshooting

**`/i-have-adhd` not in autocomplete.** Restart the agent. The plugin index is read at startup.

**`claude plugin marketplace add` fails.** Use the `owner/repo` form. A local path must point at the repo root, not `.claude-plugin/`.

**Installed but replies still preamble.** Open a new session. If it still drifts, tighten the wording in `skills/i-have-adhd/SKILL.md`.

**Want different rules.** Fork, edit `skills/i-have-adhd/SKILL.md`, install your fork: `claude plugin marketplace add <your-username>/i-have-adhd`.

**Cursor: skill missing after install.** Start a new Agent chat. Confirm `~/.cursor/skills/i-have-adhd/SKILL.md` exists and its frontmatter `name` matches the folder name.
