.PHONY : install format

## Development
install:
	poetry install

format:
	ruff format .

jaffle_ingest:
	poetry run python -m ingestion.pipeline
