# -*- coding: utf-8 -*-
# Generated by Django 1.11.2 on 2017-07-03 16:12
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0006_auto_20170701_1801'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='updated',
            field=models.DateTimeField(auto_now=True, db_index=True, null=True, verbose_name='start date/time'),
        ),
        migrations.AlterField(
            model_name='event',
            name='start',
            field=models.DateTimeField(blank=True, db_index=True, null=True, verbose_name='start date/time'),
        ),
    ]