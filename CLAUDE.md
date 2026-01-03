# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## コーディング規約
- RFC準拠かつ、可読性高く、最も効率的なロジックを利用したshellscriptでの記述。
- ルート直下のcommands.txtのコマンド一覧を積極的に組み合わせて、可能な限りコマンドで吸収。
- シバンはbin/shを利用して、POSIX準拠のshellscriptで記述。
- ネットワーク通信が必要な場合、curlを利用。

## プロジェクト階層

```
main.sh
```
