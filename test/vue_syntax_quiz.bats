#!/usr/bin/env bats

# テスト対象のスクリプトパス
SCRIPT="./vue_syntax_quiz.sh"

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
