# Resume/Curriculum Vitae

**Language**: [日本語 (Japanese)](README_JP.md) | [English](README_EN.md)

Please select your preferred language above.

---

## PDF 生成

履歴書と職務経歴書を PDF 形式で出力できます。

### 必要な依存関係

macOS の場合、以下のコマンドでインストールしてください（初回のみ）：

```bash
# 1. 依存関係のインストール
brew install pandoc
brew install --cask basictex

# 2. BasicTeXの初期設定（パスワード入力が必要）
# ターミナルを再起動するか、パスを設定してから実行
export PATH="/Library/TeX/texbin:$PATH"
sudo tlmgr update --self
sudo tlmgr install collection-fontsrecommended
```

**推奨**: CLI のみ使用する場合は、軽量な BasicTeX（約 100MB）をおすすめします。  
MacTeX（約 4GB）は GUI アプリも含むフルセットですが、CLI のみの用途では不要です。

### PDF 生成方法

以下のコマンドで PDF を生成できます：

```bash
./generate_pdf.sh
```

スクリプト内で BasicTeX と Homebrew のパスを自動設定するため、追加のパス設定は不要です。

生成された PDF は `pdfs/` ディレクトリに出力されます：

- `pdfs/resume_JP.pdf` - 履歴書（日本語）
- `pdfs/work_history_JP.pdf` - 職務経歴書（日本語）
- `pdfs/resume_EN.pdf` - Resume (English)
- `pdfs/work_history_EN.pdf` - Work History (English)

### ファイル構成

- `resume_JP.md` / `resume_EN.md` - 履歴書（基本情報、学歴、職務経歴の概要）
- `work_history_JP.md` / `work_history_EN.md` - 職務経歴書（詳細な職務内容、スキル、研究、記事など）

---

Reference: https://github.com/okohs/Curriculum-Vitae-template
