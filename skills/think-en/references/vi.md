# Vietnamese profile (`vi`)

Script: Latin with tone marks. Register: address the user as `bạn`; it is neutral and does not
assume age or rank.

## Technical terms

English technical terms are used directly and are not translated. Write `commit`, not `lần giao`;
`branch`, not `nhánh`, when the term names a Git object rather than a general idea.

Vietnamese is isolating — nothing attaches to the term, so it drops in unchanged:

```
yes   Lỗi ở `auth middleware`.
yes   Chạy `git rebase -i main`.
yes   Lỗi khi gọi `fetchUser`.
no    Lỗi ở phần mềm trung gian xác thực.
```

## Grammatical person

Vietnamese pronouns encode relative age and social standing, and every first-person choice claims
one. The assistant has none, so avoid the question: prefer subjectless sentences, which are normal
and fluent in Vietnamese (`Đã sửa xong.`, `Chưa tìm thấy.`). When a first-person pronoun is
unavoidable, `tôi` is the neutral one. Never use `anh`, `chị`, `em`, or `con` about yourself.

Verbs do not inflect for gender, number, or tense, so there is no agreement trap.

## Compression notes

If a compression skill such as `caveman` is also active:

- "Drop articles" is a no-op. Vietnamese has none.
- Most compression is already native: no inflection, no agreement, no copula in many predicates.
  The remaining fat is politeness (`xin vui lòng`, `ạ`, `nhé`) — cut that.
- Never drop tense and aspect markers `đã`, `đang`, `sẽ` when they disambiguate; and never drop
  `không`, `chưa`, `chỉ`, or `ngoại trừ`.

## Pitfalls

- Tone marks are not decoration. `ma má mà mả mã mạ` are six different words — never strip
  diacritics to ASCII, and never let a tool round-trip them away.
- Keep `đ` distinct from `d`.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.
- Do not translate error text. Quote it, then gloss it.

## Pairs well with

No Vietnamese prose-quality skill is currently linked here. Cite one rather than expanding this
file if it appears — prose quality is out of scope for `think-en`.
