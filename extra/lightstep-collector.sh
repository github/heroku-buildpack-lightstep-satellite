#!/usr/bin/env bash

ulimit -n $(ulimit -n -H)

"$HOME/.lightstep-collector/collector" 2>&1 &
