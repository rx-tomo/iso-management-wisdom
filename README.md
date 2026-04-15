# iso-management-wisdom

**ISO規格に基づく経営の叡智を、23の組織ロールで即座に活用するスキル群**

**A skill set that turns ISO-based management wisdom into practical operating guidance through 23 organizational roles**

---

<p align="center">
  <a href="#-日本語">日本語</a> •
  <a href="#-english">English</a> •
  <a href="#license">License</a>
</p>

---

## 日本語

### 概要

`iso-management-wisdom` は、ISO 規格に蓄積された経営知を **23 の専門ロール** として体系化したスキルです。自然言語で課題を伝えるだけで、最適なロールを選び、ISO 準拠の助言、文書生成、レビュー、インシデント対応、会議設計へ変換します。

このリポジトリは、従来の `Claude Code` 用スキルとして使えるだけでなく、`Codex` のハーネスエンジニアリングにも重ねて利用できます。つまり、AI に細かい作業指示を与える代わりに、`目的・ガードレール・承認境界・証跡・レビュー周期` を ISO ベースで定義するための知識資産として使えます。

> ISO 規格の原文は含みません。参照、チェックリスト、テンプレート、解釈ガイダンスのみで構成されています。

### 特徴

- **23 ロール自動選定**: CEO、CISO、QMS、PMO、Innovation などを課題の文脈から組み合わせ
- **5 つのアクションモード**: 助言、文書生成、チェック/レビュー、インシデント対応、会議/プロセス設計
- **6 つのテンプレート**: RACI、リスク登録簿、ギャップ分析、会議設計、インシデント対応、ポリシードラフト
- **AI ハーネス設計に流用可能**: AI方針、承認境界、リスク許容度、レビュー会議体の設計に使える
- **Claude Code / Codex の両対応導線**: 既存の Claude 用 install と、Codex 用 examples を同梱
- **日英バイリンガル**: README、SKILL、サンプルを日英で利用可能

### 使いどころ

- 情報セキュリティ、品質、コンプライアンス、ESG、人事、調達などの方針設計
- 監査準備、ギャップ分析、マネジメントレビュー設計
- インシデントや不適合に対する初動、是正、再発防止
- コードや運用プロセスを ISO 観点でレビュー
- AI 導入、AI ガバナンス、AI エージェント運用ハーネスの設計

### ハーネスエンジニアリングへの使い方

Codex のような自律エージェントに「何をやるか」を細かく指示するのではなく、「どう判断し、どこで止まり、何を記録するか」を定義するのがハーネスエンジニアリングです。`iso-management-wisdom` はその判断原理を ISO ベースで与えるために使えます。

典型的には以下を設計します。

- `Agent Charter`: 目的、非目的、成功指標、禁止事項
- `Decision Rights Matrix`: AI が自律実行できる範囲と承認必須の境界
- `Risk Register`: リスク、閾値、停止条件、エスカレーション
- `Review Cadence`: 週次/月次のレビュー会議体と証跡確認
- `CAPA Loop`: 不適合や失敗からの是正・再発防止

このときに効く主なロールは `CEO + ERM + CISO/ISMS + PMO + QMS + Innovation` です。

詳細な導入手順、レビュー運用、依頼文例は [docs/harness-engineering.md](docs/harness-engineering.md) を参照してください。

### クイックスタート

#### Claude Code で使う

前提:

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) がインストール済みであること

インストール:

```bash
git clone https://github.com/rx-tomo/iso-management-wisdom.git
cd iso-management-wisdom
./install.sh
```

`install.sh` は現在 `~/.claude/skills/iso-management-wisdom/` へコピーします。`--lang en` で英語版を選べます。

利用例:

```text
/iso-management-wisdom 情報セキュリティポリシーを新規策定したい。中小企業向けで、クラウド利用が中心。
```

#### Codex で使う

Codex では installer はまだ同梱していません。代わりに `examples/codex/` の 3 ファイルを起点に、`AGENTS.md` と設定へ組み込みます。

含まれる例:

- [examples/codex/config.toml.example](examples/codex/config.toml.example)
- [examples/codex/AGENTS.md.example](examples/codex/AGENTS.md.example)
- [examples/codex/default.rules.example](examples/codex/default.rules.example)

使い分け:

- `config.toml.example`: モデル、sandbox、approval、profiles を定義
- `AGENTS.md.example`: 目的、判断基準、承認境界、証跡要件を定義
- `default.rules.example`: allow / prompt / forbid するコマンド群を定義

最短導入手順:

