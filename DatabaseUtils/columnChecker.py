import pandas as pd
import MySQLdb
from SqlConnector import connect

def check_null_columns_in_all_tables():
    """
    Check if there are any columns that are completely NULL in every table in the database.
    """

    connection = connect()  # Connect to the database
    if connection is None:
        print("Failed to connect to the database.")
        return

    cursor = connection.cursor()

    # Fetch all table names in the database
    cursor.execute("SHOW TABLES")
    tables = cursor.fetchall()

    for table in tables:
        table_name = table[0]
        print(f"\nChecking table: {table_name}")

        # Query to fetch all columns and data from the current table
        query = f"SELECT * FROM {table_name} LIMIT 1"
        df = pd.read_sql(query, connection)

        # Prepare a query to check if all values in each column are NULL
        query = f"""
            SELECT COLUMN_NAME
            FROM INFORMATION_SCHEMA.COLUMNS
            WHERE TABLE_SCHEMA = 'powerdata' AND TABLE_NAME = '{table_name}';
        """

        columns = pd.read_sql(query, connection)['COLUMN_NAME'].tolist()

        # For each column, check if the count of NULL values is equal to the total count of rows
        null_columns = []
        for column in columns:
            query = f"SELECT COUNT(*) FROM {table_name} WHERE {column} IS NOT NULL"
            result = pd.read_sql(query, connection)

            if result.iloc[0, 0] == 0:
                null_columns.append(column)

        # Report columns that are completely NULL
        if null_columns:
            print(f"Completely NULL columns in {table_name}: {null_columns}")
        else:
            print(f"No completely NULL columns found in {table_name}.")

    cursor.close()
    connection.close()


if __name__ == "__main__":
    check_null_columns_in_all_tables()
