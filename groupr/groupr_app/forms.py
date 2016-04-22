from django import forms

yearsInSchool = (('freshman', 'Freshman'), ('sophomore', 'Sophomore'), ('junior', 'Junior'), 
				('senior', 'Senior'), ('grad', 'Graduate'), ('other', 'Other'))

class StudentForm(forms.Form):
	name = forms.CharField(label='Student name', max_length=50, required=False)
	netId = forms.CharField(label='netId', max_length=10)
	bio = forms.CharField(label='bio', required=False, widget=forms.Textarea)
	major = forms.CharField(label='Major', required=False)
	yearInSchool = forms.ChoiceField(label='Year In School', choices=yearsInSchool)
	skillsKnown = forms.CharField(label='Known skills (separated by commas)', required=False)
	skillsDesired = forms.CharField(label='Skills desired (separated by commas)', required=False)
	langsKnown = forms.CharField(label='Known languages (separated by commas)', required=False)
	langsDesired = forms.CharField(label='Languages desired (separated by comma)', required=False)
	projectIdeaName = forms.CharField(label="Project idea: Project name", required=False)
	projectIdeaSummary = forms.CharField(label="Project idea: Project summary", required=False, widget=forms.Textarea)

class SimpleQueryByYear(forms.Form):
	yearInSchool = forms.ChoiceField(label='Year In School', choices=yearsInSchool)

class StudentSearch(forms.Form):
	netId = forms.CharField(label='netId', max_length=10)
		