1. `config.toml.example` を Codex 設定の叩き台にする
2. `AGENTS.md.example` をリポジトリの運用方針に合わせて調整する
3. `default.rules.example` でローカル検証、外部反映、破壊的操作の扱いを決める
4. `/iso-management-wisdom` で方針、承認境界、リスク登録簿、レビュー会議体のドラフトを作る
5. 週次レビューで `AGENTS.md` と運用ルールを更新する

### Codex 向け 3 ファイルの役割

#### 1. `config.toml`

Codex の実行環境を固定します。

- どのモデルを使うか
- `sandbox_mode` をどこまで許すか
- `approval_policy` を granular / on-request にするか
- `strategy / execution / research` の profile をどう分けるか

#### 2. `AGENTS.md`

AI の行動原理を定義します。

- 任務
- 判断原理
- 承認不要の作業
- 承認必須の作業
- 証跡として残す項目
- 週次/月次レビュー

#### 3. `rules`

実行統制を定義します。

- テストやローカル検証を allow
- 外部反映や配布を prompt
- 破壊的操作を forbid

### 利用例

#### 例 1: セキュリティポリシーの策定

```text
/iso-management-wisdom 情報セキュリティポリシーを新規に策定したい。従業員200名、クラウドサービスを多く利用している。
```

自動選定ロール:
`CISO/ISMS + CEO`

#### 例 2: インシデント対応

```text
/iso-management-wisdom 顧客の個人情報が外部に漏洩した可能性がある。初動対応と報告書の作成を支援してほしい。
```

自動選定ロール:
`CISO/ISMS + Privacy/DPO + Legal`

#### 例 3: 監査準備

```text
/iso-management-wisdom 来月のISO 9001外部審査に向けて、QMSの現状をチェックしたい。
```

自動選定ロール:
`QMS + Internal Audit`

#### 例 4: AIオペレーションハーネスの設計

```text
/iso-management-wisdom 新規事業向けに、Codex を自律稼働させるための運用ハーネスを設計したい。目的、承認境界、リスク登録簿、レビュー会議体を整備したい。
```

自動選定ロール:
`CEO + ERM + CISO/ISMS + PMO + QMS + Innovation`

期待される出力:

- AI運用方針
- Decision Rights Matrix
- Risk Register
- Review cadence
- ガードレール案

### コントリビューション

改善提案、新規ロールや規格追加、翻訳修正、ハーネス活用事例の投稿を歓迎します。参加方法と品質基準は [CONTRIBUTING.md](CONTRIBUTING.md) を参照してください。

推奨導線:

- 小さな改善や翻訳: `good first issue`
- 仕様や方向性の相談: GitHub Discussions を有効化して使う想定
- 実装可能な改善案: Issue Forms から投稿
- 幅広い支援募集: `help wanted`

推奨ラベルセット:

- `good first issue`
- `help wanted`
- `enhancement`
- `documentation`
- `translation`
- `new-role`
- `iso-update`
- `governance`
- `security`
- `quality`
- `discussion-needed`

### ディレクトリ構成

```text
iso-management-wisdom/
├── README.md
├── LICENSE
├── install.sh
├── examples/
│   └── codex/
│       ├── AGENTS.md.example
│       ├── config.toml.example
│       └── default.rules.example
└── skill/
    └── iso-management-wisdom/
        ├── ja/
        │   ├── SKILL.md
        │   ├── agents/openai.yaml
        │   └── references/
        │       ├── role-index.md
        │       ├── roles/ (23)
        │       └── templates/ (6)
        └── en/
            ├── SKILL.md
            ├── agents/openai.yaml
            └── references/
                ├── role-index.md
                ├── roles/ (23)
                └── templates/ (6)
```

---

## English

### Overview

`iso-management-wisdom` turns management wisdom embedded in ISO standards into **23 specialized organizational roles**. Describe a problem in natural language and the skill selects the right roles to produce ISO-aligned advice, documents, reviews, incident responses, and governance artifacts.

The repository remains usable as a `Claude Code` skill, and it can also be used as a knowledge layer for `Codex` harness engineering. In that mode, the value is not "giving the AI more instructions," but defining `mission, guardrails, approval boundaries, evidence requirements, and review cadence` using ISO-based management patterns.

> This repository does not include ISO standard text. It contains references, checklists, templates, and interpretive guidance only.

### Features

- **23 auto-selected roles**: Combine CEO, CISO, QMS, PMO, Innovation, and others based on context
- **5 action modes**: Advisory, document generation, check/review, incident response, meeting/process design
- **6 templates**: RACI, risk register, gap analysis, meeting design, incident response, policy draft
- **Reusable for agent harnesses**: Helps define AI governance, approval boundaries, risk appetite, and review bodies
- **Dual guidance for Claude Code and Codex**: Existing Claude installer plus Codex examples
- **Bilingual assets**: README, SKILL files, and examples in Japanese and English

