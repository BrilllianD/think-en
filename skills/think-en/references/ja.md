# Japanese profile (`ja`)

Script: Japanese (kanji, hiragana, katakana, with Latin for code). Register: polite-neutral
です・ます.

## Technical terms

Japanese differs from most profiles here: katakana loanwords are genuinely native technical
vocabulary, not a failure of discipline. コミット and ブランチ read naturally to a Japanese developer
in a way that a transliterated `коммит` does not to a Russian one.

The line is what the reader would *type* versus what they would *say*:

```
yes   `git rebase -i main` を実行してください。
yes   auth middleware の token expiry チェックが `<` になっています。
yes   ブランチを切ってから作業します。        (prose-level concept)
no    ギットリベースを実行してください。      (a command, transliterated)
no    `コミット` してください。                (identifier in katakana, inside backticks)
```

Keep Latin, always, for anything that is an identifier: commands, flags, API and function names,
file paths, environment variables, error strings. Katakana is fine for concepts discussed in prose
where no exact token is being named.

Never put katakana inside backticks. Backticks mean "type this."

## Spacing and width

Japanese does not space between words, but inline Latin and code need breathing room. Put a
half-width space on each side of a Latin run embedded in Japanese text.

Use half-width characters for all Latin letters, digits, and code punctuation. Use full-width
Japanese punctuation（、。）in prose. Do not mix: full-width parentheses around half-width code is a
common and ugly failure.

## Grammatical person

Japanese normally omits the first-person pronoun entirely. Do not insert 私は or 自分が to mirror an
English sentence structure — it reads stiff and slightly self-important. Say 確認しました, not
私が確認しました.

Pick です・ます and hold it for the whole response. Register drift — sliding into だ・である
mid-answer, or up into 敬語 for a warning — is the most visible mistake available here, more jarring
than an awkward word choice.

## Compression notes

If a compression skill such as `caveman` is also active:

- "Drop articles" is a no-op. Japanese has none.
- Never drop particles. を, に, が, は, で carry grammatical role exactly as Russian case endings do.
  They are one or two characters and removing them destroys the sentence.
- Do not compress by switching register. だ・である is shorter than です・ます, but the saving is a
  few characters and the tone shift is large. Hold the register.
- Compress instead by dropping honorific prefixes (お / ご), softening formulas
  (〜していただけますでしょうか → 〜してください), and filler.
- Never drop ない, ません, だけ, or 以外. Negation and scope invert the sentence.

## Pitfalls

- Do not translate error text. Quote it, then gloss it.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.
- Japanese has no plural marking. Do not invent 〜たち or 〜ら for inanimate nouns to mirror an
  English plural.
- 〜する verbs attach cleanly to Latin nouns: commit する, deploy する. This is the idiomatic way to
  verb a technical term — better than forcing a native equivalent.

## Pairs well with

No Japanese prose-quality skill is currently linked here. If one is added to the ecosystem, cite it
rather than expanding this file — prose quality is out of scope for `think-en`.
