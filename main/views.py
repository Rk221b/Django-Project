from django.shortcuts import render
from django.http import HttpRequest,HttpResponse

from .models import coordinator,student,event_created_by,event_participants
from django.views.decorators.csrf import csrf_exempt
from django.core import serializers

from main import forms

import json
from django.core import serializers
from django.contrib.auth.decorators import login_required,user_passes_test
from django.utils.datastructures import MultiValueDictKeyError
from django.shortcuts import redirect

# Create your views here.

def register_coordinator(request):

   # register = forms.CoordinatorRegister()

   # context = {
   #     "form" : register
   # }
   # print("REQUEST" , request)

    if request.method == "POST":
        username = request.POST['inputUserame']
        email = request.POST['inputEmail']
        password = request.POST['inputPassword']

        details = coordinator.objects.create(userName=username, email=email,password=password)
        details.save()
        return render(request,'main/register_coordinator.html')

    else:
        return render(request,'main/register_coordinator.html')


def register_student(request):

    if request.method == "POST":
        name = request.POST['name']
        username = request.POST['Username']
        stream = request.POST['Stream']
        password = request.POST['Password']

        details = student.objects.create(name=name,userName=username, stream=stream,password=password)
        details.save()
        return render(request,'main/register_student.html')

    else:
        return render(request,'main/register_student.html')


def front(request):
    return render(request,'main/front.html')  



def Login_coordinator(request):

    print("sent here")

    if request.method == "POST":
        username = request.session['username']
        print(request.session['username'])
        if coordinator.objects.filter(userName=username).exists():
            request.session['username'] = username
            try:
                result = event_created_by.objects.all().filter(coordinatedBy=username)
            except:
                return HttpResponse("Failed")

            json_result = serializers.serialize('json', result)  
        #    print(result)
        #    print(type(json_result))  
            r = json.loads(json_result)
            length = len(r)
            event_list = []
            for i in range(length):
                event_list.append(r[i]['fields']['eventName'])
        #    print(event_list)

            if event_participants.objects.filter(coordinatedBy=username).exists():
                try:
                    result2 = event_participants.objects.all().filter(coordinatedBy=username)
                except:
                    return HttpResponse("Failed")

                json_result2 = serializers.serialize('json', result2) 
                r2 = json.loads(json_result2)
            #    print(r2)
                length2 = len(r2)
                student_name_info = []
                student_stream_info = []
                student_event_info = [] 
                for i in range(length2):
                    student_name_info.append(r2[i]['fields']['studentName'])
                    student_stream_info.append(r2[i]['fields']['stream']) 
                    student_event_info.append(r2[i]['fields']['eventName']) 
                         

            #    print(student_info)    

            context = {
                "coordinatorName" : username,
                "events" : event_list,
                "student_name_info" : student_name_info,
                "student_stream_info" : student_stream_info,
                "student_event_info" : student_event_info,
            }

            return render(request,'main/coordinator.html', context)
        else:
            return HttpResponse("UserName and Password Not Matched")    

    else:
        return render(request,'main/login_coordinator.html')  


def Login_student(request):

    if request.method == "POST":
        username = request.POST['studentName']
        password = request.POST['studentPass']
        print(username,password)
        
        if student.objects.filter(userName=username, password=password).exists():
            try:
                result = event_participants.objects.all().filter(userName=username)
            except:
                return HttpResponse("Failed")

            json_result = serializers.serialize('json', result)  
        #    print(result)
        #    print(type(json_result))  
            r = json.loads(json_result)
            length = len(r)
            event_info = []
            stream_info = r[0]['fields']['stream']
            coordinator_info = []
            print(r)

            for i in range(length):
                event_info.append(r[i]['fields']['eventName'])
                coordinator_info.append(r[i]['fields']['coordinatedBy'])

            context = {
                "studentName" : username,
                "events" : event_info,
                "coordinator_info" : coordinator_info,
                "stream_info" : stream_info,
            }

            return render(request,'main/student.html', context)
        else:
            return HttpResponse("UserName and Password Not Matched")    

    else:
        return render(request,'main/login_student.html') 


#@login_required(login_url='login_coordinator')
def coordinator_page(request):

#    username = 'not logged in'

    if request.method == "POST":
        username = request.POST.get('coordinatorName')
        password = request.POST.get('coordinatorPass')
        print(" Login Page ",username,password)
        

        if coordinator.objects.filter(userName=username, password=password).exists():
            request.session['username'] = username
            try:
                result = event_created_by.objects.all().filter(coordinatedBy=username)
            except:
                return HttpResponse("Failed")

            json_result = serializers.serialize('json', result)  
        #    print(result)
        #    print(type(json_result))  
            r = json.loads(json_result)
            length = len(r)
            event_list = []
            for i in range(length):
                event_list.append(r[i]['fields']['eventName'])
        #    print(event_list)

            if event_participants.objects.filter(coordinatedBy=username).exists():
                try:
                    result2 = event_participants.objects.all().filter(coordinatedBy=username)
                except:
                    return HttpResponse("Failed")

                json_result2 = serializers.serialize('json', result2) 
                r2 = json.loads(json_result2)
            #    print(r2)
                length2 = len(r2)
                student_name_info = []
                student_stream_info = []
                student_event_info = [] 
                for i in range(length2):
                    student_name_info.append(r2[i]['fields']['studentName'])
                    student_stream_info.append(r2[i]['fields']['stream']) 
                    student_event_info.append(r2[i]['fields']['eventName']) 
                         

            #    print(student_info)    

            context = {
                "coordinatorName" : username,
                "events" : event_list,
                "student_name_info" : student_name_info,
                "student_stream_info" : student_stream_info,
                "student_event_info" : student_event_info,
            }

            return render(request,'main/coordinator.html', context)
        else:
            return HttpResponse("UserName and Password Not Matched")    

    else:
        return redirect('login_coordinator')        


