# Eval suite

`think-en` is a routing rule, so the only thing worth testing is where each kind of text ends up:
the user's language for anything they read, English for thinking, tool inputs, and anything
persisted. `/check` validates structure. This suite validates behavior.

## Prerequisites

`claude plugin eval` is gated. On `claude` 2.1.268 every invocation — including
`claude plugin eval init --bare` — answers:

```
`plugin eval` is currently in early access
```

Upgrade first (`claude` is managed by mise here):

```sh
mise use -g claude@latest
claude plugin eval --help
```

If the gate persists after the upgrade, it is account-level early access, not a version problem, and
the suite cannot run at all. Nothing else in this repo depends on it.

## Running

```sh
# Harness smoke test: does an explicit /think-en fire the skill inside the sandbox?
claude plugin eval . --case pilot-invocation --runs 1 --ablation none --max-cost-usd 2

# Cheap subset
claude plugin eval . --tag smoke --runs 2 --ablation none --max-cost-usd 5

# Everything
claude plugin eval . --ablation none --max-cost-usd 20 --json evals/results/last.json
```

`--ablation none` is deliberate. The default `with-without` adds a no-plugin baseline arm, but
without the plugin `/think-en` does not resolve at all, so that arm measures nothing and doubles the
cost.

Runs cost money on your account. Always pass `--max-cost-usd`.

## What the sandbox does and does not give you

Each case runs as a throwaway `claude -p` child: empty home, fresh `CLAUDE_CODE_CONFIG_DIR`, no user
`CLAUDE.md`, no hooks, no other plugins. Two consequences:

- **Good:** every case gets a clean session. The suite needs that — a prior `/think-en` turn
  contaminates the scope-expiry and the announce-once cases.
- **Bad:** compression skills are not loaded. Cases that test precedence over `caveman` inject its
  rules through `append_system_prompt` instead of relying on the real plugin. That tests the rule,
  not the real interaction.

## Cases

`pilot-invocation` exists. The rest are written once the harness is reachable and its grader schema
can be verified against a real run — in particular how a grader expresses a *negative* assertion
("no Cyrillic in this answer"), which most of the matrix depends on.

Planned, ranked by how likely the failure is:

| case | failure it catches |
|---|---|
| `scope-expiry` | sticky mode — still in the target language on the next, un-invoked turn |
| `caveman-precedence` | obeying a compression skill's "never switch", or dropping compression |
| `default-fallback` | English question, no argument — ignoring `default.md`, or announcing twice |
| `english-tooling` | thinking, search queries, todo items drifting into the user's language |
| `artifact-english` | commit message written in the user's language |
| `ru-term-inflection` | `ребейз`, `middleware'е`, gendered `я проверил` — what `ru.md` prevents |
| `ask-user-question` | labels and headers left English while only descriptions get translated |
| `missing-profile` | no profile for the code — note in English, or silent fallback to `ru` |
| `safety-decompression` | destructive sequence emitted telegraphically despite the carve-out |

## Manual checklist

Cheaper by hand than as eval cases, and some of it the sandbox cannot reach. Run in a **fresh
session** — skills load at session start, so a session that edited `SKILL.md` cannot verify it.

- Real `caveman` stacking: answer is in the target language *and* still compressed.
- `AskUserQuestion`: question text, header, every label, every description — all in the
  target language.
- Plan mode: the plan file is English, the chat summary is not.
- `ja`: no katakana inside backticks, half-width code, no full-width parentheses around code.
- `zh`: Simplified and Traditional vocabulary never mixed inside one answer.
- `ar`: multi-token commands in fenced blocks, Western digits, no gendered address to the reader.
