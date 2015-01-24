# Docker - Mozilla Sync Server

[Mozilla Sync server](https://github.com/mozilla-services/syncserver) image for Docker.
For use with [Docker](http://docker.io)

All suggestions and contributions are very welcome.
There is a room for improvements, so please feel free to open issues and pull requests to help improve these images.

## Disclamer

This image configures a very light sync server that stores data in a sqlite db and uses the built-in server. As stated on the server's documentation page: 
>  it does not really support a lot of load

You will almost certainly want to configure another database and / or serve the content with gunicorn. I plan to add instructions and configuration files to achieve that with this docker image.

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
* A [data volume container](https://docs.docker.com/userguide/dockervolumes/) to persist data between different containers (sqlite db)


## Instruction

### With docker directly

 * Build the syncserver image

Replace ```<your pseudo>``` by a prefix you want to appear in your local docker image registry.

```
  $ docker build -t <your pseudo>/syncserver ./syncserver
```

 * Run

```
  $ docker run -v /data --name syncserverdata busybox
  $ docker run -d -p 5000:5000 --volumes-from syncserverdata --name syncserver <your pseudo>/syncserver
```


### With [fig](http://www.fig.sh/)

Follow the instructions as described on the [fig documentation page](http://www.fig.sh/install.html)  
My favorite install method: `$ sudo pip install -U fig`.

Then, getting the container to build and run becomes be as easy as:

```
  $ fig up
```
