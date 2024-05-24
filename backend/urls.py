from django.urls import path
from . import views

urlpatterns = [
  path('', views.homePageView, name='home'),
  path('blur_and_download', views.blur_and_download, name='blur_and_download'),

  path('blur_and_get', views.blur_and_get, name='blur_and_get'),

  path('negative_and_download', views.negative_and_download, name='negative_and_download'),

  path('negative_and_get', views.negative_and_get, name='negative_and_get'),
]