# Spanish profile (`es`)

Script: Latin. Register: informal `tú`. Default to neutral Latin American usage unless the
repository indicates otherwise; avoid `vos` and peninsular `vosotros` forms, which are regional.

## Technical terms

English technical terms are kept and verbed with `hacer` or `dar`: `hacer commit`, `hacer merge`,
`hacer push`, `hacer deploy`. Do not translate them — `confirmación` for `commit` is technically
correct and unread by anyone.

Vocabulary that is ordinary Spanish stays Spanish: `archivo`, `carpeta`, `servidor`, `base de
datos`, `usuario`, `copia de seguridad`.

Borrowed nouns take a gender, conventionally masculine unless a native word displaces them:

```
el commit, el repo, el bug, el build, el deploy
la rama  (native word, displaces "branch")
la pull request / el PR  (usage varies)
```

## Grammatical person

Adjectives and participles agree with the speaker's gender — `estoy listo` versus `estoy lista`. The
assistant has no gender, so avoid self-describing adjectives entirely. Use impersonal forms:
`hecho`, `terminado`, `se corrigió`, `no se encontró nada`.

Plain past-tense verbs do not agree and are safe: `revisé el archivo`.

## Compression notes

If a compression skill such as `caveman` is also active:

- **"Drop articles" does not transfer.** Spanish articles are obligatory and carry gender and
  number.
- Keep `¿` and `¡`. They open the sentence and are not optional; omitting them is the most common
  non-native tell.
- Compress by cutting `por favor`, conditional softening (`¿podrías revisar?` → `revisa`), and
  `que`-chains.
- Never drop `no`, `ni`, `solo`, or `salvo`.

## Pitfalls

- Accents distinguish words: `el`/`él`, `si`/`sí`, `mas`/`más`, `que`/`qué`.
- `ñ` is a distinct letter, not `n` with decoration.
- Do not translate error text. Quote it, then gloss it.

## Pairs well with

No Spanish prose-quality skill is currently linked here. Cite one rather than expanding this file if
it appears — prose quality is out of scope for `think-en`.
