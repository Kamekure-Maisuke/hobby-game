# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## コーディング規約
- RFC準拠かつ、可読性高く、最も効率的なロジックを利用したshellscriptでの記述。
- ルート直下のcommands.txtのコマンド一覧を積極的に組み合わせる。
- ループや検索や置換などは可能な限りコマンドで吸収して、記述量を大幅に削減。
- シバンはbin/shを利用して、POSIX準拠のshellscriptで記述。
- ネットワーク通信が必要な場合、curlを利用。

## プロジェクト階層

```
.github
  workflows
    ci.yml
XXXX.sh
```

## 内容
- hobby gameのスクリプトを保存。
- shellscriptで記述。
- github actionでshellcheckとbats coreを動かしている。
