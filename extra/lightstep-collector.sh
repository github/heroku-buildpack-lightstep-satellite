#!/bin/bash

ulimit -n $(ulimit -n -H)

LS_POOL=${LS_POOL:-heroku}
LS_GUID="${HEROKU_APP_NAME}-${DYNO}"
LS_BYTES_PER_PROJECT=${LS_BYTES_PER_PROJECT:-100000}
# TODO: metrics
# TODO: ports
cat <<EOF > "$HOME/bin/lightstep-collector/collector.yaml"
api_key: ${LS_API_KEY}
pool: ${LS_POOL}
guid: ${LS_GUID}
babysitter_port: 8000
plain_port: 8383
admin:
  plain_port: 8080
http:
  plain_port: 8181
grpc:
  plain_port: 8282
instrument:
  start_wait_time_limit: 30s
reporter:
  bytes_per_project: ${LS_BYTES_PER_PROJECT}
  span_group_update_period: 2s
EOF

"$HOME/bin/lightstep-collector/collector" \
  --collector_base_config="$HOME/bin/lightstep-collector/collector.yaml" 2>&1 &
