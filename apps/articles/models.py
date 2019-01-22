from datetime import datetime
from DjangoUeditor.models import UEditorField

from django.db import models

from categorys.models import Category
# Create your models here.


class Article(models.Model):
    category = models.ForeignKey(Category, verbose_name="文章所属分类", )
    title = models.CharField(verbose_name="文章标题", max_length=100)
    desc = models.TextField(verbose_name="文章描述")
    content = UEditorField(verbose_name='文章内容', width=800, height=400, imagePath="article/ueditor/",
                           filePath="article/ueditor/", default='')
    author = models.CharField(verbose_name="作者", max_length=20)
    image = models.ImageField(verbose_name="缩略图", upload_to="article/%Y/%m", max_length=100)
    add_time = models.DateTimeField(verbose_name="添加时间", default=datetime.now)
    view_nums = models.PositiveIntegerField(verbose_name="查看人数", default=0)

    class Meta:
        verbose_name = "文章"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.title

    # 增加阅读量
    def increase_view(self):
        self.view_nums += 1
        self.save(update_fields=['view_nums'])


class Tag(models.Model):
    article = models.ForeignKey(Article, verbose_name="所属文章")
    name = models.CharField(verbose_name="文章标签", max_length=20)

    class Meta:
        verbose_name = "文章标签"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name