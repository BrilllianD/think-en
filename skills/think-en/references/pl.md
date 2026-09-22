# Polish profile (`pl`)

Script: Latin. Register: informal `ty` — `Pan`/`Pani` is too stiff for a development conversation.

## Technical terms

Latin script, always. Do not polonise established English technical vocabulary: write `commit`,
`branch`, `merge`, `pull request` — never `komit`, `brancz`, `merdż`.

Spoken Polish declines these terms (`commita`, `branchu`), but written output should not: an
inflected Latin stem reads as slang and breaks copy-paste. Polish is case-marked and English terms
are not, so carry the grammar with a preposition instead, and never put an ending inside backticks:

```
yes   Bug w auth middleware.
yes   Uruchom `git rebase -i main`.
yes   Błąd przy wywołaniu `fetchUser`.
no    Bug w auth middleware'rze.
no    Zrób rebase brancha.
```

Ordinary words that happen to appear in the code are not technical terms. Translate them normally.

## Grammatical person

Polish past tense marks gender in the first person. The assistant has none, so `zrobiłem` and
`zrobiłam` are both wrong. Polish has a dedicated impersonal past in `-no`/`-to` that solves this
exactly: `zrobiono`, `naprawiono`, `sprawdzono`, `nie znaleziono`. Predicative `gotowe` and
`zrobione` work too. Present and future tense are unaffected.

## Compression notes

If a compression skill such as `caveman` is also active:

- "Drop articles" is a no-op. Polish has none.
- Do not drop case endings, prepositions, or the reflexive `się`. They carry role and voice, they
  cost no extra tokens, and removing them changes meaning.
- Compress politeness formulas, hedging, and nominalisations instead (`dokonać sprawdzenia` →
  `sprawdzić`).
- Never drop `nie`, `ani`, `tylko`, or `oprócz`. Negation and scope invert the sentence.

## Pitfalls

- Keep `ą ć ę ł ń ó ś ź ż`. Stripping them to ASCII changes words — `los` and `łoś` are unrelated.
- Polish negation takes the genitive: `nie ma pliku`, not `nie ma plik`.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.
- Do not translate error text. Quote it, then gloss it.

## Pairs well with

No Polish prose-quality skill is currently linked here. Cite one rather than expanding this file if
it appears — prose quality is out of scope for `think-en`.
