#!/usr/bin/env bash

set -euo pipefail

export TZ="Asia/Shanghai"

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
template="$repo_root/.templates/日记模板.md"
today="${DATE_OVERRIDE:-$(date +%F)}"
yesterday="$(date -d "$today - 1 day" +%F)"

weekday_name() {
  case "$(date -d "$1" +%u)" in
    1) printf '星期一' ;;
    2) printf '星期二' ;;
    3) printf '星期三' ;;
    4) printf '星期四' ;;
    5) printf '星期五' ;;
    6) printf '星期六' ;;
    7) printf '星期日' ;;
  esac
}

note_path() {
  printf '%s/日记/%s年/%s月/%s.md' \
    "$repo_root" \
    "$(date -d "$1" +%Y)" \
    "$(date -d "$1" +%m)" \
    "$1"
}

render_note() {
  local note_date="$1"
  local output="$2"
  sed \
    -e "s/{{date}}/$note_date/g" \
    -e "s/{{weekday}}/$(weekday_name "$note_date")/g" \
    "$template" > "$output"
}

if [[ ! -f "$template" ]]; then
  echo "找不到日记模板：$template" >&2
  exit 1
fi

yesterday_file="$(note_path "$yesterday")"
if [[ -f "$yesterday_file" ]]; then
  expected_yesterday="$(mktemp)"
  trap 'rm -f "$expected_yesterday"' EXIT
  render_note "$yesterday" "$expected_yesterday"

  if cmp -s "$yesterday_file" "$expected_yesterday"; then
    rm "$yesterday_file"
    echo "已删除未填写的昨日日记：${yesterday_file#"$repo_root/"}"
  else
    echo "昨日日记已填写，予以保留：${yesterday_file#"$repo_root/"}"
  fi
fi

today_file="$(note_path "$today")"
if [[ -e "$today_file" ]]; then
  echo "今日日记已存在，不会覆盖：${today_file#"$repo_root/"}"
  exit 0
fi

mkdir -p "$(dirname "$today_file")"
render_note "$today" "$today_file"
echo "已创建今日日记：${today_file#"$repo_root/"}"
