from django.contrib import admin
from django.urls import path,include
from . import views
urlpatterns = [
    path('home',views.WeatherView.as_view(),name="weather"),
    path('report',views.WeatherData.as_view(),name="weather_report")
]

