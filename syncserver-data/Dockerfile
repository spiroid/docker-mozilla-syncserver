# Docker data-only container for mozilla sync server
FROM busybox:latest

MAINTAINER Jonathan Dray <jonathan.dray@gmail.com>

# Add a user to run the sync server
# RUN adduser -s /bin/sh -u 1000 -D syncserver
RUN mkdir /data && chown default:default /data
USER default

# Create a directory to store the data (sqlite db for now)
VOLUME ["/data"]
