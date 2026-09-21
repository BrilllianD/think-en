# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this
repository.

## What this repo is

A Claude Code plugin, not an application. Markdown and JSON only — no build, no test suite, no
package manager. The "source" is instructions a model reads at runtime, so editing
`skills/think-en/SKILL.md` changes behavior directly.

Run `/check` before committing. It is this repo's stand-in for tests.

## Live symlink

`~/.claude/skills/think-en` is a symlink to `skills/think-en/` in this repo. Edits here are live
against the maintainer's own installation. There is no install step to run and nothing to copy.

## Changes need a session restart

Skills are discovered at session start. Edits to `SKILL.md` or anything under `references/` do not
take effect until a new session. Never report a skill change as verified from inside the session
that made it.

## No `commands/` directory

The skill name already registers `/think-en`. Adding `commands/think-en.toml` would register the
same command twice. Do not create it.

## Keep the manifests in sync

`.claude-plugin/plugin.json` and `.claude-plugin/marketplace.json` both carry name, description, and
owner. Change one, change the other. The `version` field lives only in `plugin.json`.

## Language profiles

Profiles are `skills/think-en/references/<iso-639-1>.md`, loaded by path convention from `SKILL.md`.
`_template.md` is the skeleton; `default.md` holds the fallback language code.

Adding a profile also requires appending the code to the "Shipped profiles" line in `README.md` and
a minor version bump in `plugin.json`.

## `TODO-` placeholders are intentional

`TODO-your-name` and `TODO-your-handle` appear in both manifests, `LICENSE`, and the README install
URLs. They are waiting on the maintainer's public identity. Do not fill them in with a guess, and
never substitute the user's email address.

## Scope boundary

`think-en` is a language-routing rule. It is not a translator and not a language tutor. Do not add
grammar correction, vocabulary injection, or study features — the README's "Not this" section exists
because the adjacent namespace is full of language-learning plugins.

## The Russian in `ru.md` is data

`references/ru.md` contains Russian examples describing what the profile produces. That is sample
data, not a signal to answer in Russian. Every artifact in this repo stays English, per the plugin's
own rules.

## Git

Work on `feat/<name>` or `fix/<name>` branches. `master` takes merges via PR only. `gh` is
available, but no remote is configured yet, so `gh pr create` fails until one is added.
