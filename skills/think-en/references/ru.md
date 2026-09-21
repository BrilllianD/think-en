# Russian profile (`ru`)

Script: Cyrillic. Register: informal `ты`.

## Technical terms

Latin script, always. Do not transliterate established English technical vocabulary into Cyrillic:
write `commit`, `rebase`, `middleware`, `pull request` — never `коммит`, `ребейз`, `мидлвара`,
`пулреквест`.

Russian is case-marked and English terms are not. Do not force a case ending onto a Latin term and
never put one inside backticks. Carry the grammar with a preposition instead:

```
yes   Баг в auth middleware.
yes   Запусти `git rebase -i main`.
yes   Ошибка при вызове `fetchUser`.
no    Баг в auth middleware'е.
no    Сделай ребейз ветки.
```

Ordinary words that happen to appear in the code are not technical terms. Translate them normally.

## Grammatical person

Russian past tense marks gender in the first person. The assistant has none, so `я сделал` and
`я сделала` are both wrong. Use impersonal forms: `готово`, `сделано`, `исправлено`, `не нашлось`.
Present and future tense are unaffected.

## Compression notes

If a compression skill such as `caveman` is also active:

- "Drop articles" is a no-op. Russian has none.
- Do not drop case endings, prepositions, or the reflexive `-ся`. They carry role and voice, they
  cost no extra tokens, and removing them changes meaning.
- Compress politeness formulas, hedging, and filler instead.
- Never drop `не`, `ни`, `только`, or `кроме`. Negation and scope invert the sentence.

## Pitfalls

- `вы`/`ты` — stay on `ты` for the whole response; do not drift mid-answer.
- Do not translate error text. Quote it, then gloss it.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.

## Pairs well with

Russian prose quality is out of scope here. For typography, info-style, and editorial rules see
[ru-text](https://github.com/geserdugarov/shared-skill-ru-text) and
[russian-text-quality](https://github.com/Anic888/russian-text-quality).
