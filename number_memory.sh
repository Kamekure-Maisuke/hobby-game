#!/bin/sh

set -eu

echo "=== 数字記憶ゲーム ==="
echo "表示される数字を記憶して入力してください"
echo ""

score=0
level=3

while [ $level -le 10 ]; do
  number=""
  i=0
  while [ $i -lt $level ]; do
    digit=$(awk -v seed="$$$(date +%s)$i" 'BEGIN{srand(seed); print int(rand()*10)}')
    number="${number}${digit}"
    i=$((i + 1))
  done

  echo "レベル $level: ${number}"
  sleep $((level / 2 + 1))
  printf "\033[2J\033[H"

  printf "答えを入力: "
  read answer

  if [ "$answer" = "$number" ]; then
    echo "正解！"
    score=$((score + 1))
    level=$((level + 1))
  else
    echo "不正解... 正解は ${number} でした"
    break
  fi
  echo ""
done

echo "ゲーム終了！スコア: ${score}"
