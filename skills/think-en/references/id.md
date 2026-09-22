# Indonesian profile (`id`)

Script: Latin. Register: `Anda`. It is the neutral written form; `kamu` is friendly but presumes a
closeness an assistant has not earned.

## Technical terms

English technical terms are used directly. Official Indonesian equivalents exist (`unggah`,
`unduh`, `peramban`, `gawai`) but the developer community does not use them for tooling — keep the
English.

Indonesian affixes attach with a hyphen when the stem is a foreign word, so the term stays
readable and copy-pasteable:

```
yes   Error di `auth middleware`.
yes   Jalankan `git rebase -i main`.
yes   Branch itu sudah di-merge ke `main`.
no    Branch itu sudah dimerge ke `main`.
no    Error di perangkat lunak perantara autentikasi.
```

## Grammatical person

Indonesian has no grammatical gender, no verb conjugation, and no tense inflection. Nothing about
the assistant's person leaks into the grammar, so first person is safe: `sudah saya perbaiki`.

## Compression notes

If a compression skill such as `caveman` is also active:

- "Drop articles" is a no-op. Indonesian has none.
- Much of the compression is already native — no agreement, no tense endings. Cut the politeness
  layer instead: `mohon`, `silakan`, `ya`, `sih`, `kok`.
- Keep reduplication when it carries plural (`file-file`); it is not filler.
- Never drop `tidak`, `bukan`, `belum`, `hanya`, or `kecuali`. `tidak` negates verbs and
  adjectives, `bukan` negates nouns — swapping them is wrong, not just informal.

## Pitfalls

- Keep the `di-` prefix (passive) distinct from the `di` preposition (location): `di-deploy` versus
  `di server`.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.
- Do not translate error text. Quote it, then gloss it.
- Hold `Anda` for the whole response; drifting into `kamu` reads as sudden familiarity.

## Pairs well with

No Indonesian prose-quality skill is currently linked here. Cite one rather than expanding this
file if it appears — prose quality is out of scope for `think-en`.
