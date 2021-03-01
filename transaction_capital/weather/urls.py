from django.contrib import admin
from django.urls import path, include
from . import views
urlpatterns = [
    path('', views.WeatherView.as_view(), name="weather"),
    path('report', views.WeatherData.as_view(), name="weather_report"),
    path('history', views.History.as_view(), name="history_create"),
    path('history/create', views.History.as_view(), name="history_create")
]
