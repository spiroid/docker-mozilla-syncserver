FROM alpine:3.6

MAINTAINER Jonathan Dray <jonathan.dray@gmail.com>


# Update package manager
RUN apk update

# Install required dependencies
RUN apk add python py-pip libstdc++ \
    python-dev make gcc g++ git py-virtualenv && \
    apk del --purge $BUILD_DEP && \
    rm /var/cache/apk/* && \
    rm -rf /root/.cache

# Get the latest version at https://github.com/mozilla-services/syncserver and run the build command
RUN cd /usr/local/share && git clone https://github.com/mozilla-services/syncserver
WORKDIR /usr/local/share/syncserver
RUN make build

# Add the configuration file
RUN mkdir /usr/local/share/config
ADD resources/syncserver.ini /usr/local/share/config/syncserver.ini

# Run the Sync server
EXPOSE 5000
VOLUME ["/data", "/usr/local/share/config"]
CMD ["/usr/local/share/syncserver/local/bin/pserve", "/usr/local/share/config/syncserver.ini"]
