.PHONY : install format

## Development
install:
	poetry install

format:
	ruff format .
