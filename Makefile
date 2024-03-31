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
