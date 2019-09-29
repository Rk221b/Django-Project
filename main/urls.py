from django.urls import path, include

from main import views

urlpatterns = [
   
    path('register_coordinator/', views.register_coordinator, name='register_coordinator'),
    path('register_student/', views.register_student, name='register_student'),
    path('login_coordinator/', views.Login_coordinator, name='login_coordinator'),
    path('login_student/', views.Login_student, name='login_student'),
    path('login_coordinator/coordinator_page', views.coordinator_page, name='coordinator_page'),
    path('login_coordinator/create_event', views.create_event, name='create_event'),
    path('student_page/add_event', views.add_event, name='add_event'),
    path('student_page/', views.student_page, name='student_page'),
    path('login_coordinator/logout', views.logout, name='logout'),
    path('student_page/logout', views.logout, name='logout'),
    path('', views.front, name='front')
]
