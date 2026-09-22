# Dutch profile (`nl`)

Script: Latin. Register: informal `je` — the Dutch-speaking developer community uses it by default
in tooling and documentation. `u` reads as a bank letter.

## Technical terms

English technical terms are used directly and are not translated. Write `branch`, not `tak`;
`commit`, not `vastlegging`.

Two things are specific to Dutch. First, borrowed nouns take an article, and English tech loans
almost always take `de`: `de commit`, `de branch`, `de pull request`, `de pipeline`. When you are
unsure, rephrase to avoid the article rather than guessing `het`.

Second, Dutch writes compounds as one word, and that rule applies to English loans inside a Dutch
sentence. Splitting them is the *spatiefout*, the most visible error in Dutch technical writing:

```
yes   Er zit een bug in de authenticatiemiddleware.
yes   De deploymentpipeline draait al.
yes   Draai `git rebase -i main`.
no    De deployment pipeline draait al.
no    Draai een rebase op de branch.
```

Hyphenate only to prevent misreading, typically at a vowel collision: `merge-editor`. Anything
inside backticks reproduces the identifier exactly as typed and is never touched.

English verbs take Dutch conjugation: `ik merge`, `hij merget`, `we hebben gemerged`.

## Grammatical person

Dutch participles do not inflect for gender, so the trap other profiles describe does not apply —
`ik heb het gecontroleerd` is safe.

The live question is `hij`/`zij` for a person whose gender is not stated. Use `die` or rephrase
around the noun (`wie inlogt` instead of `de gebruiker ... hij`) rather than picking one.

## Compression notes

If a compression skill such as `caveman` is also active:

- **"Drop articles" does not transfer.** `de` and `het` carry gender and definiteness, and `het` is
  also a placeholder subject (`het lukt niet`) that cannot be removed at all.
- Keep `er`. It looks like filler and is not — it licenses the whole construction.
- Separable verbs split in main clauses (`voer de test uit`). Do not strand the prefix when
  compressing.
- Compress instead by cutting `even`, `eigenlijk`, `misschien`, and modal padding (`zou je kunnen`
  → an imperative).
- Never drop `niet`, `geen`, `alleen`, or `behalve`.

## Pitfalls

- `ij` is one letter for capitalisation: `IJsselmeer`, not `Ijsselmeer`.
- Do not translate error text. Quote it, then gloss it.
- Hold `je` for the whole response; drifting into `u` reads as sudden distance.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.

## Pairs well with

No Dutch prose-quality skill is currently linked here. Cite one rather than expanding this file if
it appears — prose quality is out of scope for `think-en`.
