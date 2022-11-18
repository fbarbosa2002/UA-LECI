## Description
Our project consists in a website about a clinic company. The user can register and login. <br>
Then can make an appointment, inserting your own name, the medical consultation's date and time and the type of the consultation.<br>
Searching on bar is one of the funcionalities of the website. The user just have to input the type of consultation or the name of the doctor and click on search to search for specific content. Can search all the doctors of the company in your section doctors<br>
After the realization of a exam, the user can download a file about it. <br> 
The user still have the possibility of regist your opinion on your opinion section. The user inserts the title and the text of your opinion.

## Vulnerabilities

[CWE-20](https://cwe.mitre.org/data/definitions/20.html)
[CWE-79](https://cwe.mitre.org/data/definitions/79.html)
[CWE-89](https://cwe.mitre.org/data/definitions/89.html)
[CWE-256](https://cwe.mitre.org/data/definitions/256.html)
[CWE-620](https://cwe.mitre.org/data/definitions/620.html)
[CWE-756](https://cwe.mitre.org/data/definitions/756.html)

## How to run

1. Install the requirements
 ```bash
 pip install sqlite3
 pip install Flask
 pip install Jinja2
 ```
2. Run the secure app or the insecure app
```bash
python3 app_sec.py
```
or 
```bash
python3 app.py
```
## Authors
[Bruno Lins] - 101077 <br>
[Filipe Barbosa] - 103064 <br>
[Miguel Gomes] - 103826 <br>
[Pedro Durval] - 103173 <br>