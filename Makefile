up:
	docker-compose up -d
build:
	docker-compose build --no-cache --force-rm
down:
	docker-compose down --remove-orphans
start:
	@make build
	@make up
restart:
	@make down
	@make build
	@make up
app:
	docker-compose exec app bash
ps:
	docker-compose ps
logs:
	docker-compose logs
logging:
	docker-compose logs -f
