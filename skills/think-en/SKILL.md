---
name: think-en
description: Reply to the user in their language while reasoning, tooling, and persisted artifacts stay English. User-invoked only; applies to one response.
disable-model-invocation: true
---

# think-en

Answer the user in their language. Do everything else in English.

Two languages are in play and they never mix:

- **Target language** — what the user reads. Set per invocation.
- **English** — what the model thinks in, what the tools receive, and what gets written to disk.

This is a routing rule, not a translation service and not a language tutor. Never coach the user on
their language, never offer corrections, never append study notes.

## Invocation

`/think-en [lang] [question]`

`lang` is an ISO 639-1 code: `ru`, `de`, `es`, `ja`, `fr`, `pt`, `zh`, …

Resolve the target language in this order, stopping at the first that applies:

1. The explicit `lang` argument.
2. The language the user wrote the invoking message in, when that is not English.
3. The code recorded in `references/default.md`.

State the resolved language only if it came from step 3 and the user gave no argument — one short
clause, not a separate line.

## Scope

Applies to **the response immediately following invocation**, then stops. It does not carry over to
later turns; the user re-invokes to continue. Do not treat a following message in the target
language as an implicit re-invocation.

## What goes in the target language

Everything the user sees:

- The final answer.
- Pre-tool status lines and any progress text.
- Warnings and irreversible-action confirmations.
- `AskUserQuestion` question text, headers, option labels, and option descriptions.

## What stays in English

**Internal work** — the user may see some of this, but it is machine-facing:

- Thinking blocks.
- Subagent prompts and task descriptions.
- `Grep` / `Glob` / search queries.
- `TodoWrite` items.
- Plan file contents.

**Persisted artifacts** — anything that outlives the conversation or reaches another person:

- Code, identifiers, string literals, and comments.
- Commit messages and branch names.
- PR, issue, ticket, and bug-report bodies.
- Documentation, README files, and changelogs.
- Memory files and configuration.
- Messages sent to third parties or other agents.

When the user explicitly asks for one of these in their own language, honor that — an explicit
request wins over this rule.

## Technical terms

Technical terms keep their original form, verbatim, in their original script:

- CLI commands and flags — `git rebase -i`, `--no-verify`
- API, library, function, class, and file names — `useMemo`, `PreToolUse`, `settings.json`
- Paths, URLs, environment variables
- Error strings and exit codes
- Protocol and format names — HTTP, JSON, gRPC
- Commit-type keywords — `feat`, `fix`, `chore`

Never translate them. Never transliterate them into the target script. Never inflect them inside
backticks. Attach the surrounding grammar to the sentence, not to the term.

## Quoting

Error messages and command output are reproduced exactly and never translated. A short gloss in the
target language may follow the quote. Numbers, units, versions, and negation stay exact.

## Language profiles

Before answering, read `references/<lang>.md` and apply it on top of these rules. The profile owns
script-specific guidance: term handling, register, morphology traps, and which compression rules are
no-ops.

If no profile file exists for the resolved language, apply the core rules and note once, in the
target language, that no profile has been written for it yet. Then answer normally.

## Precedence over other style skills

Style skills that pin output to the user's input language — `caveman` among them, whose rules say
"Preserve user's dominant language exactly — never switch" — are overridden here. While `think-en`
is in effect, output language is the resolved target language regardless of what the user typed.

Everything else those skills specify still applies. Compression, tone, and formatting rules stack on
top of the language routing; they do not compete with it.

## Safety carve-out

Security warnings, destructive-action confirmations, and multi-step sequences where order matters
stay in the target language but drop all compression. Full sentences, explicit ordering, nothing
elided. A misread warning costs more than any token saved.
