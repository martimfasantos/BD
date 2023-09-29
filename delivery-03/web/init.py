import os
import psycopg2

conn = psycopg2.connect(
    host="db.tecnico.ulisboa.pt",
    database="ist196915",
    user=os.environ['DB_USERNAME'],
    password=os.environ['DB_PASSWORD'])
    # fazer export do username e password se não der

# Open a cursor to perform database operations
cur = conn.cursor()

cur.execute('DROP TABLE IF EXISTS category;')
cur.execute('CREATE TABLE category'
            '(name VARCHAR(20), PRIMARY KEY (name))')
cur.execute('CREATE TABLE superCategory'
            '(name VARCHAR(20), PRIMARY KEY (name), FOREIGN KEY (name) REFERENCES category(name))')
cur.execute('CREATE TABLE simpleCategory'
            '(name VARCHAR(20), PRIMARY KEY (name))')

conn.commit()

cur.close()
conn.close()