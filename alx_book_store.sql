#!/usr/bin/env python3
import mysql.connector
from mysql.connector import Error

def main():
    connection = None
    cursor = None

    try:
        # Connect to MySQL server
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password=""   # <-- put your MySQL root password if needed
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # Create database (NO SELECT or SHOW)
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print("Error while connecting to MySQL:", e)

    finally:
        if cursor is not None:
            cursor.close()
        if connection is not None and connection.is_connected():
            connection.close()

if __name__ == "__main__":
    main()
