from pathlib import Path
import pandas as pd
import duckdb
from ingestion.duck import create_table_from_csv


def get_csv_names_and_paths():
    csv_file_paths = list(Path.cwd().joinpath("ingestion", "jaffle-data").iterdir())
    csv_file_names = [p.name.replace(".csv", "") for p in csv_file_paths]
    csv_file_paths = [str(p) for p in csv_file_paths]
    return csv_file_names, csv_file_paths


def main():
    conn = duckdb.connect(database="my_jaffle.duckdb", read_only=False)
    names, paths = get_csv_names_and_paths()

    [create_table_from_csv(conn, name, path) for name, path in zip(names, paths)]


if __name__ == "__main__":
    main()