### Where It Fits

- Policy and operating-model design across security, quality, compliance, ESG, HR, and procurement
- Audit preparation, gap analysis, and management review design
- Incident response, corrective action, and recurrence prevention
- ISO-oriented reviews of code, docs, and workflows
- AI governance, agent operations, and Codex harness design

### Using It for Harness Engineering

Harness engineering is about defining how an autonomous agent should decide, stop, escalate, and leave evidence. `iso-management-wisdom` can supply that operating logic using ISO-based roles and controls.

Typical deliverables:

- `Agent Charter`: mission, non-goals, success metrics, prohibited actions
- `Decision Rights Matrix`: what the AI can do alone vs. what needs approval
- `Risk Register`: thresholds, stopping conditions, escalation paths
- `Review Cadence`: weekly/monthly governance and evidence reviews
- `CAPA Loop`: corrective action and recurrence prevention

The most common role mix is `CEO + ERM + CISO/ISMS + PMO + QMS + Innovation`.

For step-by-step setup, review cadence, and concrete prompting examples, see [docs/harness-engineering.md](docs/harness-engineering.md).

### Quick Start

#### Use with Claude Code

Prerequisite:

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) installed

Install:

```bash
git clone https://github.com/rx-tomo/iso-management-wisdom.git
cd iso-management-wisdom
./install.sh --lang en
```

The current installer copies the skill into `~/.claude/skills/iso-management-wisdom/`.

Usage:

```text
/iso-management-wisdom I need to create an information security policy for a 200-person company using cloud services extensively.
```

#### Use with Codex

Codex support is currently example-based rather than installer-based. Start from the three files under `examples/codex/`.

Included examples:

- [examples/codex/config.toml.example](examples/codex/config.toml.example)
- [examples/codex/AGENTS.md.example](examples/codex/AGENTS.md.example)
- [examples/codex/default.rules.example](examples/codex/default.rules.example)

Roles:

- `config.toml.example`: model, sandbox, approvals, profiles
- `AGENTS.md.example`: mission, decision principles, approval boundaries, evidence rules
- `default.rules.example`: allow / prompt / forbid command controls

Quick adoption flow:

1. Use `config.toml.example` as the starting point for Codex runtime configuration
2. Adapt `AGENTS.md.example` to your repo's mission and approval boundaries
3. Tune `default.rules.example` for local checks, external actions, and destructive commands
4. Ask `/iso-management-wisdom` to draft policy, decision rights, risk register, and review cadence
5. Review and update the harness weekly

### Examples

#### Example 1: Security Policy Creation

```text
/iso-management-wisdom Create an information security policy for a 200-person company heavily using cloud services.
```

Selected roles:
`CISO/ISMS + CEO`

#### Example 2: Incident Response

```text
/iso-management-wisdom Customer personal data may have been leaked externally. Help with first response and report creation.
```

Selected roles:
`CISO/ISMS + Privacy/DPO + Legal`

#### Example 3: Audit Preparation

```text
/iso-management-wisdom Check our QMS status before next month's ISO 9001 external audit.
```

Selected roles:
`QMS + Internal Audit`

#### Example 4: Agent Harness Design

```text
/iso-management-wisdom Design an operating harness for Codex to run autonomously on a new business initiative. I need mission boundaries, approvals, a risk register, and review cadence.
```

Selected roles:
`CEO + ERM + CISO/ISMS + PMO + QMS + Innovation`

Expected output:

- AI operating policy
- Decision rights matrix
- Risk register
- Review cadence
- Guardrail proposals

### Contributing

Contributions are welcome across improvements, new ISO or role coverage, translation fixes, and harness-engineering examples. See [CONTRIBUTING.md](CONTRIBUTING.md) for expectations and review standards.

Recommended entry points:

- small fixes and docs improvements via `good first issue`
- broader requests for help via `help wanted`
- idea triage through Discussions once enabled
- structured issue submission through Issue Forms

---

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).

## Disclaimer / 免責事項

**日本語**: 本リポジトリは ISO の公式製品ではありません。ISO 規格の原文は含まず、参照、チェックリスト、テンプレート、解釈ガイダンスのみを提供します。正規の規格本文は [ISO 公式サイト](https://www.iso.org/) から入手してください。

**English**: This repository is **not** an official ISO product. It contains no ISO standard text and provides references, checklists, templates, and interpretive guidance only. Obtain authoritative standards from [iso.org](https://www.iso.org/).
