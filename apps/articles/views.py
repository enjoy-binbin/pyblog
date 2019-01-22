from django.shortcuts import render
from django.views.generic.base import View

from .models import Article, Tag
from categorys.models import Category
# Create your views here.


class ArticleView(View):
    def get(self, request, art_id):
        all_article = Article.objects.all()

        art_id = int(art_id)
        article = all_article.get(id=art_id)
        article.increase_view()  # 增加阅读量

        # 根据model.article的反向外键 找到一个分类下的所有文章
        # gt(gte): 大于(大于等于) lt(lte): 小于(小于等于) id__in
        # 获取文章上一篇下一篇，django不支持从末尾切片，所以需要reverse，而reverse前要进行排序
        article_pre = article.category.article_set.all().filter(id__gt=art_id)[:1]
        if article_pre:
            article_pre = article_pre[0]
        article_next = article.category.article_set.all().filter(id__lt=art_id).order_by('id').reverse()[:1]
        if article_next:
            article_next = article_next[0]
        # article_next2 = article.category.article_set.all().filter(id__lt=art_id).order_by('id')[:1]

        tags = Tag.objects.filter(article=article)

        new_article = all_article.order_by('-add_time')[:5]
        hot_article = all_article.order_by('-view_nums')[:5]

        navs = Category.objects.all()
        return render(request, 'article.html',{
            'article': article,
            'new_article': new_article,
            'hot_article': hot_article,
            'navs': navs,
            'article_pre': article_pre,
            'article_next': article_next,
            'tags': tags
        })
