"""blogpy URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.views.generic import TemplateView
from django.views.static import serve  # 处理图片静态文件
from blogpy.settings import MEDIA_ROOT, STATIC_ROOT

import xadmin
from categorys.views import IndexView, AboutView, GuestbookView, CateArtListView
from articles.views import ArticleView

urlpatterns = [
    # url(r'^$', TemplateView.as_view(template_name='index.html')),
    url(r'^$', IndexView.as_view(), name="index"),
    url(r'^about/', AboutView.as_view(), name="about"),
    url(r'^guestbook/', GuestbookView.as_view(), name="guestbook"),

    url(r'^admin/', admin.site.urls),
    url(r'^xadmin/', xadmin.site.urls),
    # 分类文章列表
    url(r'^cate/(?P<cate_id>\d+)/$', CateArtListView.as_view(), name="cate_art_list"),
    # 分类文章列表
    url(r'^article/(?P<art_id>\d+)/$', ArticleView.as_view(), name="article"),

    # 配置上传文件的访问处理函数
    url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),
    # 配置静态文件的访问处理函数
    url(r'^static/(?P<path>.*)$', serve, {"document_root": STATIC_ROOT}),

    # DjangoUeitor
    url(r'^ueditor/', include('DjangoUeditor.urls')),
]

# 可以不进行配置，直接在templates里放置404.html，便会自动使用404模板
# 全局404页面配置, 指定如果发生404，调用那个函数
handler404 = 'users.views.page_not_found_404'
handler500 = 'users.views.page_error_500'
