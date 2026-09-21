---
name: pilot-invocation
tags: [pilot]
description: Harness smoke test — does an explicit /think-en invocation fire the skill inside the eval sandbox?
expected_outcome: The think-en skill is invoked and the answer is in Russian.
max_turns: 6
timeout_seconds: 300
runs: 1
allowed_tools: [Read, Glob, Grep, Skill]
---

/think-en ru why does `npm ci` fail when `package-lock.json` is out of date?
