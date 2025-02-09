FROM ubuntu:latest

# TODO: copy only use file for build environments
COPY . /web_source/

RUN apt update \
    && cd /web_source \
    && apt install -y --no-install-recommends \
        curl \
        gdebi \
        build-essential \
        r-base \
        pip \
    && rm -rf /var/lib/apt/lists/* \
	&& Rscript -e 'install.packages("renv", repos="https://cloud.r-project.org")' \
    && pip install poetry --break-system-packages \
    && poetry config --local virtualenvs.in-project true \
    && curl -fsSL https://install.julialang.org | sh -s -- -y \
    && /root/.juliaup/bin/julia --project=@. -e 'using Pkg; Pkg.instantiate(); Pkg.precompile()' \
    && curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb \
    && gdebi --non-interactive quarto-linux-amd64.deb \
    && rm -rf quarto-linux-amd64.deb