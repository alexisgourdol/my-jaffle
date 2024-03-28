from loguru import logger


def create_table_from_csv(duckdb_con, table_name: str, csv_file: str):
    logger.info(f"Creating table {table_name} from '{csv_file}'")

    sql = f"""
        DROP TABLE IF EXISTS {table_name};
        CREATE TABLE {table_name} AS
            SELECT *
            FROM read_csv('{csv_file}', AUTO_DETECT=TRUE);
        """

    logger.info(sql)
    duckdb_con.sql(sql)

    logger.info(f"Checking all rows in the new table {table_name}")
    duckdb_con.sql(f"""FROM {table_name};""").show()
