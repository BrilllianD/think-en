# Arabic profile (`ar`)

Script: Arabic, right-to-left, with Latin for code. Variety: Modern Standard Arabic. Dialects vary
too much to target from a tool. Register: plain MSA, no honorific address — but Arabic marks gender
in the second person, so read **Grammatical person** before addressing the reader directly.

## Bidirectional text is the hard problem

Arabic prose runs right-to-left; code runs left-to-right. Where they meet, terminals and many
renderers reorder characters in ways that change what the reader sees — a path, a flag, or an
operator can appear in the wrong position while the underlying string is correct.

This is not cosmetic. A misread command is a wrong command.

Practical rules:

- Put anything longer than a single short token in a fenced code block on its own line. Fenced
  blocks are rendered left-to-right as a unit and are safe.
- Inline backticks are acceptable for a bare identifier (`useMemo`, `settings.json`). Avoid them for
  anything containing spaces, slashes, or operators — `git commit -m "..."` inline in Arabic prose
  is exactly the case that reorders.
- Never hand-reverse a command to "look right." The text is correct; the renderer is the problem.

## Numerals

Use Western digits (`0123456789`) for everything technical: version numbers, exit codes, ports, line
numbers, byte counts. They must match what the reader sees on screen and in the code.

Use Western digits in prose too. Eastern Arabic-Indic digits (`٠١٢٣`) are valid Arabic, but mixing
two digit sets in one answer invites misreading, and every number here may end up compared against
output.

## Punctuation

Arabic uses mirrored punctuation: `،` for comma, `؛` for semicolon, `؟` for question mark. Use them
in prose. Never inside code.

## Technical terms

Keep Latin. Arabic technical vocabulary exists but adoption is inconsistent across regions, and
developers read the English terms. Do not transliterate commands or identifiers into Arabic script —
transliteration plus bidi reordering makes a command unrecoverable.

```
yes   عدّل الملف `settings.json`.
yes   شغّل الأمر التالي:            (ثم كتلة مستقلة بالأمر نفسه)
no    عدّل الملف إعدادات.جسون.
no    شغّل `git commit -m "..."` داخل السطر.
```

## Grammatical person

Arabic first-person verbs do not mark gender (`فعلت` is the same either way), so the verb itself is
safe. Adjectives and participles do agree, so avoid self-describing ones. Prefer impersonal
constructions: `تم` + verbal noun (`تم الإصلاح`, `تم التحقق`).

The second person is the harder half, and no other profile here has this
problem: addressing the reader picks a gender. `تحقق` and `تحققي` are different
forms, and the assistant does not know which one fits. Do not guess and do not
alternate. Route around the choice — name the action instead of the actor
(`يلزم تشغيل الأمر`, `الخطوة التالية`), or use the verbal noun. Where a direct
imperative is unavoidable, use the masculine singular, the convention in Arabic
software interfaces, and hold it for the whole response.

## Compression notes

If a compression skill such as `caveman` is also active:

- **"Drop articles" does not transfer.** The definite article `ال` is written attached to its noun
  and carries definiteness. Removing it changes meaning, and it saves nothing.
- Keep prepositions and pronominal suffixes — they are attached and carry role.
- Compress by cutting elaborate courtesy formulas, which are long in MSA.
- Never drop `لا`, `لم`, `ما`, `فقط`, or `إلا`.

## Pitfalls

- Do not translate error text. Quote it in a code block, then gloss it.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.
- File paths always go in a code block, never inline in prose.

## Pairs well with

No Arabic prose-quality skill is currently linked here. Cite one rather than expanding this file if
it appears — prose quality is out of scope for `think-en`.
