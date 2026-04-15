# Harness Engineering with `iso-management-wisdom`

## 日本語

### 概要

このガイドは、`iso-management-wisdom` を Codex のような自律型コーディングエージェントや事業支援エージェントのガバナンス層として使う方法をまとめたものです。目的は、毎回の作業を細かく指示することではなく、`どう動くか`、`どこで止まるか`、`何を記録するか`、`何に承認が必要か` を先に決めることです。

基本の形は次の 5 段階です。

1. `config.toml` で実行境界を固定する
2. `AGENTS.md` で行動原理を固定する
3. `rules` でコマンド実行のガードレールを固定する
4. `iso-management-wisdom` を使って、その背後にある管理文書を作る
5. 定期レビューでハーネスを更新する

### 推奨アーティファクト

#### 1. Runtime configuration

`examples/codex/config.toml.example` を使って次を定義します。

- モデルと推論強度
- sandbox mode
- approval policy
- reviewer の扱い
- `strategy`、`execution`、`research` などの profile

このファイルは、エージェントが技術的に何をできるかを決めます。

#### 2. Agent operating policy

`examples/codex/AGENTS.md.example` を使って次を定義します。

- mission
- decision principles
- 承認なしでできること
- 常に承認が必要なこと
- evidence requirements
- review loop

このファイルは、エージェントがどう振る舞うべきかを決めます。

#### 3. Command rules

`examples/codex/default.rules.example` を使って次を定義します。

- 自動許可してよいローカルコマンド
- prompt にすべき外部反映や公開操作
- forbid すべき破壊的操作

このファイルは、実行時にどのようにゲートを掛けるかを決めます。

### `iso-management-wisdom` の使い方

このスキルは、一般論の助言よりも、`管理文書のたたき台` を作らせる時に最も有効です。

ハーネス設計で推奨されるロール構成:

- `CEO`
- `ERM`
- `CISO/ISMS`
- `PMO`
- `QMS`
- `Innovation`

依頼例:

```text
/iso-management-wisdom Codex を新規事業の運用リソースとして使いたい。目的、承認境界、リスク登録簿、レビュー会議体を設計したい。
```

```text
/iso-management-wisdom このリポジトリ向けに Codex の運用ハーネスを設計したい。Mission statement、Decision-rights matrix、Risk register、週次レビューの cadence が必要。
```

期待される出力:

- AI運用方針
- Decision rights matrix
- Risk register
- Review cadence
- Guardrail proposals
- Escalation triggers

### 導入フロー

#### Step 1. Mission を決める

エージェントに何を最適化させるかを決めます。

例:

- ドキュメント品質の改善
- ISO準拠のガバナンス資産の維持
- 低リスクな改善提案と実装
- 管理文書のドラフト作成

#### Step 2. Approval boundary を決める

どこまでを自律実行にし、どこからをレビュー対象にするかを決めます。

典型的に承認必須にすべきもの:

- 外部公開
- 顧客コミュニケーション
- 価格や契約の変更
- 秘密情報や個人情報を含む操作
- 破壊的操作
- 新規の有償ツールや外部連携

#### Step 3. Evidence requirement を決める

重要なアクションには、追跡可能な記録を残すよう求めます。

最低限の evidence:

- goal
- basis または source
- expected benefit
- residual risk
- approval status
- next review condition

#### Step 4. Review cadence を決める

最初の運用としては次が実務的です。

- weekly: status、incident、blocked items、risk changes
- monthly: CAPA、guardrail review、priority reset
- quarterly: continue / expand / stop の判断

#### Step 5. CAPA で更新する

同じ失敗が繰り返されたら、`iso-management-wisdom` を使って次を作ります。

- corrective actions
- recurrence-prevention measures
- updated evidence requirements
- updated review rules

### Proposal mode と Execution mode

ここは最重要です。

#### Proposal mode

使うべき場面:

- リスクが不明確
- 外部ユーザや顧客に影響する
- 法務、プライバシー、セキュリティ、財務の判断を含む
- 実行前に選択肢を見たい

期待される挙動:

- 複数案を提案する
- トレードオフを説明する
- 危険な実行手前で止まる

#### Execution mode

使うべき場面:

- スコープがローカルで可逆
- `rules` によって許可されている
- 承認境界が明確に閾値以下
- evidence requirement を満たせる

期待される挙動:

- 実行する
- 結果を記録する
- 残留リスクを明示する

### 週次レビュー例

推奨アジェンダ:

1. 今週なにが変わったか
2. 承認なしで何を実行したか
3. Proposal mode のまま止めたものは何か
4. Incident、near miss、誤分類は何か
5. どの guardrail を厳しくするか、緩めるか
6. どの改善を `help wanted` や `good first issue` にするか

### よくある失敗

- ハーネスをプロンプトだけの問題として扱う
- 承認境界が曖昧なまま実行を許す
- evidence requirement を決めない
- strategy、research、execution を一つの profile で混ぜる
- 失敗後の review と CAPA を回さない

