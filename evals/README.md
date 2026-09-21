# Eval suite

`think-en` is a routing rule, so the only thing worth testing is where each kind of text ends up:
the
user's language for anything they read, English for thinking, tool inputs, and anything persisted.
`/check` validates structure. This suite validates behavior.

## Prerequisites

`claude plugin eval` is early access and was gated on 2.1.268 — every invocation, including
`init --bare`, answered `` `plugin eval` is currently in early access ``. It works on 2.1.278.

```sh
mise use -g claude@latest   # claude is managed by mise here
```

## Running

```sh
# Harness smoke test
claude plugin eval . --case pilot-invocation --runs 1 --ablation none --scaffold --max-cost-usd 2

# Cheap subset
claude plugin eval . --tag smoke --ablation none --scaffold --max-cost-usd 5

# Everything
claude plugin eval . --ablation none --scaffold --max-cost-usd 8 --json evals/results/last.json
```

`--scaffold` is mandatory, not optional tuning — see below. `--ablation none` is deliberate: the
default `with-without` adds a no-plugin baseline arm, but this plugin is never reachable in the
sandbox anyway (below), so that arm measures nothing and doubles the cost.

Runs cost money on your account. Always pass `--max-cost-usd`.

## How a case reaches the skill

Not through `/think-en`. That path does not exist in the sandbox:

- A slash command in a `claude -p` prompt is not expanded — the text arrives literally and the skill
  body never loads.
- `disable-model-invocation: true` makes the `Skill` tool refuse the skill. The trace shows the call
  and the refusal (`cannot be invoked`, `disable-model-invocation`). That is correct behavior for
  the product and fatal for testing it through its own front door.

So each case copies the real `SKILL.md` and `references/` into its run workspace with
`evals/_setup.sh`, and the prompt tells the model to read it and follow it. `add_dirs` cannot be
used
for this — neither it nor `scaffold_script` may name a path outside the case directory, which is why
every case carries `setup.sh` as a symlink to the one shared script.

What this buys: the rules are tested against the real file, so the suite cannot drift from the
skill.
What it costs: the *invocation* path is not tested. That stays a manual check.

## Grader syntax, as verified against 2.1.278

- `case.yaml`: the prompt goes in `execution.prompt`, but `runs` is top-level — under
  `execution` it is silently ignored and the default of 3 applies. Quote any `description`
  or `expected_outcome` containing `: ` — YAML parses it as a mapping otherwise.
- `regex` graders take `match: contains | not_contains | count:N`. There is no `absent`.
- `target: trace` is the whole session JSON, and it contains both plain and backslash-escaped
  quotes,
  so a field-anchored pattern should expect `\"field\"`.
- Anchor trace patterns on a field name unique to the tool you mean. `"content"` is also the field
  name for message text, so a Cyrillic-in-`content` check fires on the user's own prompt. Use
  `activeForm` for `TodoWrite`.
- `tool_used` takes `tool`, `min`, and an optional `input_match`.
- `llm` graders vote three times and cost money. One per case at most, for fluency and tone only.

## Cases

| case | failure it catches |
|---|---|
| `pilot-invocation` | the harness itself — scaffold, skill load, Russian reply |
| `default-fallback` | English question, no argument — ignoring `default.md`, or narrating it |
| `english-tooling` | search queries and todo items drifting into the user's language |
| `ru-term-inflection` | `ребейз`, inflected identifiers, gendered `я проверил` |
| `missing-profile` | `uk` has no profile — note in English, or silent fallback to `ru` |
| `caveman-precedence` | obeying a compression skill's "never switch", or dropping compression |
| `safety-decompression` | destructive sequence emitted telegraphically despite the carve-out |

## Measured state

Last full run, 2 runs per case, `--threshold` at its default 1.0: overall score 0.90, 3 of 7 cases
clean. The other four fail intermittently, and in every case the finding is real rather than a bad
grader:

- `missing-profile` — the required "no profile yet" clause appears in roughly one run in five. Two
  rounds of strengthening `SKILL.md` moved it from never to rarely; the rule needs a different
  mechanism, not firmer prose. This is the one case that has never passed.
- `caveman-precedence` — the language override holds every time, but compression is sometimes
  dropped along with it: the model reads the override as total rather than language-only.
- `ru-term-inflection` — one run transliterated a term into Cyrillic, which is the single thing
  `ru.md` exists to prevent.
- `safety-decompression` — the ordering and the irreversibility sentence land, but the judge still
  calls one run in three telegraphic.

Small sample, so read those rates as order-of-magnitude. Raise `runs` before drawing conclusions
from any one of them, and gate CI with `--threshold` below 1.0 until the intermittency is fixed.

## What the suite caught

Three of these were fixed by changing the skill, not the test:

- The resolved-language clause was skipped when the language came from `default.md` — "only if" read
  as permission rather than duty. Reworded; now clean.
- Under a compression skill, destructive sequences came out as telegraphic fragments. The carve-out
  now demands numbered steps and puts irreversibility in its own sentence.
- The missing-profile clause, above — still open.

And two graders were wrong rather than the skill: a paired-backtick regex false-positived on the gap
between two code spans, and a Cyrillic-in-`"content"` check fired on the user's own prompt rather
than on `TodoWrite`.

## Manual checklist

Run in a **fresh session** — skills load at session start, so a session that edited `SKILL.md`
cannot
verify it. Everything here is either unreachable from the sandbox or cheaper by hand.

- **Invocation**: `/think-en` actually fires, and the skill does *not* fire on its own.
- **Scope expiry**: the turn after the invocation is back to English. Automating this needs
  `context.history_file`, which takes a real recorded transcript — a hand-written `.jsonl` is
  rejected with `No conversation found with session ID`.
- **`AskUserQuestion`**: question text, header, every label, every description — all in the target
  language.
- **Plan mode**: the plan file is English, the chat summary is not.
- **Commits**: message and branch name English while the chat stays in the target language.
- **`ja`**: no katakana inside backticks, half-width code, no full-width parens around code.
- **`zh`**: Simplified and Traditional vocabulary never mixed in one answer.
- **`ar`**: multi-token commands in fenced blocks, Western digits, no gendered address to the
  reader.
