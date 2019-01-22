# -*- coding: utf-8 -*-
import xadmin

from .models import Category, Keyword, Guestbook


# 文章分类xadmin
class CategoryAdmin(object):
    list_display = ['name', 'title', 'add_time', 'go_to']  # 在后台列表页需要显示的字段
    search_fields = ['name']  # 后台列表搜索框 （可搜索的字段）
    list_filter = ['name', 'title', 'desc', 'add_time']  # 过滤字段
    list_editable = ['title']  # 在列表页可直接进行修改
    ordering = ['-add_time']  # 排序字段
    readonly_fields = ['article_nums']  # 设置为只读字段
    refresh_times = [3, 5]  # 可以在后台列表管理页显式的设置刷新时间


# 文章分类关键字xadmin
class KeywordAdmin(object):
    list_display = ['name', 'category']
    search_fields = ['name']


class GuestbookAdmin(object):
    list_display = ['name', 'content', 'website', 'add_time']
    ordering = ['-add_time']
    search_fields = ['name', 'content', 'website']

xadmin.site.register(Category, CategoryAdmin)
xadmin.site.register(Keyword, KeywordAdmin)
xadmin.site.register(Guestbook, GuestbookAdmin)