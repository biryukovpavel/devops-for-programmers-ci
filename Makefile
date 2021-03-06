test:
	test -f Dockerfile
	test -f docker-compose.yml

build:
	docker build . -t hexlet/devops-for-programmers-ci

schema-load:
	cd ./db && psql -f schema.sql

data-load:
	cd ./db && psql -f users.sql

dev-setup: schema-load data-load

setup:
	npm install

lint:
	npx eslint "src/**"
