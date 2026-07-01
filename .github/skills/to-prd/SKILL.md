---
name: to-prd
description: Turn an aligned request into a PRD/feature spec.
---

# Process

1. Read `AGENTS.md` and `CONTEXT.md`.
2. Synthesize what is already known. Do not invent missing policy; mark it `NEEDS CLARIFICATION`.
3. Write the PRD to `docs/prd/<feature-slug>.md` with these sections:
   - Problem
   - Approach and value
   - Scope — in / out. Put deployment, infra/CI-CD, auth, persistence, and scaling under **out** unless the request names them.
   - Scenarios — actor, why it matters, how to test independently, Given/When/Then acceptance criteria
   - Requirements — FR-00x (verifiable behavior). Add NFR-00x (perf/security/observability) only when the request needs them; otherwise write "NFR: none for this scope."
   - Completion — P1 scenario works, acceptance criteria are tested, `bash gate.sh` passes, PR notes decisions and rollback
   - Open questions — `[NEEDS CLARIFICATION: ...]`
4. Where a diagram is clearer than prose — request flow, state machine, actor interaction, data model — embed a `mermaid` block in the relevant section. Add one only when it removes ambiguity.
5. Stay inside the request. A PRD specifies only what was asked; it never implies deployment, infrastructure, or operations. If those seem needed, list them under Open questions — do not turn them into scope.

The PRD must be understandable without the original chat.

