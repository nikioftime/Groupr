# Groupr
#### CS411 final project - easy group matching

## Useful links:
* [git workflow](https://docs.google.com/document/d/14Dy3dTJWDF3_saZkX7fySNcVUfbe9rOU22Wvd5WpnTQ/edit?usp=sharing)
* [Django docs](https://docs.djangoproject.com/en/1.9/)
* [groupr on the web](http://45.55.155.130:8000/groupr/) (if this is ever down when you check it, please let me know)

## Getting Started
* [Install Python 3](https://docs.python.org/3.5/using/index.html) (if you haven't already)! Python 2 won't work with this project.
* [Install Django!](https://docs.djangoproject.com/en/1.9/intro/install/)
* [Install MySQL](http://dev.mysql.com/doc/refman/5.7/en/installing.html) if your machine doesn't already have it!
* [Install MySQLClient!](https://pypi.python.org/pypi/mysqlclient) (This is a Python 3-compatible python interface that Django will use to mess with the database)

## Build and Run on Your Machine
1. Clone the repo to your machine!
2. `cd` into the Groupr/groupr directory (the one that contains `db.sql` and `manage.py`)
3. To build the database on your machine
	* start up `mysql` by calling `mysql -u root` in the terminal and enter password if necessary
	* run the command `source build_db.sql;`, which if successful will display all of the tables in the db
	* use the commany `quit;` to leave the `mysql` shell
4. If you ever change the database schema
	* run the command `mysqldump -u root grouprsp_cs411 > db.sql`
	* commit changes to the repo
	* give everyone a quick heads up
5. To update database with the new schema once it has been pushed and merged into master
	* make sure you're in the same directory as `db.sql`
	* start up `mysql` again
	* run the following commands:
		* `use grouprsp_cs411;`
		* `source db.sql;`
	* `quit;` when you're done
6. To run the server:
	* make sure you're in the same directory as `manage.py`
	* run the command `python3 manage.py`
	* the webpage should be served at http://127.0.0.1:8000/groupr/
If anything goes at all wrong or any errors get thrown with any of these steps, _let me know_ and I'll work with you to get you set up :+1:

## Deploy on the web
There's a little bit of weird stuff involved in this so I'm more that willing to update the version on the web as soon as I can after you guys let me know that you've pushed a change into master. If that becomes cumbersome or if you guys want to do it yourselves, I'd be more than willing to write it up real fast. Either way is totally alright with me, just let me know if any of you want to deploy on the website.

## Project Structure
### Programming stuff
Everything important is in `Groupr/groupr/groupr_app`
* `forms.py` is where all the form-generating classes live. See the Django Form docs for more info ([overview is here](https://docs.djangoproject.com/en/1.9/topics/forms/) and the [api is here](https://docs.djangoproject.com/en/1.9/ref/forms/api/))
* `models.py` has nothing in it because we're working with raw SQL commands. Please ignore this file.
* `queries.py` currently builds and executes basic SQL commands, and should ideally expand to handle all the queries we'd need. Currently, it has:
	* `TABLE_FIELDS` - a dictionary representing the attributes on each table in the database
	* `insert(table, values)` which takes dictionary of `attribute: value` pairs as `values` and inserts them into the table represented by the string `table`
		* currently does not check if an item is already in the database which is probably why we were getting some of the errors that we were getting in the demo
	* `update(table, fields, conditions)` which takes a dictionary of `attribute: value` pairs as `fields`, a string `conditions` representing what comes after the `WHERE` in the `UPDATE SET WHERE` command, and a string `table` representing the Table in which the update will occur
		* if `conditions` is an empty string(`''`), then the `WHERE` clause is dropped
	* `delete(table, conditions)` which takes a string `table` representing what table, and `conditions`, again a string that will constitute the `WHERE` clause
		* if `conditions` is an empty string(`''`), then the `WHERE` clause is dropped
	* `select(tables, fields, conditions)` which takes a list of strings representing the tables to put in the `FROM` clause as `tables`, a list of attributes for the `SELECT` clause as `fields`, and `conditions`, again a string that will constitute the `WHERE` clause
		* if `fields` is an empty list (`[]`), then the `SELECT` clause becomes `SELECT *`
		* if `conditions` is an empty string(`''`), then the `WHERE` clause is dropped
* `tests.py` which has some currently broken tests that test query building stuff right now.
	* if you want to write any tests (you don't have to if you don't want to) check out [Django's testing docs](https://docs.djangoproject.com/en/1.9/topics/testing/)
* `urls.py` contains the project's [url patterns](https://docs.djangoproject.com/en/1.9/topics/http/urls/)
* `views.py` contains the project's [views](https://docs.djangoproject.com/en/1.9/topics/http/views/) & [class-based views](https://docs.djangoproject.com/en/1.9/topics/class-based-views/)
	* **KNOWN ISSUES**
		* I should change these so that we're only using one type of view
		* `insert_student` and `update_student` are SUPER gross looking and long and need to be made way more modular than they are :weary:
You can ignore all the other files in this directory.

### Margarita/front-facing web stuff
* `templates/groupr_app` contains all the templates you're going to need
	* [templates on Django](https://docs.djangoproject.com/en/1.9/#the-template-layer) 
	* [form template stuff starts here](https://docs.djangoproject.com/en/1.9/topics/forms/#working-with-form-templates) and continues to the bottom of the page
* `static/groupr_app/` is where you should store your static files including your css
	* to include a css file in a template, put this at the top of the template, replacing `style.css` as needed:
		```html
		{% load staticfiles %}

		<link rel="stylesheet" type="text/css" href="{% static 'groupr_app/style.css' %}" />
		```
	* `static/groupr_app/images/` is where images should be if you need 'em
		* to include images in templates, be sure to `{% load staticfiles %}` at the top of the file and just set `<img src="{% static "groupr_app/images/example.jpg" %}>"` where you need them
		* to include images in static files like css templates, `url("images/example.jpg")` will work great

### Something unclear?
If something that I've said above is unclear or something in the code is at all confusing (I'm 99% sure something will be) or something just doesn't work, _**PLEASE**_ let me know via Facebook and I'll take care of it/explain it as soon as possible.
