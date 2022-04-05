#!/bin/bash

set -ex

VERSION=v1.4.5 # Old version to build on armv7

git clone https://github.com/ProtonMail/proton-bridge.git

cd proton-bridge
git checkout $VERSION

git apply ../patches/*.patch

# Build
make build-nogui