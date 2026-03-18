# iso-business-wisdom

**ISO規格に基づく経営の叡智を、23の組織ロールで即座に活用する Claude Code / Codex CLI スキル**

**Instantly leverage ISO-standard-based management wisdom through 23 organizational roles — a skill for Claude Code & Codex CLI**

---

<p align="center">
  <a href="#-クイックスタート">クイックスタート</a> •
  <a href="#-quick-start">Quick Start</a> •
  <a href="#license">License</a>
</p>

---

## 日本語

### 概要

`/iso-management-wisdom` は、ISO 規格に蓄積された経営の叡智を **23 の専門ロール** として体系化した Claude Code スキルです。自然言語で課題を伝えるだけで、最適なロール（1〜3 個）が自動選定され、ISO 準拠の助言・ドキュメント・チェックリストを即座に生成します。

> ISO 規格の原文は一切含まれていません。参照・チェックリスト・解釈ガイダンスのみで構成されています。

### 特徴

- **自然言語で起動** — `/iso-management-wisdom` と入力し、課題を伝えるだけ
- **23 ロール自動選定** — 課題の文脈から最適なロールを 1〜3 個自動で選択
- **5 つのアクションモード** — 助言、文書生成、チェック/レビュー、インシデント対応、会議/プロセス設計
- **6 つのテンプレート** — RACI マトリクス、リスク登録簿、ギャップ分析、会議設計、インシデント対応、ポリシードラフト
- **複合ロール対応** — セキュリティ事故なら CISO + Legal + BCM のように複数ロールを自動組み合わせ
- **日英バイリンガル** — キーワードマッチングは日本語・英語両対応

### 23 の専門ロール

| 領域 | ロール | 主要 ISO 規格 |
|------|--------|---------------|
| **Governance** (3) | CEO | ISO 37000, ISO 31000, ISO 37001 |
| | Board / Governance（取締役会・監督機関） | ISO 37000, ISO/IEC 38500 |
| | Internal Audit（内部監査） | ISO 19011, ISO 37301 |
| **Risk** (4) | ERM（リスク管理） | ISO 31000, IEC 31010 |
| | Compliance / CMS（コンプライアンス） | ISO 37301, ISO 37001 |
| | Legal（法務） | ISO 31022, ISO 37301 |
| | BCM（事業継続） | ISO 22301, ISO 22316 |
| **Security** (3) | CISO / ISMS | ISO/IEC 27001, ISO/IEC 27002 |
| | Privacy / DPO（プライバシー） | ISO/IEC 27701, ISO/IEC 27018 |
| | ITSM | ISO/IEC 20000-1, ISO/IEC 27035 |
| **Operations** (7) | COO（経営企画） | ISO 37000, ISO 9004 |
| | PMO / Portfolio | ISO 21502, ISO 21503, ISO 21504 |
| | Project Manager | ISO 21502, ISO 21500 |
| | QMS（品質管理） | ISO 9001, ISO 10002 |
| | Procurement（調達） | ISO 20400, ISO/IEC 27036 |
| | Customer Support（顧客対応） | ISO 10002, ISO 23592 |
| | Asset Management（資産管理） | ISO 55001 |
| **People** (2) | CHRO（人事） | ISO 30414, ISO 30415 |
| | HR Analytics（人事分析） | ISO 30414, ISO 30408 |
| **Sustainability** (4) | ESG | ISO 26000, ISO/UNDP DIS 53001 |
| | Environment / EMS（環境） | ISO 14001, ISO 14064 |
| | Energy / EnMS（エネルギー） | ISO 50001 |
| | Innovation（イノベーション） | ISO 56001, ISO 56002 |

### 5 つのアクションモード

