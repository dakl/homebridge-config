build:
	docker build -t dakl/homebridge .

push:
	docker push dakl/homebridge

deploy:
	docker stack deploy --resolve-image=never --compose-file=docker-compose.yaml klevanstack

start-homebridge:
	docker-compose -f docker-compose-homebridge.yaml up -d

remove:
	docker stack rm klevanstack

particle-logs:
	docker logs (docker ps -q --filter name=particle-relay-hub-api)

homebridge-logs:
	docker-compose logs -f homebridge
