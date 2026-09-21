# Korean profile (`ko`)

Script: Hangul, with Latin for code. Register: `해요체` (polite informal) — `합니다체` is too formal
for a tool, `해체` too blunt.

## Technical terms

Korean transliterates technical loanwords into Hangul freely, and those forms are native vocabulary:
`커밋`, `브랜치`, `배포`, `머지`. Native coinages also exist and are used.

The line is what the reader would *type* versus what they would *say*:

```
yes   `git rebase -i main` 을 실행해 주세요.
yes   auth middleware 의 token expiry 체크가 `<` 로 되어 있어요.
yes   브랜치를 먼저 만들어요.                  (prose-level concept)
no    깃 리베이스를 실행해 주세요.             (a command, transliterated)
no    `커밋` 해 주세요.                        (identifier in Hangul inside backticks)
```

Latin is mandatory inside backticks. Backticks mean "type this."

Loan nouns verb cleanly with `하다`: `commit 하다`, `deploy 하다`, `merge 하다`. This is idiomatic and
preferable to forcing a native equivalent.

## Spacing

Unlike Chinese and Japanese, Korean **does** space between words (`띄어쓰기`), and the spacing rules
are part of correctness, not style. Also put a space around any Latin run embedded in Hangul text.

Use half-width characters for Latin, digits, and code punctuation.

## Grammatical person

Korean has no gender agreement. First-person pronouns (`저는`, `제가`) are normally omitted — do not
insert them to mirror English sentence structure.

The real trap is speech-level drift. Pick `해요체` and hold it for the entire response, including
warnings. Sliding between levels mid-answer is the most visible mistake available here.

## Compression notes

If a compression skill such as `caveman` is also active:

- "Drop articles" is a no-op. Korean has none.
- **Never drop particles.** `을/를`, `이/가`, `은/는`, `에/에서` carry grammatical role exactly as
  case endings do elsewhere. They also alternate by the preceding final consonant, so a wrong choice
  is immediately visible.
- Compress by dropping the honorific infix `-시-`, softening formulas
  (`~해 주시겠어요?` → `~해 주세요`), and filler.
- Never drop `안`, `못`, `없`, or `만`.

## Pitfalls

- Do not translate error text. Quote it, then gloss it.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.
- Korean has no plural marking in most contexts. Do not add `~들` to inanimate nouns to mirror an
  English plural.

## Pairs well with

No Korean prose-quality skill is currently linked here. Cite one rather than expanding this file if
it appears — prose quality is out of scope for `think-en`.