| モード | トリガー例 | 出力 |
|--------|-----------|------|
| **A. Advisory（助言）** | 「情報セキュリティ方針で考慮すべきことは？」 | ISO 要求事項に基づく体系的な回答 |
| **B. Document Generation（文書生成）** | 「BCP の方針書を作りたい」 | テンプレート + ISO 要求事項でドラフト生成 |
| **C. Check / Review（チェック・レビュー）** | 「監査前に ISMS の現状を点検したい」 | ギャップ分析表 / チェックリスト |
| **D. Incident Response（インシデント対応）** | 「個人情報の漏洩が発生した」 | 初動チェックリスト + 報告書ドラフト |
| **E. Meeting / Process Design（会議・プロセス設計）** | 「マネジメントレビューの設計をしたい」 | アジェンダ + RACI + プロセスフロー |

### クイックスタート

#### 前提条件

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (Anthropic の CLI ツール) または [Codex CLI](https://github.com/openai/codex) (OpenAI の CLI ツール) がインストール済みであること

#### インストール

```bash
git clone https://github.com/rx-tomo/iso-management-wisdom.git
cd iso-management-wisdom
./install.sh
```

`install.sh` は Claude Code (`~/.claude/skills/`) と Codex CLI (`~/.codex/skills/`) の両方に対応しています。

#### 使い方

Claude Code のセッション内で以下のように呼び出します:

```
/iso-management-wisdom 情報セキュリティポリシーを新規策定したい。中小企業向けで、クラウド利用が中心。
```

Codex CLI の場合:

```
$iso-management-wisdom 情報セキュリティポリシーを新規策定したい。中小企業向けで、クラウド利用が中心。
```

### 使用例

#### 例 1: セキュリティポリシーの策定

```
/iso-management-wisdom 情報セキュリティポリシーを新規に策定したい。
従業員200名、クラウドサービスを多く利用している。
```

> 自動選定ロール: **CISO/ISMS** + **CEO**
> モード: B (Document Generation)
> 出力: ISO/IEC 27001 に基づくポリシードラフト + 経営者承認プロセスの提案

#### 例 2: インシデント対応

```
/iso-management-wisdom 顧客の個人情報が外部に漏洩した可能性がある。
初動対応と報告書の作成を支援してほしい。
```

> 自動選定ロール: **CISO/ISMS** + **Privacy/DPO** + **Legal**
> モード: D (Incident Response)
> 出力: 初動チェックリスト + 関係者通知テンプレート + インシデント報告書ドラフト

#### 例 3: 監査準備

```
/iso-management-wisdom 来月のISO 9001外部審査に向けて、QMSの現状をチェックしたい。
```

> 自動選定ロール: **QMS** + **Internal Audit**
> モード: C (Check / Review)
> 出力: ISO 9001 条項ベースのギャップ分析表 + 指摘事項リスト

#### 例 4: ESG 報告の設計

```
/iso-management-wisdom ESGレポートの構成と開示項目を設計したい。
GHG排出量の算定方法も含めて。
```

> 自動選定ロール: **ESG** + **Environment/EMS** + **COO**
> モード: A (Advisory) + B (Document Generation)
> 出力: 開示フレームワークの比較 + GHG 算定プロセス設計 + レポート構成案

### ディレクトリ構成

```
iso-business-wisdom/
├── README.md                          # このファイル
├── LICENSE                            # MIT License
├── install.sh                         # インストールスクリプト
└── skill/
    └── iso-management-wisdom/
        ├── SKILL.md                   # スキル定義（Claude Code が読み込む）
        ├── agents/
        │   └── openai.yaml            # Codex CLI メタデータ
        └── references/
            ├── role-index.md          # ロール自動選定用インデックス
            ├── roles/                 # 23 ロールの知見ファイル
            │   ├── governance-ceo.md
            │   ├── governance-board.md
            │   ├── governance-internal-audit.md
            │   ├── risk-erm.md
            │   ├── risk-compliance.md
            │   ├── risk-legal.md
            │   ├── risk-bcm.md
            │   ├── security-ciso.md
            │   ├── security-privacy-dpo.md
            │   ├── security-itsm.md
            │   ├── ops-coo.md
            │   ├── ops-pmo.md
            │   ├── ops-pm.md
            │   ├── ops-qms.md
            │   ├── ops-procurement.md
            │   ├── ops-customer-support.md
            │   ├── ops-asset.md
            │   ├── people-chro.md
            │   ├── people-hr-analytics.md
            │   ├── sustainability-esg.md
            │   ├── sustainability-environment.md
            │   ├── sustainability-energy.md
            │   └── sustainability-innovation.md
            └── templates/             # 6 テンプレート
                ├── raci-matrix.md
                ├── risk-register.md
                ├── gap-analysis.md
                ├── meeting-design.md
                ├── incident-response.md
                └── policy-draft.md
```

### テンプレート一覧

| テンプレート | 用途 | 使用例 |
|-------------|------|--------|
| **RACI Matrix** | 責任分担の明確化 | プロジェクト体制設計、監査対応 |
| **Risk Register** | リスクの特定・評価・対応計画 | ERM、ISMS リスクアセスメント |
| **Gap Analysis** | 現状と ISO 要求事項の差分分析 | 認証準備、内部監査 |
| **Meeting Design** | 会議体の設計（アジェンダ・役割・頻度） | マネジメントレビュー、監査報告会 |
| **Incident Response** | インシデント対応の初動〜報告 | セキュリティ事故、個人情報漏洩 |
| **Policy Draft** | 方針書・規程のドラフト | セキュリティポリシー、BCM 方針 |

---

## English

### Overview

`/iso-management-wisdom` is a Claude Code skill that organizes management wisdom accumulated in ISO standards into **23 specialized organizational roles**. Simply describe your challenge in natural language, and the skill automatically selects the 1–3 most relevant roles to deliver ISO-aligned advice, documents, and checklists.

> No ISO standard text is copied. This skill contains only references, checklists, and interpretive guidance.

### Features

- **Natural language invocation** — Type `/iso-management-wisdom` and describe your challenge
- **23 auto-selected roles** — Optimal roles (1–3) are chosen based on context
- **5 action modes** — Advisory, Document Generation, Check/Review, Incident Response, Meeting/Process Design
- **6 templates** — RACI matrix, Risk register, Gap analysis, Meeting design, Incident response, Policy draft
- **Multi-role composition** — e.g., a security incident automatically combines CISO + Legal + BCM
- **Bilingual** — Keyword matching supports both Japanese and English

### 23 Specialized Roles

| Domain | Role | Key ISO Standards |
|--------|------|-------------------|
| **Governance** (3) | CEO | ISO 37000, ISO 31000, ISO 37001 |
| | Board / Governance | ISO 37000, ISO/IEC 38500 |
| | Internal Audit | ISO 19011, ISO 37301 |
| **Risk** (4) | ERM | ISO 31000, IEC 31010 |
| | Compliance / CMS | ISO 37301, ISO 37001 |
| | Legal | ISO 31022, ISO 37301 |
| | BCM | ISO 22301, ISO 22316 |
| **Security** (3) | CISO / ISMS | ISO/IEC 27001, ISO/IEC 27002 |
| | Privacy / DPO | ISO/IEC 27701, ISO/IEC 27018 |
| | ITSM | ISO/IEC 20000-1, ISO/IEC 27035 |
| **Operations** (7) | COO | ISO 37000, ISO 9004 |
| | PMO / Portfolio | ISO 21502, ISO 21503, ISO 21504 |
| | Project Manager | ISO 21502, ISO 21500 |
| | QMS | ISO 9001, ISO 10002 |
| | Procurement | ISO 20400, ISO/IEC 27036 |
| | Customer Support | ISO 10002, ISO 23592 |
| | Asset Management | ISO 55001 |
| **People** (2) | CHRO | ISO 30414, ISO 30415 |
| | HR Analytics | ISO 30414, ISO 30408 |
| **Sustainability** (4) | ESG | ISO 26000, ISO/UNDP DIS 53001 |
| | Environment / EMS | ISO 14001, ISO 14064 |
| | Energy / EnMS | ISO 50001 |
| | Innovation | ISO 56001, ISO 56002 |

### 5 Action Modes

| Mode | Trigger Example | Output |
|------|----------------|--------|
| **A. Advisory** | "What should I consider for an information security policy?" | Systematic advice based on ISO requirements |
| **B. Document Generation** | "I need to create a BCP policy" | Draft generated from templates + ISO requirements |
| **C. Check / Review** | "Review our ISMS before the external audit" | Gap analysis table / Checklist |
| **D. Incident Response** | "A personal data breach has occurred" | First-response checklist + Report draft |
| **E. Meeting / Process Design** | "Design a management review meeting" | Agenda + RACI + Process flow |

### Quick Start

#### Prerequisites

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) (Anthropic's CLI tool) or [Codex CLI](https://github.com/openai/codex) (OpenAI's CLI tool) installed

