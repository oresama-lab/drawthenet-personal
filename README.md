# drawthenet-personal
[cidrblock/drawthe.net](https://github.com/cidrblock/drawthe.net) is fantastic tool as text based diagram editor. This repository provides a Dockerfile for deploying the `drawthe.net` environment on your personal machine.

## How to use

⚠ | You need docker environment. If you don't have it, please read [docker official document](https://docs.docker.com/get-docker/) and install docker engine in your machine previously.
:--: | --

First, clone this repository on your machine. The command is below.

```
$ git clone https://github.com/oresama-lab/drawthenet-personal.git
```

Second, change directory and clone [cidrblock/drawthe.net](https://github.com/cidrblock/drawthe.net)'s repository on your machine.

```
$ cd drawthenet-personal
$ git clone https://github.com/cidrblock/drawthe.net.git
```

Then, build docker image from Dockerfile.

```
$ docker build --no-cache -t drawthenet:debian-nginx-node6.17.1 .
```

After the build have finished, run the docker container on your machine. In the following command, port 4000 is tied to the docker container, but you can tie any port to it.

```
$ docker run --rm -d -p 4000:80 drawthenet:debian-nginx-node6.17.1
```

Finaly, go to http://localhost:4000 in your browser. Welcome to `drawthe.net`!

## Authors

- **Masayoshi Tohna** - *Oresama-lab.*

## License

Released under the [MIT license](https://github.com/oresama-lab/drawthenet-personal/blob/main/LICENSE)  
Copyright (c) 2020 Oresama-lab.