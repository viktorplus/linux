#!/bin/bash

set -euo pipefail

random_dir="random/odd"
even_dir="random/even"

mkdir -p "$PWD/$random_dir" "$PWD/$even_dir"

for i in {1..100}; do
 touch "$PWD/$random_dir/$RANDOM"
done
script_dir="$(cd "$(dirname "$0")" && pwd)"
"$script_dir/remove_even.sh" "$PWD/$random_dir" "$PWD/$even_dir"


