# cj-workshop-template — AI-SDLC 하네스 시작 골격

> **Use this template**로 내 repo를 만들고, GitHub Copilot에서 그 repo를 열어 바로 시작합니다.
> 매번 역할 프롬프트를 복붙하는 대신, **역할·절차·게이트를 repo에 영속화한** 드롭인 하네스입니다.

## 무엇이 들었나

```
.
├─ AGENTS.md                    ← repo 헌법: 목적·경계·라우팅·게이트
├─ CONTEXT.md                   ← 도메인 용어·관계의 단일 문맥(placeholder)
├─ gate.sh                      ← 완료 게이트: lint + test + policy-check
├─ .github/agents/              ← 역할(agent): orchestrator·planner·senior-developer·reviewer·documentation-writer·app-runner·researcher
├─ .github/skills/              ← 절차(skill): grill-with-docs·to-prd·to-issues·tdd·code-review
├─ .github/workflows/
│  └─ copilot-setup-steps.yml   ← cloud agent 환경 부트스트랩(위임 세션 재현)
└─ docs/
   ├─ prd/                      ← to-prd가 PRD를 저장(docs/prd/<슬러그>.md)
   └─ issues/                   ← to-issues가 수직 슬라이스를 저장
```

## 시작하기

1. 이 repo 위에서 **Use this template**로 내 repo를 만듭니다.
2. GitHub Copilot에서 그 repo를 **프로젝트/세션으로 엽니다**.
3. `planner`(또는 `orchestrator`)에게 **만들고 싶은 것과 요건만** 말합니다. 나머지는 하네스가 라우팅합니다: `grill-with-docs`(한 번에 하나씩 질문) → `to-prd`(docs/prd/) → `to-issues`(docs/issues/ 슬라이스) → `tdd` → `code-review`+`gate.sh`.
