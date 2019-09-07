# https://github.com/humbertosales/espruinohub-docker-rpi/blob/master/Dockerfile
FROM nodered/node-red-docker:rpi

MAINTAINER Zane Claes <zane@technicallywizardry.com>

USER root

# Install dependencies
RUN apt-get -yqq update && \
    apt-get -yqq --no-install-recommends install git build-essential python-rpi.gpio bluetooth bluez libbluetooth-dev libudev-dev bluez-tools rfkill && \
    apt-get -yqq autoremove && \
    apt-get -yqq clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/*

RUN ln /usr/local/bin/node /usr/bin/node

RUN usermod -a -G bluetooth root && \
    setcap cap_net_raw+eip /usr/local/bin/node

RUN git clone https://github.com/espruino/EspruinoHub /var/espruinohub

WORKDIR /var/espruinohub

RUN npm install && \
    npm cache clean --force

#Run other commands for start BLE...
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
RUN chmod +x /usr/bin/docker-entrypoint.sh

CMD /usr/bin/docker-entrypoint.sh
