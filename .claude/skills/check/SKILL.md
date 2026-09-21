---
name: check
description: Validate the think-en plugin — manifests, skill frontmatter, profile/README agreement, and the live symlink. Use before committing or publishing.
---

# check

Structural validation for the `think-en` plugin. This repo has no test suite; this is the
substitute.

Run every check, then report **one line per check, failures first**. Do not fix anything — report
and stop. The maintainer decides what to change.

## Checks

Run from the repo root.

1. **Manifests parse**

   ```sh
   jq -e . .claude-plugin/plugin.json >/dev/null &&
     jq -e . .claude-plugin/marketplace.json >/dev/null
   ```

2. **Names agree across manifests**

   ```sh
   jq -r '.name' .claude-plugin/plugin.json
   jq -r '.plugins[0].name' .claude-plugin/marketplace.json
   ```

   Both must be `think-en`.

3. **Skill frontmatter intact**

   ```sh
   sed -n '1,8p' skills/think-en/SKILL.md
   ```

   Must contain `name: think-en` and `disable-model-invocation: true`. The `name` must match the
   containing directory — that name is what registers the slash command.

4. **Profiles and README agree**

   ```sh
   ls skills/think-en/references/*.md
   grep -n 'Shipped profiles' README.md
   ```

   Every profile except `_template.md` and `default.md` must appear on the README line, and every
   code on that line must have a file. Report both directions.

5. **Symlink resolves into this repo**

   ```sh
   readlink -f ~/.claude/skills/think-en
   ```

   Must point at `skills/think-en` inside this checkout. A stale or missing symlink means local
   edits are not live.

6. **No `commands/` directory**

   ```sh
   test ! -d commands
   ```

   Its presence would register `/think-en` twice. See CLAUDE.md.

7. **Profiles carry every template section**

   ```sh
   for f in skills/think-en/references/[a-z][a-z].md; do
     for h in 'Technical terms' 'Grammatical person' 'Compression notes' 'Pitfalls' \
              'Pairs well with'; do
       grep -q "^## $h" "$f" || echo "$f missing: $h"
     done
   done
   ```

   The glob matches two-letter codes only, so `_template.md` and `default.md` are skipped. Any
   output line is a failure.

8. **Line width**

   ```sh
   awk 'length > 100 {print FILENAME ":" FNR ": " length}' \
     skills/think-en/SKILL.md skills/think-en/references/*.md README.md CLAUDE.md
   ```

   Prose in this repo wraps at 100 columns. Report each overlong line. Two exemptions: the
   `description` line in `SKILL.md` frontmatter must stay on one line, and lines inside fenced
   code blocks are exempt when the code cannot be broken. Say so instead of reporting them.

9. **Placeholder count** — informational, not a failure

   ```sh
   grep -rln 'TODO-your-' --exclude-dir=.git .
   ```

   Report the file count as a publishing reminder.

## Reporting

```
FAIL  <check>  <what was found>
ok    <check>
note  placeholders: N files still contain TODO-your-
```

If everything passes, say so in one line and stop.
