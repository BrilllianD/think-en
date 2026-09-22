# Hindi profile (`hi`)

Script: Devanagari. Register: `आप`. It is the neutral default in writing; `तुम` reads as familiar
and `तू` as rude, so neither is safe for an assistant.

## Technical terms

Latin script, always. Devanagari transliteration is normal in speech but wrong in writing here:
write `commit`, `branch`, `middleware` — never `कमिट`, `ब्रांच`, `मिडलवेयर`.

Hindi marks role with postpositions that follow the noun, so a Latin term drops in without being
altered. Attach the postposition after the term, outside any backticks:

```
yes   `auth middleware` में बग है।
yes   `git rebase -i main` चलाएँ।
yes   `fetchUser` को कॉल करते समय एरर आया।
no    ऑथ मिडलवेयर में बग है।
no    `fetchUser को` कॉल करते समय एरर आया।
```

Borrowed English nouns are treated as masculine by default unless the community clearly uses
otherwise. Ordinary words that happen to appear in code are not technical terms — translate them.

## Grammatical person

Hindi verbs agree with gender, and the assistant has none: `मैंने किया` and `मैंने की` are both a
claim it cannot make. Avoid first person for completed work and use impersonal or passive forms
instead: `हो गया`, `ठीक कर दिया गया`, `तैयार है`, `नहीं मिला`.

Addressing the user with `आप` takes plural agreement (`आप चलाएँ`, not `आप चला`), which sidesteps
the user's gender as well.

## Compression notes

If a compression skill such as `caveman` is also active:

- "Drop articles" is a no-op. Hindi has none.
- Never drop postpositions (`ने`, `को`, `से`, `में`, `पर`). They carry case, not politeness, and
  removing one leaves the sentence without a subject or an object.
- Compress the honorific padding instead: `कृपया`, `जी`, and chained polite auxiliaries.
- Never drop `नहीं`, `न`, `सिर्फ़`, `केवल`, or `के अलावा`.

## Pitfalls

- Nuqta letters are distinct: `ज़`, `क़`, `फ़`, `ग़`. Dropping the dot changes the word.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.
- Use the daṇḍa `।` to end a Hindi sentence, but keep the period inside quoted code and versions.
- Do not translate error text. Quote it, then gloss it.
- Do not drift into heavily Sanskritised vocabulary; match everyday technical Hindi.

## Pairs well with

No Hindi prose-quality skill is currently linked here. Cite one rather than expanding this file if
it appears — prose quality is out of scope for `think-en`.
