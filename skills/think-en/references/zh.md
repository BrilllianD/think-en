# Chinese profile (`zh`)

**Default script: Simplified (zh-Hans)** — mainland usage, the larger developer population. Switch
to Traditional (zh-Hant, Taiwan/Hong Kong) only if the repository indicates it.

Register: `你`. `您` is over-formal for a development tool.

## Script choice is also a vocabulary choice

Simplified and Traditional are not a character mapping. Core technical vocabulary diverges, and
mixing the two is the most visible error available here:

```
              zh-Hans     zh-Hant
software      软件        軟體
program       程序        程式
memory        内存        記憶體
network       网络        網路
file          文件        檔案
information   信息        資訊
```

Pick one column and hold it for the whole response.

## Technical terms

Chinese has well-established native technical vocabulary — `提交` (commit), `分支` (branch), `部署`
(deploy), `合并` (merge) — and developers also use the English terms directly in speech.

The line is what the reader would *type* versus what they would *say*:

```
yes   请运行 `git rebase -i main`。
yes   auth middleware 的 token expiry 检查用了 `<`。
yes   先切一个分支再改。                    (prose-level concept)
no    请运行 吉特变基。                     (a command, translated)
no    `提交` 一下。                         (identifier in Chinese inside backticks)
```

Latin is mandatory for identifiers: commands, flags, API and function names, paths, environment
variables, error strings. Native vocabulary is fine for concepts discussed in prose.

## Spacing and width

Chinese does not space between words, but inline Latin and code need room. Put a half-width space on
each side of a Latin run embedded in Chinese text.

Use half-width characters for Latin letters, digits, and code punctuation. Use full-width Chinese
punctuation（，。）in prose. Do not wrap half-width code in full-width parentheses.

## Grammatical person

Chinese has no gender agreement, no tense inflection, and no case, so the traps in the European
profiles do not apply. First-person pronouns are commonly omitted; do not insert `我` to mirror an
English sentence.

## Compression notes

If a compression skill such as `caveman` is also active:

- "Drop articles" is a no-op. Chinese has none.
- Chinese compresses naturally, which makes over-compression the real risk. Keep aspect markers
  (`了`, `过`, `着`) — they carry completion and experience, not politeness.
- Keep measure words (`个`, `次`, `项`) where the count matters.
- Compress by cutting `请`, `麻烦`, and softening formulas.
- Never drop `不`, `没`, `只`, or `除了`.

## Pitfalls

- Do not mix Simplified and Traditional within one response.
- Do not translate error text. Quote it, then gloss it.
- Latin abbreviations stay Latin: API, HTTP, CLI, SQL.

## Pairs well with

No Chinese prose-quality skill is currently linked here. Cite one rather than expanding this file if
it appears — prose quality is out of scope for `think-en`.
