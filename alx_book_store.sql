#!/usr/bin/env python3
"""
MySQLServer.py
Creates the database alx_book_store in your MySQL server.
"""

import mysql.connector
from mysql.connector import Error

def main():
    try:
        # Connect to the MySQL server
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password=""   # ← Replace with your MySQL root password if needed
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # Create database without using SELECT or SHOW
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print("Error while connecting to MySQL:", e)

    finally:
        try:
            if cursor:
                cursor.close()
            if connection.is_connected():
                connection.close()
        except:
            pass


if __name__ == "__main__":
    main()
