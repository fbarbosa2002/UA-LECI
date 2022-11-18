import logging
import sys
import sqlite3
from functools import wraps
import flask
from flask import Flask, render_template, redirect, url_for, request, session

app = Flask(__name__)
app.secret_key = "secret"

def login_required(f):
    """
    Decorate routes to require login.

    http://flask.pocoo.org/docs/1.0/patterns/viewdecorators/
    """
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if session.get("user_id") is None:
            return redirect("/login")
        return f(*args, **kwargs)
    return decorated_function

def query_sql():
    with sqlite3.connect("healthCorp.db") as con:
                cur = con.cursor()
                
    return cur, con

def getusers(search):
    cursor, conn = query_sql()
    cursor.execute(
    "SELECT name, specialty, license FROM doctors WHERE name LIKE ? OR specialty LIKE ? OR license LIKE ?",
    ("%"+search+"%", "%"+search+"%","%"+search+"%",)
    )

    results = cursor.fetchall()
    conn.close()
    return results

def escape(s):
        """
        Escape special characters.

        https://github.com/jacebrowning/memegen#special-characters
        """
        for old, new in [("-", "--"), (" ", "-"), ("_", "__"), ("?", "~q"),
                        ("%", "~p"), ("#", "~h"), ("/", "~s"), ("\"", "''")]:
            s = s.replace(old, new)
        return s

@app.errorhandler(500)
def internal_error(error):
    return render_template("error.html", top=500, bottom=escape("Error")), 500
    #return render_template('error.html'),500

@app.errorhandler(404)
def internal_error(error):
    return render_template("error.html", top=404, bottom=escape("Error")), 404


@app.route('/', methods = ["GET", "POST"])
def home():
    cur, con = query_sql()
    cur.execute("SELECT name, opinion FROM opinions")
    opinions_list = cur.fetchall()
    print(opinions_list)
    print(type(opinions_list))
    print(type(opinions_list[0]))

    if request.method == "GET":
        return render_template('index.html', opinions_list = opinions_list, safe=True)
    else: 
        name = request.form.get("name")
        opinion = request.form.get("message")
        print(name)
        print(opinion)
        cur.execute("INSERT INTO opinions (name, opinion) VALUES (?,?)", (name,opinion))
        con.commit()
        # MUDAR PARA #OPINION
        return redirect('/#contact')


@app.route('/welcome', methods=['GET', 'POST'])
@login_required
def homeLogin():
    cur, con = query_sql()
    cur.execute("SELECT name FROM login WHERE id = ?",(session["user_id"],))
    name = cur.fetchall()[0]
    cur.execute("SELECT name, opinion FROM opinions")
    opinions_list = cur.fetchall()
    
    if request.method == "GET":
        return render_template("homeLogin.html", name = name[0], opinions_list = opinions_list, safe=True)
    else:
        name = request.form.get("name")
        opinion = request.form.get("message")
        print(name)
        print(opinion)
        cur.execute("INSERT INTO opinions (name, opinion) VALUES (?,?)", (name,opinion))
        con.commit()
        #MUDAR PARA #opinion
        return redirect('/welcome#contact')


@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    session.clear()

    if request.method == 'POST':

        print("Entrou " + request.form.get('username') == "")
        print(type(request.form.get('username')))

        user = request.form.get('username')
        key = request.form.get('password')
        print(user)
        print(key)
        cur, con = query_sql()
        cur.execute('SELECT * FROM login WHERE username = ? AND password = ?;', (user,key))
        query_result = cur.fetchall()
        print(len(query_result))
        print(query_result)

        if len(query_result) > 0:
            result = query_result[0]
            session["user_id"] = result[0]
            user = result[1]
            key = result[2]
            return redirect("/welcome")
        else:
            error = 'Invalid Credentials. Please try again.'
            return render_template('login.html', error = error)
    else:    
        return render_template('login.html')

@app.route("/logout")
def logout():
    """Log user out"""

    # Forget any user_id
    session.clear()

    # Redirect user to login form
    return redirect("/")


@app.route("/register", methods=["GET","POST"])
def register():
    error = None
    if request.method == "GET":
        return render_template("register.html")
    else:
        user = request.form.get("username")
        password = request.form.get("password")
        name = request.form.get("name")
        print(user)
        print(password)
        if not user or not password:
            error = "You must provide a username/password"
            return render_template("register.html", error=error)
        else:
            cur, con = query_sql()
            cur.execute("SELECT username, password FROM login WHERE username = ?", (user,))
            result = cur.fetchall()
            print(result)
            if len(result) > 0:
                error = "Username already exists"
                return render_template("register.html", error=error)
            else:
                cur.execute("INSERT INTO login (username, password, name) VALUES (?,?, ?)", (user, password, name))
                con.commit()
        return redirect("/login")

