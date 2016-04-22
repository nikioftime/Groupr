import sys, os
sys.path.append('~/cs411/Groupr/groupr')
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'
from django.conf import settings

from .queries import select

lang_des  = 'LanguagesDesired'
lang_know = 'LanguagesKnown'

def get_students():
	students = select(['Student'], ['netId'], '')
	print(students)
	for student in students:
		student[lang_des] = set([language['languageName'] for language in 
			select([lang_des], ['languageName'], "netId=\'{}\'".format(student['netId']))])
		student[lang_know] = set([language['languageName'] for language in 
			select([lang_know], ['languageName'], "netId=\'{}\'".format(student['netId']))])
	return students

def number_of_groups(num_students, min, max):
	num_students = num_students * 1.0
	return math.ceil(num_students / min) - (1-math.round(num_students / max)

def make_matches():
	students = get_students()

print(get_students())