# Harness Engineering with `iso-management-wisdom`

## Overview

This guide explains how to use `iso-management-wisdom` as a governance layer for autonomous coding or business-support agents such as Codex. The goal is not to micromanage each task, but to define how the agent should operate, when it must stop, what it must record, and what needs approval.

The recommended pattern is:

1. Fix the runtime boundaries in `config.toml`
2. Fix the operating policy in `AGENTS.md`
3. Fix the command guardrails in `rules`
4. Use `iso-management-wisdom` to draft the management artifacts behind those files
5. Review and refine the harness on a regular cadence

## Recommended Artifacts

### 1. Runtime configuration

Use `examples/codex/config.toml.example` to define:

- model and reasoning effort
- sandbox mode
- approval policy
- reviewer behavior
- role-specific profiles such as `strategy`, `execution`, and `research`

This file controls what the agent can technically do.

### 2. Agent operating policy

Use `examples/codex/AGENTS.md.example` to define:

- mission
- decision principles
- what can be done without approval
- what always requires approval
- evidence requirements
- review loop

This file controls how the agent is expected to behave.

### 3. Command rules

Use `examples/codex/default.rules.example` to define:

- local commands that are safe to allow
- external or publishing actions that should prompt
- destructive actions that should be forbidden

This file controls how the runtime should gate execution.

## How to Use `iso-management-wisdom`

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

## Adoption Flow

### Step 1. Set the mission

Define what the agent is trying to optimize.

Examples:

- improve documentation quality
- maintain ISO-aligned governance assets
- propose and implement low-risk repo improvements
- draft management artifacts for review

### Step 2. Define approval boundaries

Decide which actions are autonomous and which require review.

Typical approval-required items:

- external publication
- customer communication
- pricing or contract changes
- actions involving secrets or personal data
- destructive operations
- new paid tools or integrations

### Step 3. Define evidence requirements

Require the agent to leave traceable records for substantive actions.

Minimum evidence set:

- goal
- basis or source
- expected benefit
- residual risk
- approval status
- next review condition

### Step 4. Set the review cadence

A practical starting point:

- weekly: status, incidents, blocked items, risk changes
- monthly: CAPA, guardrail review, priority reset
- quarterly: continue, expand, or stop

### Step 5. Iterate through CAPA

When the same failure occurs multiple times, use `iso-management-wisdom` to produce:

- corrective actions
- recurrence-prevention measures
- updated evidence or review requirements

## Proposal Mode vs Execution Mode

This is the most important operating distinction.

### Proposal mode

Use when:

- the risk is unclear
- the action affects external users
- the decision has legal, privacy, security, or financial implications
- the operator wants options before execution

Expected behavior:

- propose alternatives
- explain tradeoffs
- stop before taking the risky step

### Execution mode

Use when:

- the scope is local and reversible
- the action is covered by rules
- the approval boundary is clearly below the threshold
- the evidence requirement can be met

Expected behavior:

- perform the work
- record the result
- surface any residual risk

## Example Weekly Review

Suggested agenda:

1. What changed this week?
2. What did the agent execute without approval?
3. What stayed in proposal mode?
4. What incidents, near misses, or misclassifications occurred?
5. Which guardrails need tightening or loosening?
6. Which improvements should become `help wanted` or `good first issue` items?

## Common Mistakes

- Treating the harness as a prompt-only problem
- Allowing execution before approval boundaries are explicit
- Forgetting evidence requirements
- Using one profile for strategy, research, and execution
- Skipping review and CAPA after repeated failures

## Practical Standard

If a new contributor or operator cannot answer the following after reading the repo, the harness is still under-specified:

- What is the agent allowed to optimize for?
- What must always be approved?
- What evidence must the agent leave?
- When does the team review the harness?
- How are failures converted into updated rules?

If those answers are clear, the harness is usable.
