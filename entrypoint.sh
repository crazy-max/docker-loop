#!/bin/sh

TZ=${TZ:-UTC}
LOG_FILE=${LOG_FILE:-/tmp/loop.log}
DURATION=${DURATION:-60s}

# Timezone
ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime
echo ${TZ} > /etc/timezone

exec "$@"
