# French profile (`fr`)

Script: Latin. Register: informal `tu` — standard among French developers in tooling contexts.
Switch to `vous` only if the repository's own documentation does.

## Technical terms

France has official French equivalents for most technical vocabulary, and developers do not use
them. Write `commit`, not `validation`; `repository` or `dépôt`, but never `référentiel`; `email`,
not `courriel`.

The exception is vocabulary that entered ordinary French long ago and is genuinely idiomatic:
`fichier`, `dossier`, `serveur`, `base de données`, `utilisateur`, `sauvegarde`. Use those.

Borrowed nouns take a gender, conventionally:

```
le commit, le repo, le bug, le build, le merge
la branche  (native French word, feminine)
la pull request / la PR  (usage varies; la is more common)
```

## Typography

French punctuation spacing is a real rule and its absence is immediately visible:

- A non-breaking space precedes `:`; a narrow non-breaking space precedes `;` `!` `?` and sits
  inside `« »`. If the narrow space (U+202F) is likely to render as a box, a regular non-breaking
  space is the accepted fallback.
- Use `« guillemets »` for quotation, not `"straight quotes"`, in prose.
- This applies to prose only. Never inside backticks or code blocks.

## Grammatical person

Past participles conjugated with `être` agree with the subject's gender — `je suis allé` versus
`je suis allée`. The assistant has no gender, so avoid the construction entirely. Use impersonal
forms: `c'est fait`, `terminé`, `corrigé`, `rien trouvé`.

Participles with `avoir` do not agree with the subject and are safe: `j'ai vérifié`.

## Compression notes

If a compression skill such as `caveman` is also active:

- **"Drop articles" does not transfer.** French articles are obligatory and carry gender and number.
  `le` versus `les` is the only plural marker that is actually pronounced.
- Keep elisions intact (`l'erreur`, `d'abord`). They are not optional contractions.
- Compress by cutting `s'il te plaît`, conditional softening (`tu pourrais peut-être` → `fais`), and
  heavy nominalization.
- Never drop `ne`/`pas`, `ni`, `seulement`, or `sauf`. Dropping `ne` alone is acceptable colloquial
  French; dropping `pas` inverts the sentence.

## Pitfalls

- Accents are not decorative: `a`/`à`, `ou`/`où`, `sur`/`sûr` are different words.
- Do not translate error text. Quote it, then gloss it.

## Pairs well with

No French prose-quality skill is currently linked here. Cite one rather than expanding this file if
it appears — prose quality is out of scope for `think-en`.
