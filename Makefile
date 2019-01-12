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

particle-logs:
	docker logs $(docker ps -q --filter name=particle-relay-hub-api)

tv-logs:
	docker logs $(docker ps -q --filter name=tv-backlight-api)
