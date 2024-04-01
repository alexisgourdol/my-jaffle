.PHONY : install format

## Development
install:
	poetry install

format:
	ruff format .

jaffle_ingest:
	poetry run python -m ingestion.pipeline

dbt_profiles_update:
	mkdir ~/.dbt/ &&\
	cp transform/jaffle_metrics/profiles.yml ~/.dbt/profiles.yml &&\
	rm transform/jaffle_metrics/profiles.yml &&\
	cp transform/jaffle_metrics/.users.yml ~/.dbt/.users.yml &&\
	rm transform/jaffle_metrics/.users.yml

jaffle_run:
	cd transform/jaffle_metrics && \
	poetry run dbt run

jaffle_test:
	cd transform/jaffle_metrics && \
	poetry run dbt test
