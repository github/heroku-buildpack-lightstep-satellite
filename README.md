# heroku-buildpack-lightstep-collector

Heroku buildpack to run the lightstep collector in each dyno.

## Configuration

Configure this buildpack by setting configuration variables for your app. At minimum, you must set:
- `COLLECTOR_SATELLITE_KEY`: the satellite requires this to function.
- `COLLECTOR_PLAIN_PORT`: the satellite tries to bind to port 80 by default, which will not work with Heroku.

Additional configuration variables can be found [in LightStep's documentation](https://docs.lightstep.com/docs/docker-install-and-configure-satellites).
