# Generated by Django 2.2.4 on 2019-09-28 21:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0008_auto_20190929_0233'),
    ]

    operations = [
        migrations.AlterField(
            model_name='coordinator',
            name='userName',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='student',
            name='name',
            field=models.CharField(max_length=100),
        ),
        migrations.AlterField(
            model_name='student',
            name='userName',
            field=models.CharField(max_length=100),
        ),
    ]
