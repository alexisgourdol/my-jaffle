ARG PLATFORM=amd64
FROM --platform=linux/${PLATFORM} python:3.11

RUN curl -sSL https://github.com/duckdb/duckdb/releases/download/v0.10.1/duckdb_cli-linux-aarch64.zip -o temp.zip \
    && unzip temp.zip -d /usr/local/bin \
    && rm temp.zip

RUN pip install poetry --no-cache-dir
