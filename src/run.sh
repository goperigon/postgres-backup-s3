#! /bin/sh

set -eu

if [ "$S3_S3V4" = "yes" ]; then
  aws configure set default.s3.signature_version s3v4
fi

if [ -z "$SCHEDULE" ]; then
  sh backup.sh
else
  printf "${SCHEDULE} cd / && /bin/sh /backup.sh > /proc/1/fd/1 2> /proc/1/fd/2\n" | crontab -
  exec crond -f -d 8
fi
