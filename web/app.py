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
    return render_template('index.html')
@app.route('/indexCriar/')
def indexCriar():
    return render_template('indexCriar.html')
@app.route('/indexListar/')
def indexListar():
    return render_template('indexListar.html')

# ...
# isto aqui é o path depois do link
@app.route('/criarCategoria/', methods=('GET', 'POST'))
def criarCategoria():
    if request.method == 'POST':
        nome = request.form['nome']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('INSERT INTO categoria '
                    'VALUES (%s)',
                    (nome,))
        conn.commit()
        cur.close()
        conn.close()
        return redirect(url_for('listarCategoria'))

    return render_template('criarCategoria.html')

@app.route('/criarSuperCategoria/', methods=('GET', 'POST'))
def criarSuperCategoria():
    if request.method == 'POST':
        nome = request.form['nome']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('INSERT INTO super_categoria '
                    'VALUES (%s)',
                    (nome,))
        conn.commit()
        cur.close()
        conn.close()
        return redirect(url_for('listarSuperCategoria'))

    return render_template('criarSuperCategoria.html')

@app.route('/criarCategoriaSimples/', methods=('GET', 'POST'))
def criarCategoriaSimples():
    if request.method == 'POST':
        nome = request.form['nome']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('INSERT INTO categoria_simples '
                    'VALUES (%s)',
                    (nome,))
        conn.commit()
        cur.close()
        conn.close()
        return redirect(url_for('listarCategoriaSimples'))

    return render_template('criarCategoriaSimples.html')

@app.route('/listarCategoria/')
def listarCategoria():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM categoria;')
    categoria = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('listarCategoria.html', categoria=categoria)


@app.route('/listarSuperCategoria/')
def listarSuperCategoria():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM super_categoria;')
    superCategoria = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('listarSuperCategoria.html', superCategoria=superCategoria)

@app.route('/listarCategoriaSimples/')
def listarCategoriaSimples():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute('SELECT * FROM categoria_simples;')
    categoriaSimples = cur.fetchall()
    cur.close()
    conn.close()
    return render_template('listarCategoriaSimples.html', categoriaSimples=categoriaSimples)

@app.route('/criarRetalhista/', methods=('GET', 'POST'))
def criarRetalhista():
    if request.method == 'POST':
        tin = int(request.form['TIN'])
        nome = request.form['nome']
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute('INSERT INTO retalhista '
                    'VALUES (%s, %s)',
                    (tin, nome))
        conn.commit()
        cur.close()
        conn.close()
        return redirect(url_for('listarCategoriaSimples'))

    return render_template('criarRetalhista.html')

@app.route('/listarIVMForm')
def listarIVMForm():
        return render_template("listarIVMForm.html", params=request.args)

@app.route('/listarEventoReposicaoporIVM', methods =["POST"])
def listarEventoReposicaoporIVM():
    conn = None
    cursor = None
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        query = "SELECT num_serie, fabricante, ean, nro, instante, unidades, nome " \
                "FROM evento_reposicao NATURAL JOIN prateleira" \
                " WHERE num_serie = (%s)" \
                "GROUP BY num_serie, fabricante, ean, nro, instante, nome;"
        data = (request.form["num_serie"],)
        cursor.execute(query, data)
        return render_template("listarEventoReposicaoporIVM.html", cursor=cursor)
    except Exception as e:
        return str(e) #Renders a page with the error.
    finally:
        cursor.close()
        conn.close()

@app.route('/listarSubCategoriasForm')
def listarSubCategoriasForm():
    return render_template("listarSubCategoriasForm.html", params=request.args)

@app.route('/listarSubCategorias', methods =["POST"])
def listarSubCategorias():
    conn = None
    cursor = None
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        cursor = conn.cursor()
        query = "SELECT categoria FROM " \
                "tem_outra " \
                "WHERE super_categoria = %s"
        data = (request.form["super_categoria"],)
        cursor.execute(query, data)
        return render_template("listarSubCategorias.html", cursor=cursor)
    except Exception as e:
        return str(e) #Renders a page with the error.
    finally:
        cursor.close()
        conn.close()