from datetime import datetime

from django.db import models

# Create your models here.


# 文章分类
class Category(models.Model):
    name = models.CharField(verbose_name="分类名称", max_length=20)
    title = models.CharField(verbose_name="分类描述性标题", max_length=50)
    desc = models.TextField(verbose_name="分类描述", null=True, blank=True)
    add_time = models.DateTimeField(verbose_name="添加时间", default=datetime.now)
    image = models.ImageField(verbose_name="封面图片", default='/media/default.jpg')
    article_nums = models.IntegerField(verbose_name="文章数", default=0)

    class Meta:
        verbose_name = "文章分类"
        verbose_name_plural = verbose_name

    def __str__(self):  # py2是 __unicode__
        return self.name

    # 在xadmin中设置一个跳转按钮，用来直接跳转到前台
    def go_to(self):
        from django.utils.safestring import mark_safe
        return mark_safe(r'<a href="http://127.0.0.1:8000/cate/'+str(self.id)+'">跳转</a>')
    go_to.short_description = "跳转"


# 对分类的关键字描述
class Keyword(models.Model):
    category = models.ForeignKey(Category, verbose_name="所属分类", on_delete=models.CASCADE)
    name = models.CharField(verbose_name="分类关键字", max_length=20)

    class Meta:
        verbose_name = "分类关键字"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


# 留言板
class Guestbook(models.Model):
    name = models.CharField(verbose_name="昵称", max_length=10)
    content = models.CharField(verbose_name="内容", max_length=100)
    website = models.CharField(verbose_name="网站", max_length=50, null=True, blank=True)
    add_time = models.DateTimeField(verbose_name="添加时间", default=datetime.now)

    class Meta:
        verbose_name = "留言板"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name