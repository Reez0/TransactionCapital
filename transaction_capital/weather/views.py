from django.shortcuts import render
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.views.generic import TemplateView, View
from django.http import HttpResponse, HttpRequest
import json
import requests
from .models import APIKeys

class WeatherView(TemplateView):
    def get(self, request):
        return render(request, 'weather/weather.html')


class WeatherData(APIView):
    def post(self, request):
        apikey = APIKeys.objects.get(key_name = 'openweathermap.org').key_value
        searchTerm = request.data['city']
        response = requests.get(
            'http://api.openweathermap.org/data/2.5/weather',
            params={'q': searchTerm, 'appId': apikey}
        )
        return Response({"success":True, "data":{"Name":"Riyaaz"}})