# Generated by Django 3.2.5 on 2021-07-13 11:04

import account.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('account', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='account',
            name='profile_img',
            field=models.ImageField(blank=True, null=True, upload_to=account.models.upload_location),
        ),
    ]
