from django.shortcuts import render

# Create your views here.


def page_not_found_404(request):
    from django.shortcuts import render_to_response
    response = render_to_response('404.html',{})
    response.status_code = 404
    return response


def page_error_500(request):
    from django.shortcuts import render_to_response
    response = render_to_response('500.html',{})
    response.status_code = 500
    return response