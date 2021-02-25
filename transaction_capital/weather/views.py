from django.shortcuts import render
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.views.generic import TemplateView
import json
# Create your views here.

class WeatherView(TemplateView):
    def get(self, request):

        return render(request, 'weather/weather.html')

