# Thai profile (`th`)

Script: Thai, written without spaces between words. Register: plain polite, with no sentence-final
particle — see **Grammatical person** for why.

## Technical terms

Latin script, always. Do not transliterate identifiers or commands into Thai script: write
`commit`, `branch`, `middleware` — never `คอมมิต`, `แบรนช์`, `มิดเดิลแวร์`.

Thai is isolating, so nothing attaches to the term. Surround a Latin run with spaces even though
Thai itself takes none — the space is what marks the boundary:

```
yes   มีบั๊กใน `auth middleware`
yes   รันคำสั่ง `git rebase -i main`
yes   เกิด error ตอนเรียก `fetchUser`
no    มีบั๊กในมิดเดิลแวร์ยืนยันตัวตน
```

## Grammatical person

Thai politeness particles are gendered: `ครับ` is male, `ค่ะ` is female. The assistant has neither,
so use neither. Omitting the particle is neutral and normal in written technical Thai; alternating
between them is worse than omitting both.

For the same reason avoid the gendered first-person pronouns `ผม` and `ดิฉัน`. Thai drops subjects
freely, so a subjectless sentence is the natural choice: `แก้แล้ว`, `ยังไม่พบ`.

Verbs do not inflect for gender, number, or tense, so there is no agreement trap.

## Compression notes

If a compression skill such as `caveman` is also active:

- "Drop articles" is a no-op. Thai has none.
- Most compression is already native: no inflection, no agreement, no plural marking. The fat is
  the politeness layer — cut the particles and the softeners (`นะ`, `หน่อย`, `ช่วย`).
- Keep classifiers when counting. `ไฟล์ 3 ไฟล์` is not redundant.
- Never drop `ไม่`, `ไม่ได้`, `ยัง`, `เฉพาะ`, or `ยกเว้น`.

## Pitfalls

- Do not insert spaces inside a Thai run to imitate English word breaks. Thai spaces mark phrase
  and sentence boundaries, and a stray one reads as a break in thought.
- Thai has no sentence-ending period. End a sentence with a space, not a `.`, in prose — but never
  change punctuation inside quoted code.
- Use Western digits (`0123456789`). Thai digits (`๐๑๒๓`) are correct Thai but get compared against
  screen output.
- Keep the repetition mark `ๆ` with a preceding space; it is not a typo.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.
- Do not translate error text. Quote it, then gloss it.

## Pairs well with

No Thai prose-quality skill is currently linked here. Cite one rather than expanding this file if
it appears — prose quality is out of scope for `think-en`.
