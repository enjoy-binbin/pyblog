# -*- coding: utf-8 -*-

import xadmin

from .models import Article, Tag


class ArticleAdmin(object):
    list_display = ['title', 'author', 'category', 'view_nums']  # 在后台列表页需要显示的字段
    search_fields = ['title', 'author', 'category']  # 后台列表搜索框 （可搜索的字段）
    list_filter = ['title', 'author', 'category']  # 过滤字段
    list_editable = ['author']  # 在列表页可直接进行修改
    readonly_fields = ['view_nums']  # 设置为只读字段
    style_fields = {"content": "ueditor"}  # 指明content style 为 ueditor

    # 在xadmin保存一个article时，更新对应category里的文章数
    def save_models(self):
        obj = self.new_obj  # 获取自身的一个新实例
        obj.save()  # 先保存
        if obj.category is not None:
            category = obj.category  # 获取文章对应外键的分类
            category.article_nums = Article.objects.filter(category=category).count()
            category.save()


class TagAdmin(object):
    list_display = ['article', 'name']
    search_fields = ['article', 'name']
    list_filter = ['article', 'name']

xadmin.site.register(Article, ArticleAdmin)
xadmin.site.register(Tag, TagAdmin)