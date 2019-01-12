build:
	docker build -t dakl/homebridge .

push:
	docker push dakl/homebridge

deploy-apis:
	docker stack deploy --resolve-image=never --compose-file=docker-compose-apis.yaml apistack

remove-apis:
	docker stack rm apistack

start:
	docker pull dakl/homebridge:latest && docker-compose up -d

particle-logs:
	docker logs $(docker ps -q --filter name=particle-relay-hub-api)

tv-logs:
	docker logs $(docker ps -q --filter name=tv-backlight-api)
