<p align="center">
  <a href="https://travis-ci.com/crazy-max/docker-loop"><img src="https://img.shields.io/travis/com/crazy-max/docker-loop/master.svg?style=flat-square" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/crazymax/loop/"><img src="https://img.shields.io/docker/stars/crazymax/loop.svg?style=flat-square" alt="Docker Stars"></a>
  <a href="https://hub.docker.com/r/crazymax/loop/"><img src="https://img.shields.io/docker/pulls/crazymax/loop.svg?style=flat-square" alt="Docker Pulls"></a>
  <a href="https://quay.io/repository/crazymax/loop"><img src="https://quay.io/repository/crazymax/loop/status?style=flat-square" alt="Docker Repository on Quay"></a>
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

## License

MIT. See `LICENSE` for more details.
