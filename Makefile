postgres:
		@sudo systemctl stop postgresql
		@docker compose up
stoplocalserver:
		sudo systemctl stop postgresql
createdb:
		@docker exec -it simple_bank_db createdb --username=admin --owner=admin simple_bank
dropdb:
		@docker exec -it simple_bank_db dropdb simple_bank

resetdb:
	@docker container rm simple_bank_db
	@docker volume rm simplebank_db

startdb:
	@sudo systemctl stop postgresql
	@docker container start simple_bank_db

migratedown:
	@migrate -path db/migration -database "postgresql://admin:root@localhost:5432/simple_bank?sslmode=disable" -verbose down


migrateup:
	@migrate -path db/migration -database "postgresql://admin:root@localhost:5432/simple_bank?sslmode=disable" -verbose up

sqlc:
	@sqlc generate


.PHONY: postgres createdb migratedown migrateup sqlc startdb
