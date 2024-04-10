.PHONY : install format

## Development
install:
	poetry install

format:
	ruff format . &&\
	cd transform/jaffle_metrics && \
	poetry run dbt compile && \
	poetry run sqlfluff lint -t dbt . && \
	poetry run sqlfluff fix -t dbt . && \
	poetry run dbt clean && \
	cd -

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
	poetry run dbt run

test:
	cd transform/jaffle_metrics && \
	poetry run dbt test
