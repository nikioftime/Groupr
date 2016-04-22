from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.views import generic
from django.db import connection
from operator import itemgetter

from .forms import StudentForm, SimpleQueryByYear, StudentSearch, InstructorDecision
from .queries import insert, update, delete, select, TABLE_FIELDS
from .student_search import searchByDesiredLanguage
from .student_skill import searchByDesiredSkill
from .instructorgroupmatching import make_matches, keep_assignment, discard_assignment


class group_list(generic.ListView):
    template_name = "groupr_app/grouplist.html"
    context_object_name = 'groups'

    # get_queryset returns the data that will be used as the context object
    # which is displayed on the page for ListViews
    def get_queryset(self):
        # Get list of all the dictionaries of groups, each dict is a tuple
        # keys are columns, values are the values in the columns
        # For each group, get netIds of Students in partof
        group_dicts = select(['Groups'], ['id'], '')
        group_info = []  # Returns list of group, [list of students] pairs
        for tuple in group_dicts:
            #student_list = []
            group_member = select(['PartOf'], ['netId'], "PartOf.groupId = {0}".format(tuple['id']))  # ???
            #student_list.append(group_member)
            group_info.append([tuple['id'], group_member])
            #print(group_info)
            #if group_member:
            #    print(group_member)
        return group_info

# Displays the group members of a specific group
"""class GroupManagement(generic.ListView):
    template_name = "groupmanagement.html"
    context_object_name = 'group'

    def get_queryset(self):
"""


class UpdateStudentListView(generic.ListView):
    template_name = 'groupr_app/updatestudentlist.html'
    context_object_name = 'students'

    def get_queryset(self):
        return select(['Student'], ['netId', 'name'], '')
        

class DeleteStudentListView(generic.ListView):
    template_name = 'groupr_app/deletestudentlist.html'
    context_object_name = 'students'

    def get_queryset(self):
        return select(['Student'], ['netId', 'name'], '');


def insert_student(request):
	# if this is a POST request we need to process the form data
	if request.method == 'POST':
		# create a form instance and populate it with data from the request:
		form = StudentForm(request.POST)
		# check whether it's valid:
		if form.is_valid():

			# insert student into db
			student_values = {}
			for key in TABLE_FIELDS['Student']:
				if form.cleaned_data[key]:
					student_values[key] = form.cleaned_data[key].lower()
			insert('Student', student_values)

			# insert known skills
			if form.cleaned_data['skillsKnown']:
				known_skills = form.cleaned_data['skillsKnown'].lower().replace(', ', ',').split(',')
				for skill in known_skills:
					insert('Skills', {'name': skill})
					insert('SkillsKnown', {'netId' : student_values['netId'], 'skillName' : skill})

			#insert desired skills
			if form.cleaned_data['skillsDesired']:
				desired_skills = form.cleaned_data['skillsDesired'].lower().replace(', ', ',').split(',')
				for skill in desired_skills:
					insert('Skills', {'name': skill})
					insert('SkillsDesired', {'netId' : student_values['netId'], 'skillName' : skill})

			#insert known languages
			if form.cleaned_data['langsKnown']:
				known_langs = form.cleaned_data['langsKnown'].lower().replace(', ', ',').split(',')
				for lang in known_langs:
					insert('Languages', {'name' : lang})
					insert('LanguagesKnown', {'netId' : student_values['netId'], 'languageName' : lang})

			#insert desired languages
			if form.cleaned_data['langsDesired']:
				desired_langs = form.cleaned_data['langsDesired'].lower().replace(', ', ',').split(',')
				for lang in desired_langs:
					insert('Languages', {'name' : lang})
					insert('LanguagesDesired', {'netId' : student_values['netId'], 'languageName' : lang})

			#insert group
			# insert('Groups', {'name' : student_values['netId'], 'numberOfMembers' : 1})
			# group = select(['Groups'], ['id'], "name=\"{0}\"".format(student_values['netId']))
			# group_id = group[0]['id']
			# insert('PartOf', {'groupId': group_id, 'netId': student_values['netId']})

			#insert projectId
			if form.cleaned_data['projectIdeaName'] or form.cleaned_data['projectIdeaSummary']:
				insert('Project', {'groupId' : group_id, 'name' : form.cleaned_data['projectIdeaName'], 
					'summary' : form.cleaned_data['projectIdeaSummary']})
				project = select(['Project'], ['projectId'], "groupId={0}".format(group_id))
				project_id = project[0]['projectId']
				insert('Idea', {'projectId' : project_id, 'netId' : student_values['netId']})

			return HttpResponseRedirect('/groupr/add_student/')

	# if a GET (or any other method) we'll create a blank form
	else:
		form = StudentForm()

	return render(request, 'groupr_app/addstudent.html', {'form': form})

