.PHONY : install format

## Development
install:
	poetry install

format:
	ruff format . &&\
	cd transform/jaffle_metrics && pwd && \
	sqlfluff lint -t dbt . && \
	dbt clean

ingest:
	poetry run python -m ingestion.pipeline

dbt_profiles_update:
	mkdir ~/.dbt/ &&\
	cp transform/jaffle_metrics/profiles.yml ~/.dbt/profiles.yml &&\
	rm transform/jaffle_metrics/profiles.yml &&\
	cp transform/jaffle_metrics/.user.yml ~/.dbt/.user.yml &&\
	rm transform/jaffle_metrics/.user.yml

run:
	cd transform/jaffle_metrics && \
	poetry run dbt deps && \
	poetry run dbt run

test:
	cd transform/jaffle_metrics && \
	poetry run dbt test
