import os
import psycopg2
from flask import Flask, render_template, request, url_for, redirect

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(host='db.tecnico.ulisboa.pt',
                            database='ist196915',  # para testar mudar para a database que queremos
                            user=os.environ['DB_USERNAME'],
                            password=os.environ['DB_PASSWORD'])
                            # no terminal fazer export destas variaveis
    return conn


@app.route('/')
def index():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM category;')
    category = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('index.html', category=category)

# ...
# isto aqui é o path depois do link
@app.route('/createCategory/', methods=('GET', 'POST'))
def createCategory():
    if request.method == 'POST':
        name = request.form['name']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('INSERT INTO category '
                    'VALUES (%s)',
                    (name,))
        conn.commit()
        cur.close()
        conn.close()
        return redirect(url_for('listCategory'))

    return render_template('createCategory.html')

@app.route('/createSuperCategory/', methods=('GET', 'POST'))
def createSuperCategory():
    if request.method == 'POST':
        name = request.form['name']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('INSERT INTO supercategory '
                    'VALUES (%s)',
                    (name,))
        conn.commit()
        cur.close()
        conn.close()
        return redirect(url_for('listSuperCategory'))

    return render_template('createSuperCategory.html')
@app.route('/listCategory/')
def listCategory():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM category;')
    category = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('listCategory.html', category=category)


@app.route('/listSuperCategory/')
def listSuperCategory():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM supercategory;')
    supercategory = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('listSuperCategory.html', supercategory=supercategory)