@app.route("/changepass", methods = ["GET","POST"])
@login_required
def changepass():
    error = None
    if request.method == "GET":
        return render_template("changepass.html",safe=True)
    else:
        user = request.form.get("username")
        current_pass = request.form.get("current_password")
        new_pass = request.form.get("new_password")
        repeat_new_pass = request.form.get("repeat_new_password")

        #print(user)
        #print(new_pass)
        cur,con = query_sql()
        cur.execute("SELECT username FROM login WHERE id = ?",(session["user_id"],))
        username = cur.fetchall()[0]
    
        cur.execute("SELECT password from login WHERE id = ?",(session["user_id"],))
        password = cur.fetchall()[0]
        print(password[0])
        print(current_pass)
        
        if user != username[0]:
            error = "Username does not match"
            return render_template("changepass.html",safe=True,error = error)
        elif current_pass != password[0]:
            error = "Current password does not match"
            return render_template("changepass.html",safe=True,error=error)
        elif (new_pass != repeat_new_pass):
            error = "Passwords not equals"
            return render_template("changepass.html",safe = True,error = error)
        else:
            cur.execute(f'UPDATE login set password = "{new_pass}" WHERE username = "{user}";' )
            con.commit()
        return redirect("/login")
     
@app.route('/appointments', methods=["GET","POST"])
@login_required
def appointments():
    cur, con = query_sql()
    cur.execute("SELECT DISTINCT specialty FROM doctors")
    result = cur.fetchall()
    print(result)
    print(result[0])
    if request.method == "GET":
        
        return render_template("consulta.html", specialties = result, safe = True)
    else:
        name = request.form.get("name")
        specialty = request.form.get("picklist")
        date = request.form.get("date")
        time = request.form.get("time_appointment")
        print(name)
        print(specialty)
        print(date)
        print(time)
        print("#### " + str(session["user_id"]))
        cur.execute("INSERT INTO appointments (pacient_id,specialty, date, time, name) VALUES (?,?,?,?,?)", (int(session["user_id"]),specialty, date, time, name))
        con.commit()
        return redirect('/welcome')

@app.route("/myappointments", methods=["GET","POST"])
@login_required
def my_appointments():
    cur, con = query_sql()
    cur.execute("SELECT name, specialty, date, time FROM appointments WHERE pacient_id = ?", (session["user_id"],))
    appointments_list = cur.fetchall()

    if request.method == "GET":
        return render_template("listAppointments.html", appointments_list=appointments_list)
    else:
        search = request.form.get("searchAppointments")
        cur.execute("SELECT name, specialty, date, time FROM appointments WHERE name LIKE ? OR specialty LIKE ? OR date LIKE ?",
        ("%"+search+"%", "%"+search+"%","%"+search+"%",))
        search_appointments = cur.fetchall()
        if search_appointments:
            return render_template("listAppointments.html", appointments_list = search_appointments)
        else:
            return render_template("listAppointments.html", appointments_list = appointments_list)

    
@app.route('/doctors', methods=["GET", "POST"])
@login_required
def doctors():
    cur, con = query_sql()
    cur.execute("SELECT name, specialty, license FROM doctors")
    result = cur.fetchall()
    if request.method == "GET":
        print("##### " +  str(result))
        doctor = result[0]
        return render_template("doctors.html", doctor_list = result)
    else:
        search_result = getusers(request.form.get("searchDoctors"))
        if search_result:
            return render_template("doctors.html", doctor_list = search_result)
        else:
            return render_template("doctors.html", doctor_list = result)

'''@app.route('/opinions', methods=["GET","POST"])
def opinions():
    cur, con = query_sql()
    if request.method == "GET":
        return render_template("critics.html")
    else:
        name = request.form.get("name")
        opinion = request.form.get("message")
        print(name)
        print(opinion)
        cur.execute("INSERT INTO opinions (name, opinion) VALUES (?,?)", (name,opinion))
        con.commit()
        return redirect("/opinions")
        
'''

# (B) HELPER FUNCTION - SEARCH USERS

        
if __name__ == '__main__':
    app.run(debug=True)
