#!/usr/bin/env python3
"""
MySQLServer.py
Creates the database `alx_book_store` on the local MySQL server.

Requirements:
- Do NOT use SELECT or SHOW
- Print "Database 'alx_book_store' created successfully!" on success
- Print error message on connection failure
- Properly open and close DB connection
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Update host/user/password if needed
        conn = mysql.connector.connect(
            host="localhost",
            user="root",
            password=""   # <- replace with your root password if required
        )

        if conn.is_connected():
            cursor = conn.cursor()
            # Create database if not exists (no SELECT/SHOW used)
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            # Optional: ensure changes are flushed (not required for CREATE DATABASE)
            # Print success message as required
            print("Database 'alx_book_store' created successfully!")
    except Error as e:
        print("Error while connecting to MySQL:", e)
    finally:
        try:
            if 'cursor' in locals():
                cursor.close()
            if 'conn' in locals() and conn.is_connected():
                conn.close()
        except Exception:
            pass

if __name__ == "__main__":
    create_database()
