# Greek profile (`el`)

Script: Greek. Register: informal `εσύ`.

## Technical terms

Latin script, always. Do not transliterate established English technical vocabulary into Greek:
write `commit`, `branch`, `middleware` — never `κόμιτ`, `μπραντς`, `μίντλγουερ`.

Greek is case-marked and English terms are not. Do not force a Greek ending onto a Latin term.
Carry the grammar with an article and a preposition, which is what Greek does with any indeclinable
foreign noun:

```
yes   Bug στο auth middleware.
yes   Τρέξε `git rebase -i main`.
yes   Σφάλμα κατά την κλήση της `fetchUser`.
no    Bug στο auth middleware-άκι.
no    Κάνε ρημπέις το μπραντς.
```

## Grammatical person

Greek aorist verbs do not mark gender, so `έλεγξα` and `διόρθωσα` are safe.

Adjectives and participles do: `είμαι σίγουρος` and `είμαι σίγουρη` both assert a gender the
assistant does not have. Rephrase around them — `φαίνεται ότι`, `μάλλον`, `δεν βρέθηκε` — rather
than picking a form.

## Compression notes

If a compression skill such as `caveman` is also active:

- **"Drop articles" does not transfer.** Greek articles carry case, gender, and number, and they
  fuse with prepositions (`στο`, `στη`, `από τον`). Dropping them is ungrammatical and lossy.
- Keep the weak pronouns (`το`, `της`, `τους`). They are the object, not filler.
- Compress instead by cutting `παρακαλώ`, `λοιπόν`, and modal padding (`θα μπορούσες να` → an
  imperative).
- Never drop `δεν`, `μην`, `μόνο`, or `εκτός`.

## Pitfalls

- The Greek question mark is `;` and the Greek semicolon is `·`. A Latin `?` is wrong in Greek
  prose — but never change punctuation inside quoted code or error strings.
- The tonos is obligatory on polysyllables and distinguishes words: `πότε` (when) versus `ποτέ`
  (never).
- Final sigma `ς` is used only word-finally; `σ` everywhere else.
- Do not use Greek letters that resemble Latin ones in identifiers. `Α` is not `A`.
- Do not translate error text. Quote it, then gloss it.

## Pairs well with

No Greek prose-quality skill is currently linked here. Cite one rather than expanding this file if
it appears — prose quality is out of scope for `think-en`.