def update_student(request, netId):
    netId_match = "netId=\"{0}\"".format(netId)
    initialStudentInfo = select(['Student'], [], netId_match)[0]

    known_skills_list = select(['SkillsKnown'], ['skillName'], netId_match)
    skillsKnown = ""
    for skill in known_skills_list:
        skillsKnown = skillsKnown + skill['skillName'] + ", "
    initialStudentInfo['skillsKnown'] = skillsKnown[:-1]

    desired_skills_list = select(['SkillsDesired'], ['skillName'], netId_match)
    skillsDesired = ""
    for skill in desired_skills_list:
        skillsDesired = skillsDesired + skill['skillName'] + ", "
    initialStudentInfo['skillsDesired'] = skillsDesired[:-1]

    known_langs_list = select(['LanguagesKnown'], ['languageName'], netId_match)
    langsKnown = ""
    for lang in known_langs_list:
        langsKnown = langsKnown + lang['languageName'] + ", "
    initialStudentInfo['langsKnown'] = langsKnown[:-1]

    desired_langs_list = select(['LanguagesDesired'], ['languageName'], netId_match)
    langsDesired = ""
    for lang in desired_langs_list:
        langsDesired = langsDesired + lang['languageName'] + ", "
    initialStudentInfo['langsDesired'] = langsDesired[:-1]

    project_id = select(['Idea'], [], netId_match)
    if project_id:
        project_id = project_id[0]['projectId']
        project = select(['Project'], ['name', 'summary'], 'projectId={0}'.format(project_id))[0]
        initialStudentInfo['projectIdeaName'] = project['name']
        initialStudentInfo['projectIdeaSummary'] = project['summary']

    # if this is a POST request we need to process the form data
    if request.method == 'POST':
        # create a form instance and populate it with data from the request:
        form_info = request.POST.copy()
        form_info['netId'] = netId
        form = StudentForm(form_info, initial=initialStudentInfo)
        if form.has_changed():
            # check whether it's valid:
            if form.is_valid():
                # process the data in form.cleaned_data as required
                updated_student_data = {}
                for key in TABLE_FIELDS['Student']:
                    if form.cleaned_data[key]:
                        updated_student_data[key] = form.cleaned_data[key].lower()
                    # updated_student_data = {key : form.cleaned_data[key] for key in list(set(form.changed_data) &
                    # set(TABLE_FIELDS['Student']))}
                if updated_student_data:
                    update('Student', updated_student_data, netId_match)

                # insert known skills
                if 'skillsKnown' in form.changed_data:
                    delete('SkillsKnown', netId_match)
                    known_skills = form.cleaned_data['skillsKnown'].lower().replace(', ', ',').split(',')
                    for skill in known_skills:
                        insert('Skills', {'name': skill})
                        insert('SkillsKnown', {'netId': updated_student_data['netId'], 'skillName': skill})

                # insert desired skills
                if 'skillsDesired' in form.changed_data:
                    delete('SkillsDesired', netId_match)
                    desired_skills = form.cleaned_data['skillsDesired'].lower().replace(', ', ',').split(',')
                    for skill in desired_skills:
                        insert('Skills', {'name': skill})
                        insert('SkillsDesired', {'netId': updated_student_data['netId'], 'skillName': skill})

                # insert known languages
                if 'langsKnown' in form.changed_data:
                    delete('LanguagesKnown', netId_match)
                    known_langs = form.cleaned_data['langsKnown'].lower().replace(', ', ',').split(',')
                    for lang in known_langs:
                        insert('Languages', {'name': lang})
                        insert('LanguagesKnown', {'netId': updated_student_data['netId'], 'languageName': lang})

                # insert desired languages
                if 'langsDesired' in form.changed_data:
                    delete('LanguagesDesired', netId_match)
                    desired_langs = form.cleaned_data['langsDesired'].lower().replace(', ', ',').split(',')
                    for lang in desired_langs:
                        insert('Languages', {'name': lang})
                        insert('LanguagesDesired', {'netId': updated_student_data['netId'], 'languageName': lang})

                if 'projectIdeaName' in form.changed_data or 'projectIdeaSummary' in form.changed_data:
                    project = select(['Idea'], ['projectId'], netId_match)
                    if project:
                        project_id = project[0]['projectId']
                        updated_project_data = {}
                       git  if 'projectIdeaName' in form.changed_data:
                            updated_project_data['name'] = form.cleaned_data['projectIdeaName']
                        if 'projectIdeaSummary' in form.changed_data:
                            updated_project_data['summary'] = form.cleaned_data['projectIdeaSummary']
                        update('Project', updated_project_data, "projectId={0}".format(project_id))
                    else:
                        group = select(['PartOf'], ['groupId'], netId_match)
                        group_id = group[0]['groupId']

                        # insert projectId
                        if form.cleaned_data['projectIdeaName'] or form.cleaned_data['projectIdeaSummary']:
                            insert('Project', {'groupId': group_id, 'name': form.cleaned_data['projectIdeaName'],
                                               'summary': form.cleaned_data['projectIdeaSummary']})
                            project = select(['Project'], ['projectId'], "groupId={0}".format(group_id))
                            project_id = project[0]['projectId']
                            insert('Idea', {'projectId': project_id, 'netId': netId})

                return HttpResponseRedirect('/groupr/update_student/')

    # if a GET (or any other method) we'll create a blank form
    else:

        form = StudentForm(initial=initialStudentInfo)

    return render(request, 'groupr_app/updatestudent.html', {'form': form, 'netId': netId})


