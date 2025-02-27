# protonmail-bridge-docker

This repo is heavily based on the repo https://github.com/shenxn/protonmail-bridge-docker with some patches to allow [K-9 Mail](https://github.com/k9mail/k-9) support. For now it only supports the `amd64` architecture.


## Tags

There are two tags worth mentioning.
 - `latest`: Image based on the latest stable release of [proton-bridge](https://github.com/ProtonMail/proton-bridge). Currently `v2.1.1`.
 - `beta`: Image based on the latest pre-release of [proton-bridge](https://github.com/ProtonMail/proton-bridge). Currently `v2.1.2`.

## Initialization

To initialize and add account to the bridge, run the following command.

```
docker run --rm -it -v /path/to/protonmail:/root ghcr.io/tchilderhose/protonmail-bridge-docker init
```

Wait for the bridge to startup, use `login` command and follow the instructions to add your account into the bridge. Then use `info` to see the configuration information (username and password). After that, use `exit` to exit the bridge. You may need `CTRL+C` to exit the docker entirely.

## Run

To run the container, use the following command.

```
docker run -d --name=protonmail-bridge -v /path/to/protonmail:/root -p 1025:25/tcp -p 1143:143/tcp --restart=unless-stopped ghcr.io/tchilderhose/protonmail-bridge-docker
```

or Docker-compose

```
  protonmail:
    image:  ghcr.io/tchilderhose/protonmail-bridge-docker
    container_name: protonmail
    restart: unless-stopped
    ports:
      - "1025:25/tcp"
      - "1143:143/tcp"
    volumes:
      - /path/to/protonmail:/root
```
