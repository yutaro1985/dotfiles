# dotfiles

個人用の開発環境セットアップ用 dotfiles です。
**ツール管理は mise を中心に、Homebrew は最小限**という方針で構成しています。

- OS: macOS
- Shell: fish
- Tool version manager: mise

---

## 方針

### 1. ツール管理は mise に寄せる

- 言語ランタイム（Node.js / Python / Go など）
- 単体バイナリ（aws / gcloud / terraform / gh / fzf など）
- npm グローバルツール

これらは **すべて mise で管理**します。

理由：

- Homebrew 由来の暗黙的な依存（Python / Node の自動導入）を避けたい
- バージョン更新を `mise up` に集約したい
- プロジェクト単位では `.mise.toml`、グローバルでは `config.toml` を使い分けたい

---

### 2. Homebrew は最小限

Homebrew では以下のみを管理します。

- フォント
- GUI アプリ
- OS 依存が強いツール
- mise での管理が現実的でないもの

Brewfile は **leaves ベース**で管理しています。

---

### 3. secrets / 環境依存情報は含めない

以下は **公開・非公開に関わらず**このリポジトリには含めません。

- AWS / GCP の認証情報
- プロジェクト ID
- `.env` やトークン類
- aws-vault / gcloud / 1password の設定ファイル

環境変数や認証は各マシン・各プロジェクトで設定します。

---

## セットアップ（新しい Mac）

### 前提

- macOS
- Homebrew がインストール済み
- mise がインストール済み

### 手順

```bash
git clone <THIS_REPOSITORY_URL> ~/dotfiles
cd ~/dotfiles
./install.sh
exec $SHELL -l
````

セットアップ後、以下を確認してください。

```bash
mise doctor
```

---

## 構成

```
dotfiles/
├── Brewfile                 # Homebrew（最小）
├── install.sh               # セットアップ用スクリプト（bash）
├── mise/
│   └── config.toml          # グローバル tool 定義
└── fish/
    ├── config.fish
    └── conf.d/
        └── 10-mise.fish
```

---

## 補足

- Rancher Desktop が管理する設定ブロックは変更しません
- `mise activate fish` を使用し、shims の手動 PATH 追加は行いません
- anyenv は使用していません（PATH から外す前提）

---

## License

個人用設定ですが、参考利用は自由です。