def delete_student(request, netId):
    netId_match = "netId=\"{0}\"".format(netId)
    delete('Student', netId_match)
    delete('LanguagesKnown', netId_match)
    delete('LanguagesDesired', netId_match)
    delete('SkillsKnown', netId_match)
    delete('SkillsDesired', netId_match)
    delete('Idea', netId_match)

    groups = select(['PartOf'], [], netId_match)
    for group in groups:
        group_id = group['groupId']
        delete('Groups', "id={0} AND numberOfMembers=1".format(group_id))
        delete('Project', "groupId={0}".format(group_id))
    delete('PartOf', netId_match)

    return HttpResponseRedirect('/groupr/delete_student/')

def group_student(request, seekerNetId, foundNetId):
    netId_match = "netId=\"{0}\"".format(seekerNetId)
    foundNetId_match = "netId=\"{0}\"".format(foundNetId)
    delete('PartOf', foundNetId_match)

    groups = select(['PartOf'], [], netId_match)
    if groups:
        group_id = groups[0]['groupId']
        insert('PartOf', {'groupId': group_id, 'netId': foundNetId})
    else:
        insert('Groups', {'name': seekerNetId, 'numberOfMembers': 1})
        group = select(['Groups'], ['id'], netId_match)
        group_id = group[0]['id']
        insert('PartOf', {'groupId': group_id, 'netId': seekerNetId})
        insert('PartOf', {'groupId': group_id, 'netId': foundNetId})

    return HttpResponseRedirect('/groupr/group_list/')

def query_student(request):
    students = {}

    if request.method == 'POST':
        print(request.POST)
        form = SimpleQueryByYear(request.POST)
        print(form)
        if form.is_valid:
            year = form.cleaned_data['yearInSchool']
            students = select(['Student'], [], "yearInSchool=\'{0}\'".format(year))
    else:
        form = SimpleQueryByYear()

    return render(request, 'groupr_app/querystudentbyyear.html', {'form': form, 'students': students})


def student_search_lang(request):
    students = {}
    netId = ""

    if request.method == 'POST':
        print(request.POST)
        form = StudentSearch(request.POST)
        print(form)
        if form.is_valid:
            netId = form.cleaned_data['netId']
            students = searchByDesiredLanguage(netId)
            if students == []:
                students = None
    else:
        form = StudentSearch()

    return render(request, 'groupr_app/studentsearchlang.html', {'form': form, 'students': students, 'netId': netId})


def student_search_skill(request):
    students = {}
    netId = ""

    if request.method == 'POST':
        print(request.POST)
        form = StudentSearch(request.POST)
        print(form)
        if form.is_valid:
            netId = form.cleaned_data['netId']
            students = searchByDesiredSkill(netId)
            print(students)
            if students == []:
                students = None
            print(students)
    else:
        form = StudentSearch()

    return render(request, 'groupr_app/studentsearchskill.html', {'form': form, 'students': students, 'netId': netId})


def run_matching(request):
	make_matches()
	groups_query = "select * from groups where name LIKE 'optimal%'"
	cursor = connection.cursor()
	cursor.execute(groups_query)
	columns = [col[0] for col in cursor.description]
	groups = [
    	dict(zip(columns, row))
		for row in cursor.fetchall()
	]

	groups_query = "select * from optimalpartof"
	cursor = connection.cursor()
	cursor.execute(groups_query)
	columns = [col[0] for col in cursor.description]
	students = [
    	dict(zip(columns, row))
		for row in cursor.fetchall()
	]

	for group in groups:
		group['students'] = [student for student in students if student['groupId'] == group['id']]

	groups = sorted(groups, key=itemgetter('id'))

	if request.method == 'POST':
		print(request.POST)
		form = InstructorDecision(request.POST)
		print(form)
		if form.is_valid:
			keep = form.cleaned_data['keep']
			if keep == 'keep':
				keep_assignment()
			else:
				discard_assignment()
		return HttpResponseRedirect('/groupr/instructor_page/')
	else:
		form = InstructorDecision(initial={'keep':'keep'})

	return render(request, 'groupr_app/idealmatching.html', {'form': form, 'groups': groups})

def clear_groups(request):
	delete('Groups','')
	delete('PartOf', '')
	return HttpResponseRedirect('/groupr/instructor_page/')



def index(request):
    return render(request, 'groupr_app/index.html')


def student_page(request):
    return render(request, 'groupr_app/studentpage.html')


def student_search_group(request):
    return render(request, 'groupr_app/studentsearchgroup.html')


def student_add_group(request):
    return render(request, 'groupr_app/studentaddgroup.html')


def instructor_page(request):
    return render(request, 'groupr_app/instructorpage.html')
