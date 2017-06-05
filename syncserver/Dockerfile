FROM debian:sid

MAINTAINER Jonathan Dray <jonathan.dray@gmail.com>

# Configure APT
ENV DEBIAN_FRONTEND noninteractive
RUN echo 'APT::Install-Recommends "0";\nAPT::Install-Suggests "0";' | tee -a /etc/apt/apt.conf

# Base setup
# Server dependencies
# Cleanup
# Remove package cache
RUN apt-get -y update \
&&  apt-get install --quiet --assume-yes --no-install-recommends \
    locales \
    ca-certificates \
    build-essential \
    python-dev \
    python-virtualenv \
    virtualenv \
    git-core \
&&  apt-get clean \
&&  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Locales configuration
RUN locale-gen C.UTF-8 && LANG=C.UTF-8 /usr/sbin/update-locale
ENV LANG C.UTF-8

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
