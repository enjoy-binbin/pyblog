# -*- coding: utf-8 -*-

from django import forms


# 对留言板的那个form进行字段验证
class GuestbookForm(forms.Form):
    name = forms.CharField(required=True, max_length=10, error_messages={"required": "昵称不能为空诶"})
    content = forms.CharField(required=True, error_messages={"required": "内容怎么能为空"})
    website = forms.CharField(required=False)