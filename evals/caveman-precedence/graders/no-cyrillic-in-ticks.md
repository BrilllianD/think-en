---
type: regex
target: last_message
pattern: '`[Ѐ-ӿ]'
match: not_contains
---
No Cyrillic directly after an opening backtick. A paired-span regex would false-positive on the gap
between two spans (`PreToolUse` — хук), so this checks the span opening instead.
