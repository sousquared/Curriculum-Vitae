#!/bin/bash

# PDF生成スクリプト
# Pandoc + XeLaTeXを使用してMarkdownからPDFを生成

set -e

# BasicTeXのパスを設定（インストールされている場合）
if [ -d "/Library/TeX/texbin" ]; then
    export PATH="/Library/TeX/texbin:$PATH"
fi

# Homebrewのパスを設定（インストールされている場合）
if [ -d "/opt/homebrew/bin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
elif [ -d "/usr/local/bin" ]; then
    export PATH="/usr/local/bin:$PATH"
fi

# 出力ディレクトリ
OUTPUT_DIR="pdfs"
mkdir -p "$OUTPUT_DIR"

# 日本語フォント設定（macOSの場合）
JAPANESE_FONT="Hiragino Mincho ProN"

# PDF生成関数
generate_pdf() {
    local input_file=$1
    local output_file=$2
    local lang=$3
    
    if [ ! -f "$input_file" ]; then
        echo "Error: Input file not found: $input_file"
        return 1
    fi
    
    echo "Generating PDF: $input_file -> $output_file"
    
    if [ "$lang" = "JP" ]; then
        pandoc "$input_file" \
            -o "$output_file" \
            --pdf-engine=xelatex \
            -V mainfont="$JAPANESE_FONT" \
            -V geometry:margin=1.6cm \
            -V geometry:a4paper \
            -V documentclass=article \
            -V fontsize=11pt \
            -V header-includes="\\XeTeXlinebreaklocale \"ja\"\\XeTeXlinebreakskip=0pt plus 1pt\\usepackage{microtype}\\usepackage{ragged2e}\\sloppy\\setlength{\\emergencystretch}{6em}"
    else
        pandoc "$input_file" \
            -o "$output_file" \
            --pdf-engine=xelatex \
            -V geometry:margin=1.6cm \
            -V geometry:a4paper \
            -V documentclass=article \
            -V fontsize=11pt \
            -V header-includes="\\XeTeXlinebreaklocale \"ja\"\\XeTeXlinebreakskip=0pt plus 1pt\\usepackage{microtype}\\usepackage{ragged2e}\\sloppy\\setlength{\\emergencystretch}{6em}"
    fi
    
    if [ $? -eq 0 ]; then
        echo "✓ Generated: $output_file"
    else
        echo "✗ Failed to generate: $output_file"
        return 1
    fi
}

# 日本語版のPDF生成
generate_pdf "resume_JP.md" "$OUTPUT_DIR/resume_JP.pdf" "JP"
generate_pdf "work_history_JP.md" "$OUTPUT_DIR/work_history_JP.pdf" "JP"

# 英語版のPDF生成
generate_pdf "resume_EN.md" "$OUTPUT_DIR/resume_EN.pdf" "EN"
generate_pdf "work_history_EN.md" "$OUTPUT_DIR/work_history_EN.pdf" "EN"

echo ""
echo "All PDFs generated successfully in ./$OUTPUT_DIR/"
