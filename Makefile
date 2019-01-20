HASS_VERSION=0.85.1
# HASS_IMAGE=homeassistant/raspberrypi3-homeassistant
HASS_IMAGE=homeassistant/home-assistant
HASS_IMAGE_TAGNAME=$(HASS_IMAGE):$(HASS_VERSION)


build:
	docker build -t dakl/homebridge .

push:
	docker push dakl/homebridge

deploy-apis:
	docker stack deploy --resolve-image=never --compose-file=docker-compose-apis.yaml apistack

remove-apis:
	docker stack rm apistack

pull:
	docker pull dakl/homebridge

start: pull
	docker run --net=host --name=homebridge --restart=always -d dakl/homebridge:latest

start-hass:
	git submodule update --recursive --remote
	docker pull ${HASS_IMAGE_TAGNAME}
	docker run --rm --name hassio \
		-d \
		-e "TZ=Europe/Stockholm" \
		-v ${PWD}/homeassistant-config/config:/config \
		-p 8123:8123 \
		${HASS_IMAGE_TAGNAME}

particle-logs:
	docker logs $(docker ps -q --filter name=particle-relay-hub-api)

tv-logs:
	docker logs $(docker ps -q --filter name=tv-backlight-api)