#### Installation

```bash
git clone https://github.com/rx-tomo/iso-management-wisdom.git
cd iso-management-wisdom
./install.sh
```

`install.sh` supports both Claude Code (`~/.claude/skills/`) and Codex CLI (`~/.codex/skills/`).

#### Usage

Inside a Claude Code session:

```
/iso-management-wisdom I need to create an information security policy for a 200-person company using cloud services extensively.
```

For Codex CLI:

```
$iso-management-wisdom I need to create an information security policy for a 200-person company using cloud services extensively.
```

### Usage Examples

#### Example 1: Security Policy Creation

```
/iso-management-wisdom Create an information security policy for a mid-size company (200 employees) heavily reliant on cloud services.
```

> Auto-selected roles: **CISO/ISMS** + **CEO**
> Mode: B (Document Generation)
> Output: Policy draft based on ISO/IEC 27001 + executive approval process proposal

#### Example 2: Incident Response

```
/iso-management-wisdom Customer personal data may have been leaked externally. Help with first response and report creation.
```

> Auto-selected roles: **CISO/ISMS** + **Privacy/DPO** + **Legal**
> Mode: D (Incident Response)
> Output: First-response checklist + Stakeholder notification template + Incident report draft

#### Example 3: Audit Preparation

```
/iso-management-wisdom Check our QMS status before next month's ISO 9001 external audit.
```

