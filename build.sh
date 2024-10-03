#!/bin/bash

set -m

trap 'ret=$?; echo "$0:$LINENO: Error: set -e triggered"; exit $ret' ERR

declare -a actions=("release_test_hydra_image")
for a in "${actions[@]}"; do
  gh workflow run "${a}.yml" --ref main || true
done
