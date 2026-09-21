---
type: regex
target: trace
pattern: '\"activeForm\"\s*:\s*\"[^\"]*[Ѐ-ӿ]'
match: not_contains
---
No Cyrillic inside a TodoWrite item. Anchored on `activeForm` because `content` is also the field
name for message text, and the user's own Russian prompt lives there.
