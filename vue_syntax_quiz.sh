#!/bin/sh

set -eu

SCRIPT_DIR=$(dirname "$0")
QUESTIONS_FILE="${SCRIPT_DIR}/vue_questions.tsv"

if [ ! -f "$QUESTIONS_FILE" ]; then
  echo "エラー: 問題ファイル '$QUESTIONS_FILE' が見つかりません"
  exit 1
fi

echo "=== Vue.js 構文クイズゲーム ==="
echo "Vue.jsの構文に関する問題に答えてください"
echo ""

score=0
total=0

ask_question() {
  question=$1
  choice1=$2
  choice2=$3
  choice3=$4
  choice4=$5
  correct=$6

  total=$((total + 1))
  echo "問題 $total: $question"
  echo "1) $choice1"
  echo "2) $choice2"
  echo "3) $choice3"
  echo "4) $choice4"
  printf "答えを選んでください (1-4): "
  read -r answer

  if [ "$answer" = "$correct" ]; then
    echo "正解！"
    score=$((score + 1))
  else
    correct_text=$(eval echo \$choice"$correct")
    echo "不正解... 正解は $correct) $correct_text です"
  fi
  echo ""
}

# TSVファイルから問題を読み込んで出題
# ファイルディスクリプタ3を使用して標準入力をユーザー入力用に残す
while IFS='	' read -r question choice1 choice2 choice3 choice4 correct <&3; do
  ask_question "$question" "$choice1" "$choice2" "$choice3" "$choice4" "$correct"
done 3< "$QUESTIONS_FILE"

echo "================================"
echo "ゲーム終了！"
echo "スコア: ${score}/${total}"
percentage=$(awk "BEGIN {printf \"%.1f\", ($score / $total) * 100}")
echo "正答率: ${percentage}%"

if [ "$score" -eq "$total" ]; then
  echo "完璧です！Vue.jsマスターですね！"
elif [ "$score" -ge $((total * 7 / 10)) ]; then
  echo "よくできました！"
elif [ "$score" -ge $((total / 2)) ]; then
  echo "もう少し復習しましょう！"
else
  echo "Vue.jsの基礎をもう一度学習しましょう！"
fi
