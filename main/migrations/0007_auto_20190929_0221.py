# Generated by Django 2.2.4 on 2019-09-28 20:51

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0006_auto_20190929_0221'),
    ]

    operations = [
        migrations.AlterField(
            model_name='coordinator',
            name='email',
            field=models.EmailField(max_length=100),
        ),
    ]
