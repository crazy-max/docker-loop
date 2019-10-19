<p align="center">
  <a href="https://github.com/crazy-max/docker-loop/actions?workflow=build"><img src="https://github.com/crazy-max/docker-loop/workflows/build/badge.svg" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/crazymax/loop/"><img src="https://img.shields.io/docker/stars/crazymax/loop.svg?style=flat-square" alt="Docker Stars"></a>
  <a href="https://hub.docker.com/r/crazymax/loop/"><img src="https://img.shields.io/docker/pulls/crazymax/loop.svg?style=flat-square" alt="Docker Pulls"></a>
  <a href="https://www.codacy.com/app/crazy-max/docker-loop"><img src="https://img.shields.io/codacy/grade/aec5b19e03214db69323c466b00ccae0.svg?style=flat-square" alt="Code Quality"></a>
  <br /><a href="https://www.patreon.com/crazymax"><img src="https://img.shields.io/badge/donate-patreon-f96854.svg?logo=patreon&style=flat-square" alt="Support me on Patreon"></a>
  <a href="https://www.paypal.me/crazyws"><img src="https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square" alt="Donate Paypal"></a>
</p>

## About

🐳 Simple loop for dummy services.<br />
If you are interested, [check out](https://hub.docker.com/r/crazymax/) my other 🐳 Docker images!

💡 Want to be notified of new releases? Check out 🔔 [Diun (Docker Image Update Notifier)](https://github.com/crazy-max/diun) project!

## Environment variables

* `TZ` : The timezone assigned to the container (default `UTC`)
* `DURATION` : Keep going until the duration has elapsed (default `60s`)

## Use this image

```
$ docker run --rm -it --name loop crazymax/loop:latest
Mon Apr 29 00:08:58 UTC 2019 - bed1d93e0940
Mon Apr 29 00:08:59 UTC 2019 - bed1d93e0940
Mon Apr 29 00:09:00 UTC 2019 - bed1d93e0940
Mon Apr 29 00:09:01 UTC 2019 - bed1d93e0940
Mon Apr 29 00:09:02 UTC 2019 - bed1d93e0940
Mon Apr 29 00:09:03 UTC 2019 - bed1d93e0940
Mon Apr 29 00:09:04 UTC 2019 - bed1d93e0940
Mon Apr 29 00:09:05 UTC 2019 - bed1d93e0940
Mon Apr 29 00:09:06 UTC 2019 - bed1d93e0940
Mon Apr 29 00:09:07 UTC 2019 - bed1d93e0940
...
```

## How can I help ?

All kinds of contributions are welcome :raised_hands:!<br />
The most basic way to show your support is to star :star2: the project, or to raise issues :speech_balloon:<br />
But we're not gonna lie to each other, I'd rather you buy me a beer or two :beers:!

[![Support me on Patreon](.res/patreon.png)](https://www.patreon.com/crazymax) 
[![Paypal Donate](.res/paypal.png)](https://www.paypal.me/crazyws)

## License

MIT. See `LICENSE` for more details.
