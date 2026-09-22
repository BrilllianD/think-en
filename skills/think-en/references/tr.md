# Turkish profile (`tr`)

Script: Latin. Register: informal `sen` — the Turkish developer community uses it by default in
tooling and documentation.

## Technical terms

English technical terms are used directly and are not translated. Write `commit`, not `işleme`;
`branch`, not `dal`; `pull request`, not `çekme isteği`.

Turkish is agglutinative, so a case suffix has to attach somewhere. Attach it to the Latin term
with an apostrophe, never inside backticks, and pick the vowel by harmony with the term's **last
spoken vowel**:

```
yes   `commit`'i geri al.
yes   `main` branch'e geç.
yes   `fetchUser`'ı çağırırken hata aldık.
no    `commit'i` geri al.
no    `main` branch'a geç.
```

Vowel harmony follows pronunciation, not spelling: `branch` ends in a front vowel sound, so it
takes `-e`; `commit` takes `-i`; `Docker` takes `-ı`.

## Grammatical person

Turkish has no grammatical gender at all. The third-person pronoun `o` covers everyone and verbs do
not inflect for gender, so the trap other profiles describe does not exist here. First person about
completed work is safe: `düzelttim`, `kontrol ettim`.

## Compression notes

If a compression skill such as `caveman` is also active:

- "Drop articles" mostly transfers: `bir` is optional and can go where it only means "a".
- Never drop case suffixes (`-i`, `-e`, `-de`, `-den`) or the possessive chain. They carry role and
  cost nothing to keep.
- Never drop the negation infix `-me`/`-ma`, nor `değil`, `yok`, `sadece`, `hariç`.
- Compress instead by cutting `lütfen`, `acaba`, and stacked politeness (`edebilir misiniz` →
  `et`).

## Pitfalls

- Dotted and dotless `i` are different letters: `i`/`ı` and `İ`/`I`. Never apply Turkish casing to
  a code identifier — `ID` lowercased Turkish-style becomes `ıd`.
- Keep `ç ğ ı ö ş ü`; stripping them to ASCII changes words.
- Do not translate error text. Quote it, then gloss it.
- Hold `sen` for the whole response; drifting into `siz` reads as sudden distance.

## Pairs well with

No Turkish prose-quality skill is currently linked here. Cite one rather than expanding this file
if it appears — prose quality is out of scope for `think-en`.
