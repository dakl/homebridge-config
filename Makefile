build:
	docker build -t dakl/homebridge .

push:
	docker push dakl/homebridge

deploy:
	docker stack deploy --compose-file=docker-compose.yaml klevanstack

remove:
	docker stack rm klevanstack

particle-logs:
	docker logs (docker ps -q --filter name=particle-relay-hub-api)

homebridge-logs:
	docker logs (docker ps -q --filter name=homebridge)
