# AGENTS.md — <프로젝트명> AI-SDLC 하네스

> 이 파일은 repo-wide constitution이다. 짧고 오래 가는 규칙만 둔다.
> 긴 절차는 `.github/skills/*/SKILL.md`, 역할 정의는 `.github/agents/*.agent.md`를 따른다.
> PRD·이슈 등 중간 산출물은 `docs/prd/`·`docs/issues/`에 둔다.

## 1. 목적

<이 repo가 무엇을 하는지 1-2문장으로 적는다. 예: "고객 주문 상태를 조회하고 운영자가 예외를 처리하는 내부 API.">

## 2. 경계와 금지

- **작업 경계**: <수정 가능한 디렉터리/모듈>.
- **금지**: 비밀값 커밋 금지, 검증 없는 public API 변경 금지, 불필요한 새 의존성 금지.
- **완료 기준**: "실행됐다"가 아니라 `bash gate.sh` 통과.
- **모호하면 멈춤**: 범위·입력·출력·예외·완료조건이 불명확하면 먼저 질문한다.
- **컨텍스트 최소화**: whole-repo dump 금지. 관련 파일, 호출자/피호출자, 테스트만 지정한다.
- **범위 고정**: 요청에 없는 것(배포·인프라·CI/CD·인증·영속·스케일)을 PRD·이슈·구현에 임의로 더하지 않는다. 필요해 보이면 "범위 밖"으로 남기고 질문한다. 이 하네스에는 배포 단계가 없다 — 로컬 실행(app-runner)만 있다.

## 3. 표준 루프

```
grill-with-docs → to-prd → to-issues → tdd → code-review → gate
```

1. **grill-with-docs**: 도메인 용어와 요구를 정렬한다. `CONTEXT.md`가 틀리면 먼저 고친다.
2. **to-prd**: 기능을 PRD/명세로 고정한다. 성공 기준과 제외 범위를 쓴다.
3. **to-issues**: PRD를 end-to-end vertical slice로 쪼갠다.
4. **tdd**: 실패 테스트부터 쓰고 최소 구현 후 리팩터한다.
5. **code-review**: 범위·요구 충족·테스트·보안·결정 기록을 확인한다.
6. **gate**: `lint + test + policy-check`가 모두 초록이어야 완료다.

## 4. 스킬 라우팅

- 기능을 새로 만들거나 큰 변경을 시작하기 전: `.github/skills/grill-with-docs/SKILL.md`.
- 대화/요구를 기능 명세로 바꿀 때: `.github/skills/to-prd/SKILL.md`.
- PRD/계획을 구현 단위로 쪼갤 때: `.github/skills/to-issues/SKILL.md`.
- 로직·버그 수정: `.github/skills/tdd/SKILL.md`.
- 완료 보고 전: `.github/skills/code-review/SKILL.md`와 `bash gate.sh`.
- <팀 관례 skill 추가 시: 언제 그 skill을 열어야 하는지 여기에 한 줄 추가.>

## 5. 에이전트 역할

- `orchestrator`: 전체 흐름 라우팅. 구현은 직접 하지 않는다.
- `researcher`: 코드·문서·근거 조사. 구현은 하지 않는다.
- `planner`: PRD와 vertical slice 작성.
- `senior-developer`: 작은 slice 구현과 TDD.
- `reviewer`: 완료 게이트와 리뷰.
- `documentation-writer`: `CONTEXT.md`, README 정리.
- `app-runner`: 로컬 실행(up)과 종료·정리(down). Docker 있으면 컨테이너, 없으면 네이티브 CLI. 배포·릴리스가 아니다.

## 6. 정직 규율

- 수치·효과 주장은 출처와 확신도를 단다.
- AI 결과를 통과시키기 위해 테스트나 eval을 약화하지 않는다.
- 기존 동작을 바꾸는 경우, 바꾸는 이유와 롤백 조건을 남긴다.

