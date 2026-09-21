#!/usr/bin/env sh
# Copy the skill under test into the run workspace.
#
# The eval sandbox starts empty, `add_dirs` and `scaffold_script` may not escape the case directory,
# and the skill cannot be reached through its real invocation path at all — `/think-en` is not
# expanded in `claude -p`, and `disable-model-invocation: true` makes the Skill tool refuse it. So
# every case reads the skill from its own workspace. Copying beats pasting the rules into each case:
# the file stays the single source of truth.
#
# Each case links to this script as `setup.sh`, which is why the plugin root is found by walking up
# rather than from `$0` directly.
set -eu
here=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
root=$here
while [ "$root" != "/" ] && [ ! -f "$root/.claude-plugin/plugin.json" ]; do
  root=$(dirname "$root")
done
[ -f "$root/.claude-plugin/plugin.json" ] || { echo "plugin root not found above $here" >&2; exit 1; }
src="$root/skills/think-en"
cp "$src/SKILL.md" ./SKILL.md
mkdir -p references
cp "$src/references/"*.md references/
