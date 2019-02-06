### Update By binbin, 这个用到django1.98和py3.6，是非常简陋的一个博客系统吧。后台用了xadmin，勉强具有最基本的 对博文的增删改查。之后有时间会重新写一个。继续学习，算做记录。

### xadmin后台 
	`bin binbin123`

### 根据requirements里的安装依赖

### 执行数据迁移，或者导入数据库，使用的是mysql5.7

### 后面就贴一下展示页啦。

![image](https://github.com/enjoy-binbin/pyblog/blob/master/1-index.png)
![image](https://github.com/enjoy-binbin/pyblog/blob/master/2-guestbook.png)
![image](https://github.com/enjoy-binbin/pyblog/blob/master/3-category.png)
![image](https://github.com/enjoy-binbin/pyblog/blob/master/4-article.png)
![image](https://github.com/enjoy-binbin/pyblog/blob/master/5-xadmin.png)




----------

----------

----------

----------



### 以前写的笔记。。。。。。。
### 开始用py3 搭建自己的Blog系统啦
### 首先建立 py3的虚拟环境拉。
	mkvirtualenv pyblog --python=C:\Users\Administrator\AppData\Local\Programs\Python\Python36\python.exe
	
	workon pyblog

### 安装django, 这边我版本选择1.9.8了
	pip install -i https://pypi.douban.com/simple django==1.9.8

### 编辑器使用pycharm
### 在pycharm里创建自己的项目，注意选择好自己之前设置的虚拟环境目录


### pip install -i https://pypi.douban.com/simple mysqlclient

### 配置mysql数据库
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'pyblog',
        'USER': 'root',
        'PASSWORD': '1123',
        'HOST': '127.0.0.1'
    }
}


### 生成默认数据表, 成功后会在mysql中生成一些表
### 其中 auth_user是django默认的用户表，后面我们需要改造一下
	pycharm.tools.run manage.py Task
	makemigrations
	migrate

### 新建users app
	startapp users
	编写users的model表
	setting里注册app

### 编写 users的models
### 扩展自己的users 
	from django.contrib.auth.models import AbstractUser

### 将原先django的users 设置为自己定义的 UserProfile
AUTH_USER_MODEL = 'users.UserProfile'

### 后面的代码和笔记，查看users.models


### 安装pillow图片库
	pip install pillow

### 将users.models写完之后，需要重新migrate
	makemigrations users
	migrate users




	
### 新建articles app
	startapp articles
	编写articles的model表
	setting里注册app
	
### 新建category app
	startapp category
	编写category的model表
	setting里注册app




### 在项目目录下新建一个文件夹 apps 用于存放所有的app
### 记得在pycharm中将 apps mark为source目录
### 然后在settings中设置 path
	sys.path.insert(0, os.path.join(BASE_DIR, 'apps'))


### 在 manage.py task下创建超级用户
	createsuperuser
	bin
	binbin123

	
### 设置settings
LANGUAGE_CODE = 'zh-hans'
TIME_ZONE = 'Asia/Shanghai'
USE_TZ = False

### 注册admin 在users.admin下编写代码
	from .models import UserProfile
	### Register your models here.


	### 注册UserProfile
	class UserProfileAdmin(admin.ModelAdmin):
		pass

	admin.site.register(UserProfile, UserProfileAdmin)




### 集合xadmin
### 采用源码下载后，将xdmin目录放入项目里当作一个app
### 将uedit放到python环境的site-XXX下
### 在setting里注册 xadmin和 'crispy_forms'
### 并把 xadmin所在 extra_apps目录 在settings里加入到python包中

### 安装一些依赖
pip install django-import-export==1.0.0
pip install future==0.15.2
pip install six==1.10.0
pip install django-crispy-forms==1.6.1



### makemigrations
### migrate


### 在xadmin里注册app
### 在app目录下 新建一个 adminx.py文件
import xadmin

from .models import Category, Keyword


class CategoryAdmin(object):
    pass


class KeywordAdmin(object):
    pass

xadmin.site.register(Category, CategoryAdmin)
xadmin.site.register(Keyword, KeywordAdmin)




### 在model里重载__str__方法
### 在py2中是重载 __unicode__



### 在settings里设置静态文件路径

'django.core.context_processors.media',  ### 内部处理类 meida 注册html


MEDIA_URL = '/media/'  ### 存储图片的路径
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

STATIC_URL = '/static/'
STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'static'),
)

### 在url.py中配置
from django.views.static import serve  ### 处理图片静态文件
from blogpy.settings import MEDIA_ROOT

url(r'^media/(?P<path>.*)$', serve, {"document_root": MEDIA_ROOT}),  ### 配置上传文件的访问处理函数





### 在xadmin中集成富文本编辑器 DjangoUeditor
### pypi或者github下下载源码进行pip安装
### 或者直接拷贝文件夹到python环境中
### 在settings里注册app
### 使用方法 github.com/zhangfisher/DjangoUeditor

from django.conf.urls import url, include
url(r'^ueditor/', include('DjangoUeditor.urls')),
models  from DjangoUeditor.models import UEditorField
content = UeditorField()

xadmin: plugins-> ueditor.py
plugins.__init__ 加入ueditor
article.adminx 加入 style_fields = {"content": "ueditor"}

### plugin中写自己的ueditor插件
### 将 static/ueditor目录放到自己项目目录静态文件下

http://www.le.com/ptv/vplay/20053322.html
http://goudidiao.com/







### 分页的一个库  github -> pure-pagination
pip install django-pure-pagination

from pure_pagination import  Paginator, EmptyPage, PageNotAnInteger

### 对分类文章列表进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_article, 3, request=request)
        all_article = p.page(page)

for article in all_article.object_list













### 项目上线后需要把 debug置为false
### 而且上线后，在urls设置的 静态文件处理将会失效
### 和处理上传文件一样，添加一个url
	url(r'^static/(?P<path>.*)$', serve, {"document_root": STATIC_ROOT}),
DEBUG = False

### 并且这个参数需要设置 *代表为 所有都可以允许访问
ALLOWED_HOSTS = ['*']


    'crispy_forms',  ### xadmin要用到
    'xadmin',
    'DjangoUeditor',  ### 富文本
    'pure_pagination',  ### 分页