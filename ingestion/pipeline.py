from loguru import logger
from pathlib import Path
import duckdb
from ingestion.duck import create_table_from_csv


def get_csv_names_and_paths():
    csv_file_paths = list(Path.cwd().joinpath("ingestion", "jaffle-data").iterdir())
    csv_file_names = [p.name.replace(".csv", "") for p in csv_file_paths]
    csv_file_paths = [str(p) for p in csv_file_paths]
    return csv_file_names, csv_file_paths


def main():
    with duckdb.connect(database="my_jaffle_raw.db", read_only=False) as duckdb_con:
        logger.info(f"Connecting to {duckdb_con}")
        names, paths = get_csv_names_and_paths()
        [
            create_table_from_csv(duckdb_con, name, path)
            for name, path in zip(names, paths)
        ]
        logger.info(f"Closing connection to {duckdb_con}")


if __name__ == "__main__":
    main()
