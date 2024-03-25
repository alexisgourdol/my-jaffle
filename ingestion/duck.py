def create_table_from_csv(duckdb_con, table_name: str, csv_file: str):
    duckdb_con.sql(
        f"""
        FROM read_csv_auto('{csv_file}');
        """
    )


"""
        CREATE TABLE {table_name} AS
            SELECT *
            FROM read_csv({csv_file});
        """
