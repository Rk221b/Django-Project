from django.db import models

# Create your models here.

class coordinator(models.Model):
    userName = models.CharField(max_length=100, unique=True)
    email = models.EmailField(max_length=100, unique=True)
    password = models.CharField(max_length=100)
    



class student(models.Model):
    name = models.CharField(max_length=100)
    userName = models.CharField(max_length=100, unique=True)
    stream = models.CharField(max_length=100)
    password = models.CharField(max_length=100)




class event_created_by(models.Model):
    eventName = models.CharField(max_length=100, unique=True)
    coordinatedBy = models.CharField(max_length=100)


class event_participants(models.Model):
    eventName = models.CharField(max_length=100)
    coordinatedBy = models.CharField(max_length=100)
    stream = models.CharField(max_length=100)
    studentName = models.CharField(max_length=100)
    userName = models.CharField(max_length=100)