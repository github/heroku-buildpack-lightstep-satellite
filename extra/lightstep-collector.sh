#!/usr/bin/env bash

ulimit -n $(ulimit -n -H)

LS_DIR="$HOME/.lightstep-collector"
"$LS_DIR/collector" --collector_base_config="$LS_DIR/config.yaml" 2>&1 &
