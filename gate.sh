#!/usr/bin/env bash
# gate.sh — 완료 판정. "실행됐다"가 아니라 이 스크립트가 0으로 끝나야 완료다.
set -euo pipefail

LINT_COMMAND=""          # 예: "npm run lint" | "ruff check ." | "go vet ./..."
TEST_COMMAND=""          # 예: "npm test" | "pytest -q" | "go test ./..."
POLICY_CHECK_COMMAND=""  # 예: "! git diff --cached | grep -nE '(API_KEY|SECRET|PASSWORD)[[:space:]]*='"

configured=0

step () {
  label="$1"
  cmd="$2"
  if [ -z "$cmd" ]; then
    echo "· [$label] 미설정 — 건너뜀(필요하면 gate.sh 상단 *_COMMAND를 채워라)."
    return 0
  fi
  configured=$((configured + 1))
  echo "==> $label"
  eval "$cmd"
}

step "1/3 lint" "$LINT_COMMAND"
step "2/3 test" "$TEST_COMMAND"
step "3/3 policy-check" "$POLICY_CHECK_COMMAND"

if [ "$configured" -eq 0 ]; then
  echo "x 설정된 검사가 하나도 없다 — 최소 하나(test 권장)를 gate.sh 상단에 채워야 완료를 판정할 수 있다."
  exit 2
fi

echo "gate passed — 완료 보고 가능 ($configured/3 검사 실행)"

