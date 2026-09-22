# Persian profile (`fa`)

Script: Perso-Arabic, right-to-left, with Latin for code. Register: `شما`. It is the neutral
written form and carries no honorific weight.

## Bidirectional text

Persian prose runs right-to-left; code runs left-to-right. Where they meet, terminals and many
renderers reorder characters, so a path or a flag can appear in the wrong position while the
underlying string is correct. A misread command is a wrong command.

- Put anything longer than a bare identifier in a fenced code block on its own line. Fenced blocks
  render left-to-right as a unit and are safe.
- Inline backticks are fine for a single token (`useMemo`, `settings.json`), not for anything with
  spaces, slashes, or operators.
- Never hand-reverse a command to make it look right. The text is correct; the renderer is not.

Use Western digits (`0123456789`) throughout, in prose as well as code. Persian digits (`۰۱۲۳`) are
correct Persian, but version numbers and exit codes get compared against screen output.

## Technical terms

Latin script, always. Persian equivalents exist but adoption is inconsistent, and developers read
the English. Do not transliterate identifiers or commands into Perso-Arabic script.

```
yes   باگ در `auth middleware` است.
yes   این دستور را اجرا کنید:        (سپس بلوک کد جداگانه)
no    باگ در آث میدل‌ور است.
no    دستور `git commit -m "..."` را داخل خط بنویسید.
```

Use ZWNJ (نیم‌فاصله) where Persian requires it: `می‌کند`, `فایل‌ها`, `نرم‌افزار`. A plain space
there is a spelling error, and a plain join is a different word.

## Grammatical person

Persian has no grammatical gender. Verbs, pronouns, and adjectives never mark it — `او` covers
everyone — so the trap other right-to-left profiles describe does not exist here. First person
about completed work is safe: `بررسی کردم`, `اصلاح شد`.

## Compression notes

If a compression skill such as `caveman` is also active:

- "Drop articles" is a no-op. Persian has no definite article.
- **Never drop `را`.** It marks the definite direct object; without it the sentence loses its
  object. It looks like a particle and is grammar.
- Keep the ezāfe connector. It is what binds a noun to its modifier.
- Compress instead by cutting the elaborate courtesy layer, which is long in written Persian:
  `لطفاً`, `خواهشمند است`, `به استحضار می‌رساند`.
- Never drop `نه`, the verbal negation `نمی‌`, `فقط`, or `جز`.

## Pitfalls

- Use the Persian letters, not their Arabic lookalikes: `ی` not `ي`, `ک` not `ك`. The Arabic forms
  break search and sorting.
- Persian comma is `،` and question mark is `؟` — in prose only, never inside code.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.
- Do not translate error text. Quote it in a code block, then gloss it.

## Pairs well with

No Persian prose-quality skill is currently linked here. Cite one rather than expanding this file
if it appears — prose quality is out of scope for `think-en`.
