<p align="center">
  <a href="https://github.com/crazy-max/docker-loop/actions?workflow=build"><img src="https://img.shields.io/github/actions/workflow/status/crazy-max/docker-loop/build.yml?branch=master&label=build&logo=github&style=flat-square" alt="Build Status"></a>
  <a href="https://hub.docker.com/r/crazymax/loop/"><img src="https://img.shields.io/docker/stars/crazymax/loop.svg?style=flat-square&logo=docker" alt="Docker Stars"></a>
  <a href="https://hub.docker.com/r/crazymax/loop/"><img src="https://img.shields.io/docker/pulls/crazymax/loop.svg?style=flat-square&logo=docker" alt="Docker Pulls"></a>
  <br /><a href="https://github.com/sponsors/crazy-max"><img src="https://img.shields.io/badge/sponsor-crazy--max-181717.svg?logo=github&style=flat-square" alt="Become a sponsor"></a>
  <a href="https://www.paypal.me/crazyws"><img src="https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square" alt="Donate Paypal"></a>
</p>

## About

Simple loop Docker image for dummy services.

> **Note**
> 
> Want to be notified of new releases? Check out 🔔 [Diun (Docker Image Update Notifier)](https://github.com/crazy-max/diun)
> project!

___

* [Image](#image)
* [Environment variables](#environment-variables)
* [Usage](#usage)
* [Contributing](#contributing)
* [License](#license)

## Image

| Registry                                                                                         | Image                           |
|--------------------------------------------------------------------------------------------------|---------------------------------|
| [Docker Hub](https://hub.docker.com/r/crazymax/loop/)                                            | `crazymax/loop`                 |
| [GitHub Container Registry](https://github.com/users/crazy-max/packages/container/package/loop)  | `ghcr.io/crazy-max/loop`        |

Following platforms for this image are available:

```
$ docker run --rm mplatform/mquery crazymax/loop:latest
Image: crazymax/loop:latest
 * Manifest List: Yes
 * Supported platforms:
   - linux/amd64
   - linux/arm/v6
   - linux/arm/v7
   - linux/arm64
   - linux/386
```

## Environment variables

* `TZ`: The timezone assigned to the container (default `UTC`)
* `DURATION`: Keep going until the duration has elapsed (default `60s`)

## Usage

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

## Contributing

Want to contribute? Awesome! The most basic way to show your support is to star the project, or to raise issues. You
can also support this project by [**becoming a sponsor on GitHub**](https://github.com/sponsors/crazy-max) or by making
a [Paypal donation](https://www.paypal.me/crazyws) to ensure this journey continues indefinitely!

Thanks again for your support, it is much appreciated! :pray:

## License

MIT. See `LICENSE` for more details.
