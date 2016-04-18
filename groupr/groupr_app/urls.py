from django.conf.urls import url

from . import views

app_name = 'groupr'
urlpatterns = [
    # ex: /polls/
    url(r'^$', views.index, name='index'),
    url(r'^index$', views.index, name='index'),
    url(r'^update_student/$', views.UpdateStudentListView.as_view(), name='update_student_list'),
    url(r'^update_student/(?P<netId>\w+)/$', views.update_student, name='update_student'),
    url(r'^add_student/$', views.insert_student, name='add_student'),
    url(r'^delete_student/$', views.DeleteStudentListView.as_view(), name='delete_student_list'),
    url(r'^delete_student/(?P<netId>\w+)/$', views.delete_student, name='delete_student'),
    url(r'^query_student/$', views.query_student, name='query_student'),
    url(r'^student_page/$', views.student_page, name='student_page'),
    url(r'^student_add_group/$', views.student_add_group, name='student_add_group'),
    url(r'^student_search_group/$', views.student_search_group, name='student_search_group'),
    url(r'^instructor_page/$', views.instructor_page, name='instructor_page'),
]