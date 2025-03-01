# 目的
[マヨヒガ研究所](https://yasuih777.github.io/MayohigaLab/qmds/index.html)を管理するレポジトリ

# 環境

- OS: macOS Sequoia
- Homebrew: 4.4.22
- Quarto: 1.6.40
- Python: 3.12.9
- R: 4.4.3
- Julia: 1.11.3

# 前準備

## Homebrewのインストール

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/username/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

## ツールのインストール

```shell
make build_init
make build_lib
```

# ライセンス
このブログ内の内容は[クリエイティブ・コモンズ・ライセンス](https://creativecommons.org/licenses/by/4.0/deed.ja)を適応します。

※ブログ内のコード部分に関しては例外的にMIT Licenceを適応します。