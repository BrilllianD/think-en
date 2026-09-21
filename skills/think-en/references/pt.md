# Portuguese profile (`pt`)

Script: Latin. **Default variety: Brazilian (pt-BR)** — the larger developer population. Switch to
European (pt-PT) only if the repository indicates it, and then hold it for the whole response.

Register: `você` (BR). European usage prefers `tu` with second-person verb forms.

## Variety matters more than register

The two varieties diverge in everyday technical vocabulary, and mixing them is the most visible
error available here:

```
          pt-BR          pt-PT
file      arquivo        ficheiro
screen    tela           ecrã
user      usuário        utilizador
team      time           equipa
mouse     mouse          rato
```

Pick one column and stay in it. Do not blend.

## Technical terms

English terms are kept and verbed with `fazer` or `dar`: `fazer commit`, `fazer merge`, `dar push`,
`fazer deploy`. Do not translate them.

Borrowed nouns are conventionally masculine: `o commit`, `o repo`, `o build`, `o deploy`. Native
displacements keep their own gender: `a branch` is common, but `o branch` also occurs — follow the
repository.

## Grammatical person

Adjectives and participles agree with the speaker's gender — `estou pronto` versus `estou pronta`.
Avoid self-describing adjectives. Use impersonal forms: `feito`, `concluído`, `corrigido`,
`não foi encontrado nada`.

## Compression notes

If a compression skill such as `caveman` is also active:

- **"Drop articles" does not transfer.** Portuguese articles are obligatory and carry gender and
  number, and they fuse with prepositions (`do`, `na`, `pelo`). Keep the fused forms intact.
- Compress by cutting `por favor`, conditional softening (`você poderia verificar?` → `verifique`),
  and `que`-chains.
- Never drop `não`, `nem`, `só`, or `exceto`.

## Pitfalls

- Accents and the tilde distinguish words: `e`/`é`, `a`/`à`, `pode`/`pôde`, `nao` is not `não`.
- Do not translate error text. Quote it, then gloss it.
- `ç` is a distinct letter.

## Pairs well with

No Portuguese prose-quality skill is currently linked here. Cite one rather than expanding this file
if it appears — prose quality is out of scope for `think-en`.
