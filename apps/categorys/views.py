from django.shortcuts import render
from django.views.generic.base import View
from pure_pagination import  Paginator, EmptyPage, PageNotAnInteger

from .models import Category, Guestbook
from articles.models import Article
from .forms import GuestbookForm


# 首页index  Bin丶
class IndexView(View):
    def get(self, request):
        # print(1/0) # 模拟测试500页面
        navs = Category.objects.all()
        return render(request, 'index.html', {
            "navs": navs,
            "now": 'index'
        })


# 关于我
class AboutView(View):
    def get(self, request):
        navs = Category.objects.all()
        return render(request, 'about.html', {
            "navs": navs,
            "now": 'about'
        })


# 留言板
class GuestbookView(View):
    def get(self, request):
        navs = Category.objects.all()
        guestbooks = Guestbook.objects.all().order_by('-add_time')
        guestbooks_count = guestbooks.count()
        return render(request, 'guestbook.html', {
            "navs": navs,
            "now": 'guestbook',
            "guestbooks": guestbooks,
            'guestbooks_count': guestbooks_count
        })

    def post(self, request):
        guestbook_form = GuestbookForm(request.POST)  # 引入form进行表单验证
        navs = Category.objects.all()
        name = request.POST.get('name', '')
        content = request.POST.get('content', '')
        website = request.POST.get('website', '')
        msg = ''
        guestbooks = Guestbook.objects.all().order_by('-add_time')

        if guestbook_form.is_valid():
            # 通过form验证, 将字段设空
            guestbook = Guestbook()
            guestbook.name = name
            guestbook.content = content
            guestbook.website = website
            guestbook.save()
            msg = "留言成功了呀"
            name = ''
            content = ''
            website = ''

        return render(request, 'guestbook.html', {
            "navs": navs,
            "now": 'guestbook',
            "guestbook_form": guestbook_form,
            "name": name,
            "content": content,
            "website": website,
            "msg": msg,
            "guestbooks": guestbooks
        })


# 文章各个分类页
class CateArtListView(View):
    def get(self, request, cate_id):
        cate_id = int(cate_id)
        cate = Category.objects.get(id=cate_id)
        # 根据外键找到分类栏下的所有文章
        all_article = cate.article_set.all().order_by('-add_time')

        new_article = Article.objects.all().order_by('-add_time')[:5]
        hot_article = Article.objects.all().order_by('-view_nums')[:5]

        navs = Category.objects.all()

        # 对分类文章列表进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_article, 3, request=request)
        all_article = p.page(page)

        return render(request, 'category.html', {
            "category": cate,
            "all_article": all_article,
            'new_article': new_article,
            'hot_article': hot_article,
            'navs': navs,
            'now': cate.title
        })