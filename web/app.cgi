#!/usr/bin/python3
from wsgiref.handlers import CGIHandler
from flask import Flask
from flask import render_template, request, redirect
import psycopg2
import psycopg2.extras



## SGBD configs
DB_HOST="db.tecnico.ulisboa.pt"
DB_USER="ist196915"
DB_DATABASE=DB_USER
DB_PASSWORD="bdpassword"
DB_CONNECTION_STRING = "host=%s dbname=%s user=%s password=%s" % (DB_HOST, DB_DATABASE, DB_USER, DB_PASSWORD)

app = Flask(__name__)
@app.route('/')
def index():
    try:
        return render_template("index.html")
    except Exception as e:
        return str(e)

@app.route('/indexCriar/')
def indexCriar():
    try:
        return render_template("indexCriar.html")
    except Exception as e:
        return str(e)
@app.route('/indexListar/')
def indexListar():
    return render_template("indexListar.html")

@app.route('/criarCategoria/', methods=("GET", "POST"))
def criarCategoria():
    try:
        if request.method == 'POST':
            dbConn = psycopg2.connect(DB_CONNECTION_STRING)
            cur = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
            nome_cat = request.form['nome_cat']
            tipo_cat = request.form['tipo_cat']
            if tipo_cat == "simples":
                query = "START TRANSACTION; " \
                        "INSERT INTO categoria " \
                        "VALUES (%s);" \
                        "INSERT INTO categoria_simples " \
                        "VALUES (%s);" \
                        "COMMIT; "
            elif tipo_cat == "super":
                query = "START TRANSACTION; " \
                        "INSERT INTO categoria " \
                        "VALUES (%s);" \
                        "INSERT INTO super_categoria " \
                        "VALUES (%s);" \
                        "COMMIT; "
            cur.execute(query, (nome_cat, nome_cat))
            dbConn.commit()
            cur.close()
            dbConn.close()
            return redirect("listarCategoria")
        return render_template("criarCategoria.html")
    except Exception as e:
        return str(e)

@app.route('/criarSuperCategoria/', methods=('GET', 'POST'))
def criarSuperCategoria():
    try:
        if request.method == 'POST':
            nome_cat = request.form['nome_cat']

            dbConn = psycopg2.connect(DB_CONNECTION_STRING)
            cur = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
            cur.execute('INSERT INTO super_categoria '
                        'VALUES (%s)',
                        (nome_cat,))
            dbConn.commit()
            cur.close()
            dbConn.close()
            return redirect('/listarSuperCategoria')

        return render_template("criarSuperCategoria.html")
    except Exception as e:
        return str(e)

@app.route('/criarCategoriaSimples/', methods=('GET', 'POST'))
def criarCategoriaSimples():
    try:
        if request.method == 'POST':
            nome_cat = request.form['nome_cat']

            dbConn = psycopg2.connect(DB_CONNECTION_STRING)
            cur = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
            cur.execute('INSERT INTO categoria_simples '
                        'VALUES (%s)',
                        (nome_cat,))
            dbConn.commit()
            cur.close()
            dbConn.close()
            return redirect("listarCategoriaSimples")

        return render_template("criarCategoriaSimples.html")
    except Exception as e:
        return str(e)

@app.route('/listarCategoria/')
def listarCategoria():
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cur = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur.execute('SELECT * FROM categoria;')
        categoria = cur.fetchall()
        cur.close()
        dbConn.close()
        return render_template("listarCategoria.html", categoria=categoria)
    except Exception as e:
        return str(e)

@app.route('/listarSuperCategoria/')
def listarSuperCategoria():
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cur = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
    cur.execute('SELECT * FROM super_categoria;')
    superCategoria = cur.fetchall()
    cur.close()
    dbConn.close()
    return render_template("listarSuperCategoria.html", superCategoria=superCategoria)

@app.route('/listarCategoriaSimples/')
def listarCategoriaSimples():
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cur = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        cur.execute('SELECT * FROM categoria_simples;')
        categoriaSimples = cur.fetchall()
        cur.close()
        dbConn.close()
        return render_template("listarCategoriaSimples.html", categoriaSimples=categoriaSimples)
    except Exception as e:
        return str(e)

@app.route('/criarRetalhista/', methods=('GET', 'POST'))
def criarRetalhista():
    try:
        if request.method == 'POST':
            tin = int(request.form['TIN'])
            nome_ret = request.form['nome_ret']
            dbConn = psycopg2.connect(DB_CONNECTION_STRING)
            cur = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
            cur.execute('INSERT INTO retalhista '
                        'VALUES (%s, %s)',
                        (tin, nome_ret))
            # perguntar se ele é responsavel_por alguma categoria numa ivm
            dbConn.commit()
            cur.close()
            dbConn.close()
            return redirect("")

        return render_template("criarRetalhista.html")
    except Exception as e:
        return str(e)

