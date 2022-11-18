import sqlite3
from datetime import date,datetime

def query_sql():
    with sqlite3.connect("healthCorp.db") as con:
                cur = con.cursor()
                
    return cur, con

def main():
    username = 'sio'
    password = 'admin'
    cur, con = query_sql()
    cur.execute('SELECT username, password FROM login WHERE username = ?', (username,)

    print(user + "  " + key)
    '''pacient = 1
    doctor = 1
    specialty = "general"
    today = date.today().isoformat()
    print(today)
    print(type(today))
    now = datetime.now()
    current_time = now.strftime(("%H:%M:%S"))
    print(now)
    print("current time "  + current_time)
    print(type(current_time))
    cur.execute("INSERT INTO appointments (pacient_id, doctor_id, specialty, date, time) VALUES (?,?,?,?,?)",(pacient,doctor,specialty,today,current_time))
    con.commit()'''
    #result_query = query_sql(result)
    #print(result_query)

    #aux = getusers("Filipe")
    #print(aux)

def getusers(search):
  cursor, conn = query_sql()
  cursor.execute(
    "SELECT * FROM `doctors` WHERE `name` LIKE ? OR `specialty` LIKE ? OR `license` LIKE ?",
    ("%"+search+"%", "%"+search+"%","%"+search+"%",))
  
  results = cursor.fetchall()
  conn.close()
  return results


if __name__ == '__main__':
    main()