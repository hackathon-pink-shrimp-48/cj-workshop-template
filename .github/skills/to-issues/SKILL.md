---
name: to-issues
description: Split a PRD into independently implementable vertical slices.
---

# Process

1. Read the PRD from `docs/prd/<feature-slug>.md`.
2. Break work into thin end-to-end slices.
3. Write each slice to `docs/issues/<feature-slug>/<NN>-<slug>.md`.
4. Each slice must be independently testable and demoable.
5. Mark blockers explicitly, and include acceptance criteria in every issue.
6. When a slice's flow or sequence reads clearer as a picture, embed a small `mermaid` diagram in the issue. Only when it adds clarity.

Avoid horizontal slices like "DB only" or "UI only" unless they are independently valuable and verifiable.

Only slice what the PRD puts in scope. Never create issues for PRD "out" items (deployment, infra, auth, persistence) — they are not work here.

