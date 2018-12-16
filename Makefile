deploy:
	docker stack deploy --compose-file=docker-compose.yaml klevanstack

remove:
	docker stack rm klevanstack

particle-logs:
	docker logs (docker ps -q --filter name=particle-homebridge-translation-api)

homebridge-logs:
	docker logs (docker ps -q --filter name=homebridge)