### 実務上の判断基準

このリポジトリを読んだ新しい運用者やコントリビューターが、次に答えられなければ、ハーネスはまだ曖昧です。

- エージェントは何を最適化してよいのか
- 常に承認が必要なのは何か
- どの evidence を残すべきか
- いつチームがハーネスを見直すのか
- 失敗をどう rules 更新へ変えるのか

これに答えられるなら、ハーネスは実用段階に入っています。

---

## English

### Overview

This guide explains how to use `iso-management-wisdom` as a governance layer for autonomous coding or business-support agents such as Codex. The goal is not to micromanage each task, but to define how the agent should operate, when it must stop, what it must record, and what needs approval.

The recommended pattern is:

1. Fix the runtime boundaries in `config.toml`
2. Fix the operating policy in `AGENTS.md`
3. Fix the command guardrails in `rules`
4. Use `iso-management-wisdom` to draft the management artifacts behind those files
5. Review and refine the harness on a regular cadence

### Recommended Artifacts

#### 1. Runtime configuration

Use `examples/codex/config.toml.example` to define:

- model and reasoning effort
- sandbox mode
- approval policy
- reviewer behavior
- role-specific profiles such as `strategy`, `execution`, and `research`

This file controls what the agent can technically do.

#### 2. Agent operating policy

Use `examples/codex/AGENTS.md.example` to define:

- mission
- decision principles
- what can be done without approval
- what always requires approval
- evidence requirements
- review loop

This file controls how the agent is expected to behave.

#### 3. Command rules

Use `examples/codex/default.rules.example` to define:

- local commands that are safe to allow
- external or publishing actions that should prompt
- destructive actions that should be forbidden

This file controls how the runtime should gate execution.

### How to Use `iso-management-wisdom`

The skill is most useful when you ask it to produce management artifacts rather than generic advice.

Recommended role mix for harness design:

- `CEO`
- `ERM`
- `CISO/ISMS`
- `PMO`
- `QMS`
- `Innovation`

Typical requests:

```text
/iso-management-wisdom Codex を新規事業の運用リソースとして使いたい。目的、承認境界、リスク登録簿、レビュー会議体を設計したい。
```

```text
/iso-management-wisdom Design an operating harness for Codex in this repository. I need a mission statement, decision-rights matrix, risk register, and weekly review cadence.
```

Expected output:

- AI operating policy
- decision rights matrix
- risk register
- review cadence
- guardrail proposals
- escalation triggers

### Adoption Flow

#### Step 1. Set the mission

Define what the agent is trying to optimize.

Examples:

- improve documentation quality
- maintain ISO-aligned governance assets
- propose and implement low-risk repo improvements
- draft management artifacts for review

#### Step 2. Define approval boundaries

Decide which actions are autonomous and which require review.

Typical approval-required items:

- external publication
- customer communication
- pricing or contract changes
- actions involving secrets or personal data
- destructive operations
- new paid tools or integrations

#### Step 3. Define evidence requirements

Require the agent to leave traceable records for substantive actions.

Minimum evidence set:

- goal
- basis or source
- expected benefit
- residual risk
- approval status
- next review condition

#### Step 4. Set the review cadence

A practical starting point:

- weekly: status, incidents, blocked items, risk changes
- monthly: CAPA, guardrail review, priority reset
- quarterly: continue, expand, or stop

#### Step 5. Iterate through CAPA

When the same failure occurs multiple times, use `iso-management-wisdom` to produce:

- corrective actions
- recurrence-prevention measures
- updated evidence or review requirements

### Proposal Mode vs Execution Mode

This is the most important operating distinction.

#### Proposal mode

Use when:

- the risk is unclear
- the action affects external users
- the decision has legal, privacy, security, or financial implications
- the operator wants options before execution

Expected behavior:

- propose alternatives
- explain tradeoffs
- stop before taking the risky step

#### Execution mode

Use when:

- the scope is local and reversible
- the action is covered by rules
- the approval boundary is clearly below the threshold
- the evidence requirement can be met

Expected behavior:

- perform the work
- record the result
- surface any residual risk

### Example Weekly Review

Suggested agenda:

1. What changed this week?
2. What did the agent execute without approval?
3. What stayed in proposal mode?
4. What incidents, near misses, or misclassifications occurred?
5. Which guardrails need tightening or loosening?
6. Which improvements should become `help wanted` or `good first issue` items?

### Common Mistakes

- Treating the harness as a prompt-only problem
- Allowing execution before approval boundaries are explicit
- Forgetting evidence requirements
- Using one profile for strategy, research, and execution
- Skipping review and CAPA after repeated failures

### Practical Standard

If a new contributor or operator cannot answer the following after reading the repo, the harness is still under-specified:

- What is the agent allowed to optimize for?
- What must always be approved?
- What evidence must the agent leave?
- When does the team review the harness?
- How are failures converted into updated rules?

If those answers are clear, the harness is usable.
