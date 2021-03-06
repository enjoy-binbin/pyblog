# -*- coding: utf-8 -*-
# Generated by Django 1.9.8 on 2018-04-30 06:36
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20, verbose_name='分类名称')),
                ('title', models.CharField(max_length=50, verbose_name='分类描述性标题')),
                ('desc', models.CharField(max_length=50, verbose_name='分类描述')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='添加时间')),
            ],
            options={
                'verbose_name': '文章分类',
                'verbose_name_plural': '文章分类',
            },
        ),
        migrations.CreateModel(
            name='Keyword',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20, verbose_name='分类关键字')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='categorys.Category', verbose_name='所属分类')),
            ],
            options={
                'verbose_name': '分类关键字',
                'verbose_name_plural': '分类关键字',
            },
        ),
    ]
