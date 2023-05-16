#! /bin/sh

set -eux
set -o pipefail

# install pg_dump
apk --no-cache add postgresql-client

# install gpg
apk --no-cache add gnupg

# install tini
apk --no-cache add tini

apk --no-cache add python3
apk --no-cache add py3-pip  # separate package on edge only
pip3 install --no-cache-dir awscli
