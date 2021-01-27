ulimit -n $(ulimit -n -H)

LS_DIR="$HOME/.lightstep-collector"
LS_POOL=${LS_POOL:-heroku}
LS_GUID="${LS_SERVICE:-heroku-service}-${DYNO:-unknown-dyno}"
LS_BYTES_PER_PROJECT=${LS_BYTES_PER_PROJECT:-100000}
# TODO: metrics
# TODO: ports
cat <<EOF > "$LS_DIR/config.yaml"
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

"$LS_DIR/collector" --collector_base_config="$LS_DIR/config.yaml" 2>&1 &
