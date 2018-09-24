all: up prod

travis: up noclean

up:
	docker-compose up -d

rebuild_image:
	docker-compose build

down:
	docker-compose down

listen:
	docker-compose exec jekyll grunt

dev:
	docker-compose exec jekyll grunt build:dev

prod:
	docker-compose exec jekyll grunt build:prod

noclean:
	docker-compose exec jekyll grunt build:noclean

bash:
	docker-compose exec jekyll bash

gemfile_to_container: up
	docker cp build-environment/Gemfile websitestatic_jekyll_1:/usr/src/h2o-docs/Gemfile

gemfile_lock_from_container: up
	docker cp websitestatic_jekyll_1:/usr/src/h2o-docs/Gemfile.lock build-environment/Gemfile.lock