> Auto-selected roles: **QMS** + **Internal Audit**
> Mode: C (Check / Review)
> Output: Gap analysis table based on ISO 9001 clauses + Findings list

#### Example 4: ESG Reporting Design

```
/iso-management-wisdom Design an ESG report structure and disclosure items, including GHG emission calculation methodology.
```

> Auto-selected roles: **ESG** + **Environment/EMS** + **COO**
> Mode: A (Advisory) + B (Document Generation)
> Output: Disclosure framework comparison + GHG calculation process design + Report structure proposal

### Directory Structure

```
iso-business-wisdom/
├── README.md
├── LICENSE
├── install.sh
└── skill/
    └── iso-management-wisdom/
        ├── SKILL.md              # Skill definition (loaded by Claude Code)
        ├── agents/
        │   └── openai.yaml       # Codex CLI メタデータ
        └── references/
            ├── role-index.md     # Role auto-selection index
            ├── roles/            # 23 role knowledge files
            └── templates/        # 6 document templates
```

### Templates

| Template | Purpose | Use Case |
|----------|---------|----------|
| **RACI Matrix** | Clarify responsibilities | Project structure, audit response |
| **Risk Register** | Identify, assess, and plan risk treatment | ERM, ISMS risk assessment |
| **Gap Analysis** | Analyze gaps against ISO requirements | Certification prep, internal audit |
| **Meeting Design** | Design meeting structure (agenda, roles, cadence) | Management review, audit debrief |
| **Incident Response** | First response through reporting | Security incidents, data breaches |
| **Policy Draft** | Draft policies and procedures | Security policy, BCM policy |

---

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'feat: add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Disclaimer / 免責事項

**日本語**: 本スキルは ISO 規格の公式製品ではありません。ISO 規格の原文は一切含まれておらず、規格への参照、チェックリスト、解釈に基づくガイダンスのみで構成されています。ISO 規格の正式な内容については、[ISO 公式サイト](https://www.iso.org/) から正規の規格書を入手してください。

**English**: This skill is **not** an official ISO product. It contains no ISO standard text — only references, checklists, and interpretive guidance. For the authoritative content of ISO standards, please obtain the official documents from [iso.org](https://www.iso.org/).
