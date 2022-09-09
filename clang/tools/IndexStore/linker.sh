#!/bin/bash

set -euo pipefail

skip_next=0
args=()
for arg in "$@"; do
  # Ignore rpath arguments since those aren't valid for relocatable objects
  if [[ "$arg" == -rpath ]]; then
    skip_next=1
    continue
  elif [[ "$skip_next" == 1 ]]; then
    skip_next=0
    continue
  # -r and -dead_strip cannot be used together
  elif [[ "$arg" != -dead_strip ]]; then
    args+=("$arg")
  fi
done

ld "${args[@]}"
