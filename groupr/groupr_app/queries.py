from __future__ import unicode_literals
from django.db import connection

TABLE_FIELDS = {	"Available" : ['netId', 'day', 'start', 'end'],
					"Groups" : ['id', 'name', 'numberOfMembers', 'projectId'],
					"Idea" : ['netId', 'projectId'],
					"Instructor" : ['name', 'className'],
					"Languages" : ['name'],
					"LanguagesDesired" : ['languageName', 'netId', 'proficiency'],
					"LanguagesKnown" : ['languageName', 'netId', 'proficiency'],
					"PartOf" : ['groupId', 'netId'],
					"Preferred" : ['netId', 'day', 'start', 'end'],
					"Project" : ['projectId', 'groupId', 'summary', 'name'],
					"Skills" : ['name'],
					"SkillsDesired" : ['netId', 'skillName'],
					"SkillsKnown" : ['netId', 'skillName'],
					"Student" : ['netId', 'name', 'bio', 'major', 'yearInSchool'],
					"Suggested" : ['groupId', 'netId'],
					"Teaches" : ['netId', 'instructorName'],
					"Times" : ['day', 'start', 'end']
				}


def insert_query(table, values):
	field_string = ""
	value_string = ""
	for field in sorted(values):
		value = values[field]
		if field not in TABLE_FIELDS[table]:
			return None
		field_string = field_string + field + ", "
		if isinstance(value, str):
			value = "\"" + value + "\""
		else:
			value = str(value)
		value_string = value_string + value + ", "
	field_string = field_string[:-2]
	value_string = value_string[:-2]
	query = "insert ignore into {0}({1}) values ({2})".format(table, field_string, value_string)
	# insert_query("Student", {"netid": "ncwells2", "name": "niki"})
	# table -> "Student"
	# field_string -> "netid, name"
	# value_string -> "ncwells2, niki"
	# "insert into Student(netid, name) values ncwells2, niki"
	return query

def update_query(table, fields, conditions):
	fields_newvals_string = ""
	for field in sorted(fields):
		value = fields[field]
		if field not in TABLE_FIELDS[table]:
			return None
		if isinstance(value, str):
			value = "\"" + value + "\""
		else:
			value = str(value)
		fields_newvals_string = fields_newvals_string + field + "=" + value + ", "
	fields_newvals_string = fields_newvals_string[:-2]
	where_conditions = ""
	if conditions:
		where_conditions = " where " + conditions

	query = "update {0} set {1}{2}".format(table, fields_newvals_string, where_conditions)

	return query

def delete_query(table, conditions):
	where_conditions = ""
	if conditions:
		where_conditions = " where " + conditions
	query = "delete from {0}{1}".format(table, where_conditions)
	return query

def select_query(tables, fields, conditions):
	if tables == []:
		return None
	table_string = ''
	for table in tables:
		table_string = table_string + table + ", "
	table_string = table_string[:-2]

	if fields:
		field_string = ''
		for field in fields:
			field_string = field_string + field + ", "
		field_string = field_string[:-2]
	else:
		field_string = '*'
	
	where_conditions = ""
	if conditions:
		where_conditions = " where " + conditions

	query = "select {0} from {1}{2}".format(field_string, table_string, where_conditions)
	return query


def insert(table, values):
	query = insert_query(table, values)
	print(query)
	if query is None:
		return 
	cursor = connection.cursor()
	cursor.execute(query)

def update(table, fields, conditions):
	query = update_query(table, fields, conditions)
	if query is None:
		return
	cursor = connection.cursor()
	cursor.execute(query)

def delete(table, conditions):
	query = delete_query(table, conditions)
	cursor = connection.cursor()
	cursor.execute(query)

def select(tables, fields, conditions):
	query = select_query(tables, fields, conditions)
	if query is None:
		return
	#print(query)
	cursor = connection.cursor()
	cursor.execute(query)

	columns = [col[0] for col in cursor.description]
	return [
    	dict(zip(columns, row))
		for row in cursor.fetchall()
	]