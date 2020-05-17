<p align="center">
  <a href="https://github.com/crazy-max/docker-loop/actions?workflow=build"><img src="https://img.shields.io/github/workflow/status/crazy-max/docker-loop/build?label=build&logo=github&style=flat-square" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/crazymax/loop/"><img src="https://img.shields.io/docker/stars/crazymax/loop.svg?style=flat-square&logo=docker" alt="Docker Stars"></a>
  <a href="https://hub.docker.com/r/crazymax/loop/"><img src="https://img.shields.io/docker/pulls/crazymax/loop.svg?style=flat-square&logo=docker" alt="Docker Pulls"></a>
  <a href="https://www.codacy.com/app/crazy-max/docker-loop"><img src="https://img.shields.io/codacy/grade/aec5b19e03214db69323c466b00ccae0.svg?style=flat-square" alt="Code Quality"></a>
  <br /><a href="https://github.com/sponsors/crazy-max"><img src="https://img.shields.io/badge/sponsor-crazy--max-181717.svg?logo=github&style=flat-square" alt="Become a sponsor"></a>
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

All kinds of contributions are welcome :raised_hands:! The most basic way to show your support is to star :star2: the project, or to raise issues :speech_balloon: You can also support this project by [**becoming a sponsor on GitHub**](https://github.com/sponsors/crazy-max) :clap: or by making a [Paypal donation](https://www.paypal.me/crazyws) to ensure this journey continues indefinitely! :rocket:

Thanks again for your support, it is much appreciated! :pray:

## License

MIT. See `LICENSE` for more details.
