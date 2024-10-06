import mysql.connector
from mysql.connector import Error

def connect():
    """Establish and return a connection to the MySQL database using mysql-connector."""
    try:
        connection = mysql.connector.connect(
            host='127.0.0.1',  # Localhost
            port=3306,  # Default MySQL port
            user='root',  # MySQL root user
            password='powerdata',  # Your MySQL password
            database='powerdata'  # Select 'powerdata' database
        )
        if connection.is_connected():
            print("Successfully connected to the MySQL database 'powerdata'.")
            return connection
    except Error as e:
        print(f"Error connecting to the MySQL database: {e}")
        return None

def execute_query_from_file(connection, sql_file_path, parameters=None):
    """Executes a query from a given SQL file with optional parameters."""
    try:
        # Read the query from the .sql file
        with open(sql_file_path, 'r') as file:
            query = file.read()
        
        cursor = connection.cursor()
        if parameters:
            cursor.execute(query, parameters)  # If parameters are provided, use them in the query
        else:
            cursor.execute(query)  # Execute the query without parameters if not provided
        connection.commit()  # Commit the transaction
        cursor.close()
        print(f"Query executed successfully from {sql_file_path}")
    except Error as e:
        print(f"Error executing query from {sql_file_path}: {e}")
