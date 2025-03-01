FILE=./qmds/

.PHONY: docker_build
docker_build:
	docker compose up --build --remove-orphans

.PHONY: docker_run
docker_run:
	docker compose run -p 8888:8888 --rm web-source

.PHONY: docker_clean
docker_clean:
	docker system prune --volumes -f

.PHONY: build_init
build_init:
	poetry install

.PHONY: quarto_render
quarto_render:
	poetry run quarto render ${FILE}

.PHONY: jupyter_build
jupyter_build:
	poetry run Rscript -e 'IRkernel::installspec(user=FALSE)'
	poetry run jupyter lab \
		--ip=0.0.0.0 \
		--port=8888 \
		--no-browser \
		--notebook-dir=/web_source \
		--allow-root --LabApp.token=""

.PHONY: lib_snapshot
lib_snapshot:
	Rscript -e 'renv::snapshot()'