import sys, os, math
sys.path.append('~/cs411/Groupr/groupr')
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'
from django.conf import settings
from operator import itemgetter
from django.db import connection

from .queries import select, insert

lang_des  = 'LanguagesDesired'
lang_know = 'LanguagesKnown'
count_lang_des  = 'countLanguagesDesired'
count_lang_know = 'countLanguagesKnown'
unsatisfied_groups_view = 'unsatisfiedGroups'
not_full_groups_view = 'notFullGroups'
group_langs_view = 'groupLangs'
student_langs_view = 'studentLangs'


min_students = 3
max_students = 4

def get_students():
	students = select(['Student'], ['netId'], '')
	# print(students)
	for student in students:
		student[lang_des] = set([language['languageName'] for language in 
			select([lang_des], ['languageName'], "netId=\'{}\'".format(student['netId']))])
		student[count_lang_des] = len(student[lang_des])
		student[lang_know] = set([language['languageName'] for language in 
			select([lang_know], ['languageName'], "netId=\'{}\'".format(student['netId']))])
		student[count_lang_know] = len(student[lang_know])
	# print(len(students))
	return students

def number_of_groups(num_students, min_students, max_students):
	num_students = num_students * 1.0
	return math.ceil(num_students / max_students)

def teardown_values():
	delete_groups = "delete from groups where name LIKE 'optimal%'"
	cursor = connection.cursor()
	cursor.execute(delete_groups)

	delete_optpartof = "delete from OptimalPartOf"
	cursor = connection.cursor()
	cursor.execute(delete_optpartof)

	query = "DROP VIEW IF EXISTS " + unsatisfied_groups_view
	cursor = connection.cursor()
	cursor.execute(query)

	query = "DROP VIEW IF EXISTS " + not_full_groups_view
	cursor = connection.cursor()
	cursor.execute(query)
	query = "DROP VIEW IF EXISTS " + group_langs_view
	cursor = connection.cursor()
	cursor.execute(query)
	query = "DROP VIEW IF EXISTS " + student_langs_view
	cursor = connection.cursor()
	cursor.execute(query)

def setup_views():
	unsat_view_query = "create or replace view " + unsatisfied_groups_view + " as select groupId from OptimalPartOf group by groupId having count(netId) < {}".format(min_students)
	cursor = connection.cursor()
	cursor.execute(unsat_view_query)

	not_full_view_query = "create or replace view " + not_full_groups_view + " as select groupId from OptimalPartOf group by groupId having count(netId) < {}".format(max_students)
	cursor = connection.cursor()
	cursor.execute(not_full_view_query)

	group_langs_view_query = "create or replace view " + group_langs_view + " as select languageName, groupId from LanguagesDesired INNER JOIN OptimalPartOf ON LanguagesDesired.netId = OptimalPartOf.netId"
	cursor = connection.cursor()
	cursor.execute(group_langs_view_query)

	student_langs_view_query = "create or replace view " + student_langs_view + " as select languageName, netId from LanguagesKnown"
	cursor = connection.cursor()
	cursor.execute(student_langs_view_query)

def unsatisfied_groups():
	groups = "select * from "+unsatisfied_groups_view
	cursor = connection.cursor()
	cursor.execute(groups)
	columns = [col[0] for col in cursor.description]
	return [
    	dict(zip(columns, row))
		for row in cursor.fetchall()
	]

def count_unsatisfied_groups():
	groups = "select count(*) as num from "+unsatisfied_groups_view
	cursor = connection.cursor()
	cursor.execute(groups)
	columns = [col[0] for col in cursor.description]
	ret = [
    	dict(zip(columns, row))
		for row in cursor.fetchall()
	]
	return ret[0]['num']

def not_full_groups():
	groups = "select * from "+not_full_groups_view
	cursor = connection.cursor()
	cursor.execute(groups)
	columns = [col[0] for col in cursor.description]
	return [
    	dict(zip(columns, row))
		for row in cursor.fetchall()
	]

def group_langs():
	langs = "select * from "+group_langs_view
	cursor = connection.cursor()
	cursor.execute(langs)
	columns = [col[0] for col in cursor.description]
	return [
    	dict(zip(columns, row))
		for row in cursor.fetchall()
	]

def lang_intersect(group_view, netId):
	lang_intersect = "select groupId, count(grop.languageName) as langs from (	select groupId, languageName from groupLangs where groupId in (select groupId from "+ group_view+")) as grop INNER JOIN (	select languageName from studentLangs where netId = '"+netId+"') as student ON grop.languageName=student.languageName group by groupId"
	cursor = connection.cursor()
	cursor.execute(lang_intersect)
	columns = [col[0] for col in cursor.description]
	return [
    	dict(zip(columns, row))
		for row in cursor.fetchall()
	]


def make_matches():
	teardown_values()
	setup_views()
	students = get_students()
	num_groups = number_of_groups(len(students), min_students, max_students)
	group_names = []
	group_ids = []

	students = sorted(students, key=itemgetter(count_lang_des))

	# initial assignment
	for i in range(num_groups):
		name = "optimal"+str(i)
		group_names.append(name)
		insert('Groups', {'name' : name, 'numberOfMembers' : 0})
		group = select(['Groups'], ['id'], "name=\"{0}\"".format(name))
		group_id = group[0]['id']
		group_ids.append(group_id)
		student = students.pop()
		insert('OptimalPartOf', {'groupId': group_id, 'netId': student['netId']})

	students = sorted(students, key=itemgetter(count_lang_know))
	student = students.pop()
	print(group_langs())
	print(student['netId'])
	print(lang_intersect(unsatisfied_groups_view, student['netId']))
	print(count_unsatisfied_groups())

	seen_netId = ""

	while unsatisfied_groups() and students:
		student = students.pop()
		best_groups = sorted(lang_intersect(unsatisfied_groups_view, student['netId']), key=itemgetter('langs'))
		if best_groups:
			best_group = best_groups[-1]
			print(best_groups)
			print(best_group['groupId'])
			insert('OptimalPartOf', {'groupId': best_group['groupId'], 'netId': student['netId']})
			print(count_unsatisfied_groups())
		else:
			if student['netId'] == seen_netId:
				while unsatisfied_groups() and students:
					group = unsatisfied_groups()[0]
					insert('OptimalPartOf', {'groupId': group['groupId'], 'netId': student['netId']})
			else:		
				students.insert(0, student)
				seen_netId = student['netId']
				

	free_group = not_full_groups()

	while students and not_full_groups():
		student = students.pop()
		best_groups = sorted(lang_intersect(not_full_groups_view, student['netId']), key=itemgetter('langs'))
		if best_groups:
			best_group = best_groups[-1]
			print(best_groups)
			print(best_group['groupId'])
			insert('OptimalPartOf', {'groupId': best_group['groupId'], 'netId': student['netId']})
		else:
			if student['netId'] == seen_netId:
				while not_full_groups() and students:
					group = not_full_groups()[0]
					insert('OptimalPartOf', {'groupId': group['groupId'], 'netId': student['netId']})
			else:		
				students.insert(0, student)
				seen_netId = student['netId']


def keep_assignment():
	drop_partof = "delete from partof"
	cursor = connection.cursor()
	cursor.execute(drop_partof)

	move_assign = "insert into PartOf (groupId, netId) select groupId, netId from OptimalPartOf"
	cursor = connection.cursor()
	cursor.execute(move_assign)
	
	drop_optimalpartof = "delete from optimalpartof"
	cursor = connection.cursor()
	cursor.execute(drop_optimalpartof)

def discard_assignment():
	teardown_values()




	# general assignment
		#ties

	# leftovers after all groups have minimu