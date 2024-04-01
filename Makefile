.PHONY : install format

## Development
install:
	poetry install

format:
	ruff format .

jaffle_ingest:
	poetry run python -m ingestion.pipeline

dbt_profiles_update:
	cp profiles.yml /root/.dbt/profiles.yml

jaffle_run:
	cd transform/jaffle_metrics && \
	poetry run dbt run

jaffle_test:
	cd transform/jaffle_metrics && \
	poetry run dbt test
