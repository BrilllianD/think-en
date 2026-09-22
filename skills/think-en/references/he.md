# Hebrew profile (`he`)

Script: Hebrew, right-to-left, with Latin for code. Register: informal. Israeli technical writing
is informal by default and has no polite second person to choose.

## Bidirectional text

Hebrew prose runs right-to-left; code runs left-to-right. Where they meet, terminals and many
renderers reorder characters, so a path or a flag can appear in the wrong position while the
underlying string is correct. A misread command is a wrong command.

- Put anything longer than a bare identifier in a fenced code block on its own line. Fenced blocks
  render left-to-right as a unit and are safe.
- Inline backticks are fine for a single token (`useMemo`, `settings.json`), not for anything with
  spaces, slashes, or operators.
- Never hand-reverse a command to make it look right. The text is correct; the renderer is not.

## Technical terms

Latin script, always. Do not transliterate identifiers or commands into Hebrew letters —
transliteration plus bidi reordering makes a command unrecoverable.

Hebrew's one-letter prefixes (`ב`, `ל`, `מ`, `ה`, `ו`) attach to the following word. Attach them
outside the backticks, never inside:

```
yes   יש באג ב-`auth middleware`.
yes   הרץ את הפקודה הבאה:          (ואז בלוק קוד נפרד)
no    יש באג באות' מידלוור.
no    הרץ `git commit -m "..."` בתוך השורה.
```

The hyphen after a prefix before a Latin word is the standard convention and keeps the identifier
selectable.

## Grammatical person

Hebrew marks gender almost everywhere, and two separate problems follow.

The assistant's own person: past-tense first person is genderless (`בדקתי`, `תיקנתי`) and safe.
Present tense is not — `אני בודק` and `אני בודקת` differ. Prefer past tense or impersonal forms
(`נמצא`, `תוקן`, `לא נמצא`).

Addressing the user: the second person picks a gender in every tense, and `תריץ` and `תריצי` are
different words. Do not guess and do not alternate. Route around it with the infinitive or an
impersonal construction — `צריך להריץ`, `כדאי לבדוק`, `השלב הבא` — which is idiomatic in Hebrew
instructions.

## Compression notes

If a compression skill such as `caveman` is also active:

- **"Drop articles" does not transfer.** The definite article `ה` is a prefix written onto its
  noun. Removing it changes definiteness and saves nothing.
- **Never drop `את`.** It marks the definite direct object and has no English counterpart, so a
  compression rule written for English will not know to keep it.
- Keep prefixed prepositions and possessive suffixes — they are attached and carry role.
- Never drop `לא`, `אין`, `רק`, or `חוץ מ`.

## Pitfalls

- Final letters are obligatory in final position: `ך ם ן ף ץ`.
- No niqqud in technical prose; it reads as a textbook.
- Hebrew acronyms take gershayim before the last letter (`ממ"ד`) — but never touch Latin
  abbreviations, which stay Latin: API, HTTP, CLI, SQL.
- Do not translate error text. Quote it in a code block, then gloss it.

## Pairs well with

No Hebrew prose-quality skill is currently linked here. Cite one rather than expanding this file if
it appears — prose quality is out of scope for `think-en`.
