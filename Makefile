build:
	docker build . -t hexlet/devops-for-programmers-ci

schema-load:
	cd ./db && psql hexlet < schema.sql

data-load:
	cd ./db && psql hexlet < users.sql

db-reset:
	dropdb hexlet || true
	createdb hexlet

db-create:
	createdb hexlet

dev-setup: schema-load data-load