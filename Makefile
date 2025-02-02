.PHONY: docker_build
docker_build:
	docker compose up --build --remove-orphans

.PHONY: docker_run
docker_run:
	docker compose run --rm web-source

.PHONY: docker_clean
docker_clean:
	docker system prune --volumes -f

.PHONY: quarto_render
quarto_render:
	poetry run quarto render

.PHONY: lib_snapshot
lib_snapshot:
	Rscript -e 'renv::snapshot()'