def create_event(request):

    if request.method == "POST":
        eventName = request.POST['eName']
        coordinatedBy = request.POST['coordinatorName']
        coordinatorPass = request.POST['coordinatorPass']

        if event_created_by.objects.all().filter(eventName=eventName).exists():
            return HttpResponse("Already Exists")
        else:
            details = event_created_by.objects.create(eventName=eventName,coordinatedBy=coordinatedBy)
            details.save()

        try:
            result = event_created_by.objects.all().filter(coordinatedBy=coordinatedBy)
        except:
            return HttpResponse("Failed")

        json_result = serializers.serialize('json', result)  
    #    print(result)
    #    print(type(json_result))  
        r = json.loads(json_result)
        length = len(r)
        event_list = []
        for i in range(length):
            event_list.append(r[i]['fields']['eventName'])
    #    print(event_list)

        if event_participants.objects.filter(coordinatedBy=coordinatedBy).exists():
            try:
                result2 = event_participants.objects.all().filter(coordinatedBy=coordinatedBy)
            except:
                return HttpResponse("Failed")

            json_result2 = serializers.serialize('json', result2) 
            r2 = json.loads(json_result2)
        #    print(r2)
            length2 = len(r2)
            student_name_info = []
            student_stream_info = []
            student_event_info = [] 
            for i in range(length2):
                student_name_info.append(r2[i]['fields']['studentName'])
                student_stream_info.append(r2[i]['fields']['stream']) 
                student_event_info.append(r2[i]['fields']['eventName']) 
                         

        #    print(student_info)    

        context = {
            "coordinatorName" : coordinatedBy,
            "events" : event_list,
            "student_name_info" : student_name_info,
            "student_stream_info" : student_stream_info,
            "student_event_info" : student_event_info,
        }

        return render(request,'main/coordinator.html', context)


#@login_required(login_url='login_student')
def student_page(request):


    if request.method == "POST":
        username = request.POST['studentName']
        password = request.POST['studentPass']
        print(username,password)
        
        if student.objects.filter(userName=username, password=password).exists():
            try:
                result = event_participants.objects.all().filter(userName=username)
            except:
                return HttpResponse("Failed")

            try:
                all_events = event_created_by.objects.all()
            except:
                return HttpResponse("Failed")    

            json_result = serializers.serialize('json', result)
            json_result2 = serializers.serialize('json', all_events)  
        #    print(result)
        #    print(type(json_result))  
            r_events = json.loads(json_result2)
            events_list = []
            r = json.loads(json_result)
            length = len(r)
            event_info = []
            stream_info = r[0]['fields']['stream']
            coordinator_info = []
        #    print(r)

        #    print(r_events)
            for i in range(len(r_events)):
                events_list.append(r_events[i]['fields']['eventName'])


            for i in range(length):
                event_info.append(r[i]['fields']['eventName'])
                coordinator_info.append(r[i]['fields']['coordinatedBy'])

            context = {
                "studentName" : username,
                "events" : event_info,
                "coordinator_info" : coordinator_info,
                "stream_info" : stream_info,
                "events_list" : events_list
            }

            return render(request,'main/student.html', context)
        else:
            return HttpResponse("UserName and Password Not Matched")    

    else:
        return render(request,'main/login_student.html')


def add_event(request):

    if request.method == "POST":
        eventName = request.POST['eventName']
        studentName = request.POST['studentName']
        stream_info = request.POST['stream_info']

        if event_participants.objects.all().filter(userName=studentName, eventName=eventName).exists():
            return HttpResponse("Already Participated")
        else:
            try:
                cName = event_created_by.objects.all().filter(eventName=eventName)
                rlst = serializers.serialize('json', cName)
                rl2 = json.loads(rlst)
                coordinatedBy = rl2[0]['fields']['coordinatedBy']

                sName = student.objects.all().filter(userName=studentName)
                sresult = serializers.serialize('json', sName)
                srl2 = json.loads(sresult)
                studentNameFinal = srl2[0]['fields']['name']

                details = event_participants.objects.create(userName=studentName, eventName=eventName,stream=stream_info,coordinatedBy=coordinatedBy,studentName=studentNameFinal)
                details.save()
            except:
                return HttpResponse("Failed1")

        if student.objects.filter(userName=studentName).exists():
            try:
                result = event_participants.objects.all().filter(userName=studentName)
            except:
                return HttpResponse("Failed2")

            try:
                all_events = event_created_by.objects.all()
            except:
                return HttpResponse("Failed3")    

            json_result = serializers.serialize('json', result)
            json_result2 = serializers.serialize('json', all_events)  
        #    print(result)
        #    print(type(json_result))  
            r_events = json.loads(json_result2)
            events_list = []
            r = json.loads(json_result)
            length = len(r)
            event_info = []
            stream_info = r[0]['fields']['stream']
            coordinator_info = []
        #    print(r)

        #    print(r_events)
            for i in range(len(r_events)):
                events_list.append(r_events[i]['fields']['eventName'])


            for i in range(length):
                event_info.append(r[i]['fields']['eventName'])
                coordinator_info.append(r[i]['fields']['coordinatedBy'])

            context = {
                "studentName" : studentName,
                "events" : event_info,
                "coordinator_info" : coordinator_info,
                "stream_info" : stream_info,
                "events_list" : events_list
            }

            return render(request,'main/student.html', context)
        else:
            return HttpResponse("UserName and Password Not Matched")    

    else:
        return render(request,'main/login_student.html')



def logout(request, *args, **kwargs):
    if request.session.has_key('username'):
        del request.session['username']
    return redirect('front')
     
