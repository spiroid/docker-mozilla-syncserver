# Docker - Mozilla Sync Server

[Mozilla Sync server](https://github.com/mozilla-services/syncserver) images for Docker.
For use with [Docker](http://docker.io)

All suggestions and contributions are very welcome.
There is a room for tons of improvements, so please feel free to open issues and pull requests to help improve these images.


## Getting stared

### Requirements
 * [Git](http://git-scm.com/)
 * [Docker](http://docker.io)

### Get the source code
```
  $ git clone git@github.com:spiroid/docker-mozilla-syncserver.git
  $ cd docker-mozilla-syncserver
```

## Intro

This builds two docker elements :

* One image with the latest version of the sync server in standalone mode
* A data-only container volume to persist data between different containers (sqlite db)


## Build

### Building manually

Replace ```<your pseudo>``` by a prefix you want to appear in your local docker image registry.

```
$ docker build -t <your pseudo>/syncserver-data ./syncserver-data
$ docker build -t <your pseudo>/syncserver ./syncserver
```

**OR**

## Run with [fig](http://www.fig.sh/)

As simple as :

```
  $ fig up
```
