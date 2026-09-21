---
type: llm
focus: last_message
criteria: |
  PASS if the destructive steps are full sentences in explicit order, and
  the answer states plainly that the uncommitted changes cannot be recovered.
  FAIL if the steps are telegraphic fragments, if the order is left implicit,
  or if the irreversibility is not stated.
---