@app.route('/listarIVMForm')
def listarIVMForm():
    return render_template("listarIVMForm.html", params=request.args)

@app.route('/listarEventoReposicaoporIVM', methods =["POST"])
def listarEventoReposicaoporIVM():
        dbConn = None
        cursor = None
        cursor2 = None
        try:
            dbConn = psycopg2.connect(DB_CONNECTION_STRING)
            cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
            cursor2 = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
            query = "SELECT num_serie, fabricante, ean, nro, instante, unidades, nome_cat " \
                    "FROM evento_reposicao NATURAL JOIN prateleira" \
                    " WHERE num_serie = (%s)" \
                    "GROUP BY num_serie, fabricante, ean, nro, instante, nome_cat;"
            data = (request.form["num_serie"],)
            cursor.execute(query, data)
            query2 = "SELECT nome_cat, sum(unidades) as sum_unit " \
                     "FROM evento_reposicao NATURAL JOIN prateleira " \
                     "WHERE num_serie = (%s) " \
                     "GROUP BY nome_cat"
            data2 = (request.form["num_serie"],)
            cursor2.execute(query2, data2)
            return render_template("listarEventoReposicaoporIVM.html", cursor=cursor, cursor2=cursor2)
        except Exception as e:
            return str(e) #Renders a page with the error.
        finally:
            cursor.close()
            dbConn.close()


@app.route('/listarSubCategoriasForm')
def listarSubCategoriasForm():
    return render_template("listarSubCategoriasForm.html", params=request.args)

@app.route('/listarSubCategorias', methods =["POST"])
def listarSubCategorias():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)
        super_categoria = request.form["super_categoria"]

        query = "START TRANSACTION; " \
                "SELECT categoria " \
                "FROM tem_outra " \
                "WHERE super_categoria=(%s);"
        data  = (super_categoria,)
        cursor.execute(query, data)

        result = []
        list = []

        for row in cursor:
            result.append(row)
            list.append(row)

        while len(list) > 0:
            row = list[0]
            list = list[1:]

            query = "SELECT categoria " \
                    "FROM tem_outra " \
                    "WHERE super_categoria=(%s);"
            data  = (row[0],)
            cursor.execute(query, data)

            for _row in cursor:
                result.append(_row)
                result.append(_row)

        query = "COMMIT;"
        cursor.execute(query)

        return render_template("listarSubCategorias.html", cursor=result)
    except Exception as e:
        return str(e) #Renders a page with the error.
    finally:
        cursor.close()
        dbConn.close()

@app.route('/removerRetalhistaForm')
def removerRetalhistaForm():
    return render_template("removerRetalhistaForm.html", params=request.args)

@app.route('/removerRetalhista', methods =["POST"])
def removerRetalhista():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        query = "START TRANSACTION; " \
                "DELETE FROM evento_reposicao " \
                "WHERE tin = (%s);" \
                "DELETE FROM responsavel_por " \
                "WHERE tin = (%s);" \
                "DELETE FROM retalhista " \
                "WHERE tin = (%s);" \
                "COMMIT; "
        data = (request.form["tin"], request.form["tin"], request.form["tin"])
        cursor.execute(query, data)
        return render_template("index.html", cursor=cursor)
    except Exception as e:
        return str(e) #Renders a page with the error.
    finally:
        cursor.close()
        dbConn.close()

@app.route('/removerCategoriaForm')
def removerCategoriaForm():
    return render_template("removerCategoriaForm.html", params=request.args)

@app.route('/removerCategoria', methods =["POST"])
def removerCategoria():
    dbConn = None
    cursor = None
    try:
        dbConn = psycopg2.connect(DB_CONNECTION_STRING)
        cursor = dbConn.cursor(cursor_factory=psycopg2.extras.DictCursor)

        query = "START TRANSACTION; " \
                "DELETE FROM categoria_simples " \
                "WHERE nome_cat = (%s);" \
                "DELETE FROM super_categoria " \
                "WHERE nome_cat = (%s);" \
                "DELETE FROM categoria " \
                "WHERE nome_cat = (%s);" \
                "COMMIT; "
        data = (request.form["nome_cat"], request.form["nome_cat"], request.form["nome_cat"])
        cursor.execute(query, data)
        return render_template("index.html", cursor=cursor)
    except Exception as e:
        return str(e) #Renders a page with the error.
    finally:
        cursor.close()
        dbConn.close()


###########################

CGIHandler().run(app)
