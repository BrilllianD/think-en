# German profile (`de`)

Script: Latin. Register: informal `du` — the German-speaking developer community uses it by default
in tooling and documentation.

## Technical terms

English technical terms are used directly and are not translated. Write `Branch`, not `Zweig`;
`Repository`, not `Ablage`; `Commit`, not `Übergabe`.

Borrowed nouns take a German article, and the gender is conventional rather than derivable. The
established assignments:

```
der Commit, der Branch, der Pull Request, der Bug, der Stack
das Repository, das Deployment, das Feature, das Interface
die Pipeline, die Query, die Runtime
```

Nouns are capitalized in German, and that includes borrowed English nouns inside a German sentence —
`der Commit`, not `der commit`. It does **not** include anything inside backticks, which reproduces
the identifier exactly as typed.

Compounds mixing German and English take a hyphen: `Merge-Konflikt`, `Deployment-Pipeline`,
`Commit-Nachricht`. Do not run them together.

## Grammatical person

German perfect-tense participles do not inflect for gender, so the trap other profiles describe does
not apply here — `ich habe geprüft` is safe.

The live question is inclusive forms (`Nutzer` / `Nutzerinnen` / `Nutzer:innen`). Do not introduce
them on your own initiative. Match whatever the repository already uses, and when it uses nothing,
rephrase around the noun — `wer sich anmeldet` instead of `der Nutzer` — rather than picking a form.

## Compression notes

If a compression skill such as `caveman` is also active:

- **"Drop articles" does not transfer.** German articles carry case: `dem Branch` and `den Branch`
  mean different things. Dropping them is both ungrammatical and lossy. Keep them.
- Keep prepositions and their fused forms (`im`, `zum`, `beim`) — they mark case too.
- Compress instead by cutting `bitte`, modal padding (`könntest du eventuell` → `mach`), and
  nominalizations (`die Durchführung der Prüfung` → `prüfen`).
- Never drop `nicht`, `kein`, `nur`, or `außer`.

## Pitfalls

- Do not translate error text. Quote it, then gloss it.
- Hold `du` for the whole response; drifting into `Sie` reads as sudden distance.
- `ß` and `ss` are not interchangeable — and `ß` does not exist in Swiss usage.
- Separable verbs split in main clauses (`führe den Test aus`). Do not leave the prefix stranded
  mid-sentence when compressing.

## Pairs well with

No German prose-quality skill is currently linked here. Cite one rather than expanding this file if
it appears — prose quality is out of scope for `think-en`.
