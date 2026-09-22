# think-en

Answer the user in their language. Do everything else in English.

Work in the language you think in, and let the model do its thinking in the one it knows best.
`think-en` is a Claude Code skill that splits a single conversation in two: you read and write your
own language, while the model reasons in English, sends English to its tools, and writes English
into every file, commit, and issue it touches.

Nothing about the way you write has to change. It is not a translator and not a language tutor — it
never corrects your grammar, never quizzes you, and never explains a word you did not ask about. It
just routes.

## Why

Two reasons, and they are independent. Either one is enough on its own.

**It costs less.** Non-Latin scripts tokenize badly. Cyrillic runs roughly 2–3× the tokens per word
against English; CJK and Devanagari are worse. Every thinking block, tool call, and search query
written in your language is billed at that rate, and it fills your context window that much faster.

**It works better.** English is where the training data and effectively all technical documentation
live. On everyday work the gap is small enough to ignore. It widens on unusual libraries, rare
errors, and long chains of reasoning.

Normally you pay both of those for the comfort of reading your own language — but the final answer
is the only part you actually read. `think-en` keeps that part yours and moves the rest to English.

## Install

Two lines inside Claude Code:

```
/plugin marketplace add BrilllianD/think-en
/plugin install think-en@think-en
```

Prefer to install it by hand, without the plugin system? Clone it and copy the skill in:

```
git clone https://github.com/BrilllianD/think-en
mkdir -p ~/.claude/skills/think-en
cp -r think-en/skills/think-en/. ~/.claude/skills/think-en/
```

The copy is independent of the clone, so edit `~/.claude/skills/think-en` directly. Re-run the
`cp` to pick up upstream changes — it overwrites in place, and discards local edits.

## Use

Put `/think-en` in front of your question and ask it the way you normally would:

```
/think-en warum bricht der build ab?
/think-en ja このエラーの原因は?
/think-en ru почему падает сборка?
```

The full form is `/think-en [lang] [question]`, where `lang` is an ISO 639-1 code — but you rarely
need it. Leave it out, as the first example does, and the skill replies in whatever language you
wrote in. Write in English and it falls back to `references/default.md`.

One thing worth knowing up front: the skill is **user-invoked only**
(`disable-model-invocation: true`) and applies to **one response**. It never fires on its own, and
it does not stay on — put `/think-en` in front of the next question too.

## What goes where

Everything you read stays in your language. Everything written for a machine, a repository, or
another person goes to English.

| Target language | English |
| --- | --- |
| Final answer | Thinking blocks |
| Status and progress lines | Subagent prompts, search queries |
| Warnings and confirmations | Plan files, todo items |
| Question and option text | Code, comments, identifiers |
| | Commits, PRs, issues, docs |
| | Memory files, config |

Technical terms never move. CLI commands, API names, paths, error strings, and commit-type keywords
stay verbatim in their original script, untranslated and uninflected.

## Adding a language

It is one file, and you do not have to describe your whole language — only the parts that do not
generalize. Copy `skills/think-en/references/_template.md` to `references/<code>.md` and fill in the
script, the register, how foreign technical terms attach to the grammar, which compression rules
turn into no-ops, and the traps an assistant with no gender and no social standing would otherwise
walk straight into.

Shipped profiles: `ar`, `de`, `el`, `es`, `fa`, `fr`, `he`, `hi`, `id`, `it`, `ja`, `ko`, `nl`,
`pl`, `pt`, `ru`, `th`, `tr`, `uk`, `vi`, `zh`. Your language does not need one in order to
work — without a profile the core rules still apply, and the skill says so once so you are not
left guessing.

Pull requests adding profiles are very welcome.

## Testing

`/check` validates structure — manifests, frontmatter, profile and README agreement, the live
symlink. Behavior is covered by an eval suite under [`evals/`](evals/README.md), which needs
`claude plugin eval` (early access). Run `/check` before committing either way; it is this repo's
stand-in for a test suite.

## Pairs well with

Prose quality in the target language is out of scope here, deliberately. These pick up where
`think-en` stops, and they stack cleanly on top of it.

Compression skills such as [caveman](https://github.com/JuliusBrussee/caveman) stack by design:
`think-en` decides the language, they decide the density. Where a compression skill pins output to
your input language, `think-en` takes precedence.

For Russian specifically, two skills handle the editing `think-en` stays out of:

- [ru-text](https://github.com/geserdugarov/shared-skill-ru-text) — Russian typography, info-style,
  editorial
- [russian-text-quality](https://github.com/Anic888/russian-text-quality) — Russian pluralization,
  case agreement, terminology drift

## Not this

If you want to *learn* a language while you code, this is the opposite of the tool you want — and
that is a perfectly good thing to want. Try
[lang-coach](https://github.com/miravy/claude-lang-coach),
[lang-tutor](https://github.com/hamsamilton/lang-tutor), or
[fluent](https://github.com/m98/fluent).

## License

MIT
