#!/bin/bash
set -euo pipefail

SRC_DIR="${1:-}"
DST_DIR="${2:-}"

if [[ -z "$SRC_DIR" || -z "$DST_DIR" ]]; then
  echo "Использование: $0 <src_dir> <dst_dir>"
  exit 1
fi

[[ -d "$SRC_DIR" ]] || { echo "Нет исходной директории: $SRC_DIR"; exit 1; }
mkdir -p "$DST_DIR"

for f in "$SRC_DIR"/*; do
  [[ -f "$f" ]] || continue

  name="$(basename -- "$f")"
  last="${name: -1}"

  if [[ "$last" =~ ^[02468]$ ]]; then
    mv -- "$f" "$DST_DIR/"
  fi
done

echo -n "Осталось в odd: "
ls -1 "$SRC_DIR" 2>/dev/null | wc -l

echo -n "Перенесено в even: "
ls -1 "$DST_DIR" 2>/dev/null | wc -l
