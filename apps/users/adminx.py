# -*- coding: utf-8 -*-

import xadmin
from xadmin import views

# 将对xadmin的全局基础配置放到这里
class BaseSetting(object):
    enable_themes = True  # 开启主题功能
    use_bootswatch = False  # 联机获取主题切换


# 将对xadmin普通设置放到这里
class CommSetting(object):
    site_title = '彬彬管理后台系统'
    site_footer = '彬彬要加油'
    menu_style = 'accordion'  # 菜单样式--> 可折叠的


# 同样需要注册
xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, CommSetting)