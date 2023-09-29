#!/usr/bin/python3
from wsgiref.handlers import CGIHandler
from flask import Flask
from flask import render_template, request
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
def home():
    try:
        return render_template("index.html")
    except Exception as e:
        return str(e)

CGIHandler().run(app)
