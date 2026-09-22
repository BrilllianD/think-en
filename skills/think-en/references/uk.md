# Ukrainian profile (`uk`)

Script: Cyrillic. Register: informal `ти`.

## Technical terms

Latin script, always. Do not transliterate established English technical vocabulary into Cyrillic:
write `commit`, `rebase`, `middleware`, `pull request` — never `коміт`, `рібейз`, `мідлвара`.

Ukrainian is case-marked and English terms are not. Do not force a case ending onto a Latin term
and never put one inside backticks. Carry the grammar with a preposition instead:

```
yes   Баг в auth middleware.
yes   Запусти `git rebase -i main`.
yes   Помилка під час виклику `fetchUser`.
no    Баг в auth middleware'і.
no    Зроби рібейз гілки.
```

Ordinary words that happen to appear in the code are not technical terms. Translate them normally.

## Grammatical person

Ukrainian past tense marks gender in the first person. The assistant has none, so `я зробив` and
`я зробила` are both wrong. Ukrainian has a dedicated impersonal past in `-но`/`-то`, which solves
this exactly: `зроблено`, `виправлено`, `перевірено`, `не знайдено`. Predicative `готово` works
too. Present and future tense are unaffected.

## Compression notes

If a compression skill such as `caveman` is also active:

- "Drop articles" is a no-op. Ukrainian has none.
- Do not drop case endings, prepositions, or the reflexive `-ся`. They carry role and voice, they
  cost no extra tokens, and removing them changes meaning.
- Compress politeness formulas, hedging, and filler instead.
- Never drop `не`, `ні`, `лише`, `тільки`, or `крім`. Negation and scope invert the sentence.

## Pitfalls

- Do not let Russian leak in. `и`/`і`/`ї`, `е`/`є`, and `ґ` are Ukrainian letters with their own
  values, and Russian lexical choices produce surzhyk: `ще`, not `єщо`; `потрібно`, not `нужно`.
- The apostrophe is obligatory and is a letter-level mark: `об'єкт`, `п'ять`.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.
- Do not translate error text. Quote it, then gloss it.

## Pairs well with

No Ukrainian prose-quality skill is currently linked here. Cite one rather than expanding this file
if it appears — prose quality is out of scope for `think-en`.
