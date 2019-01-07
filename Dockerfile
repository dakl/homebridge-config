FROM oznu/homebridge:raspberry-pi

COPY /root/etc/cont-init.d/50-plugins /etc/cont-init.d/50-plugins

COPY homebridge/package.json /homebridge/package.json
COPY homebridge/config.json /homebridge/config.json

COPY packages.txt /tmp
RUN cat /tmp/packages.txt |xargs npm install -g

RUN echo "#!/usr/bin/env sh" > /etc/services.d/homebridge/run
COPY scripts/run-homebridge.sh /usr/local/bin/
CMD "run-homebridge.sh"