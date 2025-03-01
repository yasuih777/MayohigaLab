FILE=./qmds/
PYTHON_VERSION=3.12.9

.PHONY: build_init
build_init:
	brew install quarto
	brew install pyenv
	brew install poetry
	brew install r
	brew install juliaup
	pyenv install ${PYTHON_VERSION}
	pyenv local ${PYTHON_VERSION}
	poetry config virtualenvs.in-project true --local
	Rscript -e 'install.packages("renv", repos="https://cloud.r-project.org");'

.PHONY: build_lib
build_lib:
	poetry install
	Rscript -e 'renv::restore(); renv::repair()'
	julia --project=@. -e 'using Pkg; Pkg.instantiate(); Pkg.precompile()'

.PHONY: quarto_render
quarto_render:
	poetry run Rscript -e 'IRkernel::installspec()'
	poetry run quarto render ${FILE}

.PHONY: jupyter_build
jupyter_build:
	poetry run Rscript -e 'IRkernel::installspec()'
	poetry run jupyter lab \
		--ip=0.0.0.0 \
		--port=8888 \
		--no-browser \
		--notebook-dir=/web_source \
		--allow-root --LabApp.token=""

.PHONY: lib_snapshot
lib_snapshot:
	Rscript -e 'renv::snapshot()'