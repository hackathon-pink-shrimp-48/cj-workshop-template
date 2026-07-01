# docs/issues — 이슈(수직 슬라이스) 저장소

로컬 작업의 **중간 산출물** 저장소입니다.
`to-issues` 스킬이 `docs/prd`의 PRD를 얇은 end-to-end 슬라이스로 쪼개 여기에 씁니다.

```
docs/issues/<기능-슬러그>/<NN>-<슬러그>.md
```

각 슬라이스는 독립적으로 테스트·시연 가능해야 하고, 수용기준을 포함합니다.
GitHub Issues를 쓰는 팀은 대신 `gh issue create`로 발행하면 됩니다.
