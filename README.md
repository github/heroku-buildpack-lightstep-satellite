# heroku-buildpack-lightstep-satellite

A Heroku buildpack to run a LightStep satellite in each dyno.

Features:
- It runs in the background of each dyno, so you can submit trace data without resorting to using the public satellites! :hooray:

Limitations:
- It'll eat up a lot of RAM if you're not careful.
- It cannot bind to default ports, and the debug UI cannot be exposed.

Goals:
- [x] To enable submitting LightStep traces in Heroku without using the public collectors.
- [ ] ???

Status: proof-of-concept. We're using it internally, but it's not well-tested.

## Installation

Follow the instructions on the [Heroku Elements page](https://elements.heroku.com/buildpacks/github/heroku-buildpack-lightstep-satellite).

## Configuration

Configure this buildpack by setting configuration variables for your app. At minimum, you must set:
- `COLLECTOR_SATELLITE_KEY`: the satellite requires this to function.
- `COLLECTOR_PLAIN_PORT`: the satellite tries to bind to port 80 by default, which will not work with Heroku.

Additional configuration variables can be found [in LightStep's documentation](https://docs.lightstep.com/docs/docker-install-and-configure-satellites).

## Notes

We'd love [contributions](./CONTRIBUTING.md) if you have any! We don't have any real roadmap for this buildpack, but we're open to any ideas you may have - [file an issue](https://github.com/github/heroku-buildpack-lightstep-satellite) and let us know what you think!
