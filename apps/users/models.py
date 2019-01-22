from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.


# 定义自己的user，同时基于学习，扩展字段
# 尽可能的多设置了几种不同的字段类型
# 其中字符串类型， 是需要指定最大长度的
class UserProfile(AbstractUser):
    nick_name = models.CharField(max_length=10, verbose_name="昵称", default="")
    # 性别可以在 choices中 选择, 注意female 是六
    gender = models.CharField(verbose_name="性别", max_length=6, choices=(("male", "男"), ("female", "女")))
    # 生日可以要求不填
    birthday = models.DateTimeField(verbose_name="生日", null=True, blank=True)
    mobile = models.CharField(verbose_name="电话", max_length=11, null=True, blank=True)
    image = models.ImageField(verbose_name="头像", max_length=100, upload_to="image/%Y/%m", default="image/default.jpg")

    class Meta:
        verbose_name = "用户"
        verbose_name_plural = verbose_name  # 复数

    # 重载unicode方法，在后台显示实例的时候，返回用户的username
    def __unicode__(self):
        return self.username

