#!/usr/bin/env bats

# テスト対象のスクリプトパス
SCRIPT="./number_memory.sh"

@test "スクリプトファイルが存在する" {
  [ -f "$SCRIPT" ]
}

@test "スクリプトが実行可能である" {
  [ -x "$SCRIPT" ]
}

@test "スクリプトにshebangが含まれている" {
  run head -n 1 "$SCRIPT"
  [[ "$output" =~ ^#!/bin/sh ]]
}

@test "スクリプトがタイトルを出力する" {
  run timeout 1 sh -c "echo '' | $SCRIPT" || true
  [[ "$output" =~ "数字記憶ゲーム" ]]
}

@test "スクリプトが説明文を出力する" {
  run timeout 1 sh -c "echo '' | $SCRIPT" || true
  [[ "$output" =~ "表示される数字を記憶して入力してください" ]]
}

@test "スクリプトが初期レベル3から開始する" {
  run timeout 1 sh -c "echo '' | $SCRIPT" || true
  [[ "$output" =~ "レベル 3" ]]
}

@test "不正解時にゲーム終了メッセージを表示する" {
  run timeout 2 sh -c "echo '000' | $SCRIPT" || true
  [[ "$output" =~ "ゲーム終了" ]]
}

@test "スコアが表示される" {
  run timeout 2 sh -c "echo '000' | $SCRIPT" || true
  [[ "$output" =~ "スコア:" ]]
}

@test "ShellCheckでエラーがない" {
  command -v shellcheck >/dev/null 2>&1 || skip "shellcheck not installed"
  run shellcheck "$SCRIPT"
  [ "$status" -eq 0 ]
}
