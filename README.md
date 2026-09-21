# think-en

Answer the user in their language. Do everything else in English.

`think-en` is a Claude Code skill that splits one conversation into two languages. You read and
write your own; the model reasons in English, sends English to its tools, and writes English into
every file, commit, and issue it touches.

It is not a translator and not a language tutor. It never corrects your grammar and never teaches
you anything. It routes.

## Why

Two independent reasons, both real:

**Cost.** Non-Latin scripts tokenize badly. Cyrillic runs roughly 2–3× the tokens per word against
English; CJK and Devanagari are worse. Every thinking block, tool call, and search query in your own
language is paid for at that rate, and it fills the context window that much faster.

**Quality.** English is where the training data and effectively all technical documentation live.
The gap on ordinary work is small, but it widens on unusual libraries, rare errors, and long chains
of reasoning.

You pay both of those for the comfort of reading your own language — but only the final answer is
what you actually read. `think-en` keeps that in your language and moves the rest to English.

## Install

```
/plugin marketplace add BrilllianD/think-en
/plugin install think-en@think-en
```

Or, for a local checkout, symlink the skill:

```
git clone https://github.com/BrilllianD/think-en ~/Projects/think-en
ln -s ~/Projects/think-en/skills/think-en ~/.claude/skills/think-en
```

## Use

```
/think-en почему падает сборка?
/think-en de erkläre diesen stacktrace
/think-en ja このエラーの原因は?
```

`/think-en [lang] [question]`, where `lang` is an ISO 639-1 code. Omit it and the skill uses the
language you wrote in; write in English and it falls back to `references/default.md`.

The skill is **user-invoked only** (`disable-model-invocation: true`) and applies to **one
response**. It never fires on its own, and it does not stay on — invoke it again for the next
answer.

## What goes where

| Target language | English |
| --- | --- |
| Final answer | Thinking blocks |
| Status and progress lines | Subagent prompts, search queries |
| Warnings and confirmations | Plan files, todo items |
| Question and option text | Code, comments, identifiers |
| | Commits, PRs, issues, docs |
| | Memory files, config |

Technical terms never move: CLI commands, API names, paths, error strings, and commit-type keywords
stay verbatim in their original script, untranslated and uninflected.

## Adding a language

One file. Copy `skills/think-en/references/_template.md` to `references/<code>.md` and fill in what
does not generalize: script, register, how foreign technical terms attach to the grammar, which
compression rules are no-ops, and the traps an assistant with no gender or social standing would
otherwise walk into.

Shipped profiles: `ar`, `de`, `es`, `fr`, `it`, `ja`, `ko`, `pt`, `ru`, `zh`. Languages without a
profile still work — the core rules apply and the skill says so once.

Pull requests adding profiles are welcome.

## Testing

`/check` validates structure — manifests, frontmatter, profile and README agreement, the live
symlink. Behavior is covered by an eval suite under [`evals/`](evals/README.md), which needs
`claude plugin eval` (early access). Run `/check` before committing either way.

## Pairs well with

Prose quality in the target language is out of scope. These handle it, and stack cleanly on top:

- [ru-text](https://github.com/geserdugarov/shared-skill-ru-text) — Russian typography, info-style,
  editorial
- [russian-text-quality](https://github.com/Anic888/russian-text-quality) — Russian pluralization,
  case agreement, terminology drift

Compression skills such as [caveman](https://github.com/JuliusBrussee/caveman) also stack:
`think-en` decides the language, they decide the density. Where a compression skill pins output to
your input language, `think-en` takes precedence.

## Not this

If you want to *learn* a language while you code, you want the opposite of this tool. See
[lang-coach](https://github.com/miravy/claude-lang-coach),
[lang-tutor](https://github.com/hamsamilton/lang-tutor), or
[fluent](https://github.com/m98/fluent).

## License

MIT
