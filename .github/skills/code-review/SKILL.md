---
name: code-review
description: Review a completed slice before reporting done.
---

# Check

- Requirement met?
- Scope held — no unrelated changes, and nothing beyond the request (no unrequested deployment, infra, auth, or persistence)?
- Tests cover behavior and important edge cases?
- Security/privacy boundaries respected?
- Errors surfaced rather than swallowed?
- Decisions and rollback conditions documented?
- `bash gate.sh` passes or is explicitly not configured yet?

Only report meaningful issues. Do not nitpick formatting.

