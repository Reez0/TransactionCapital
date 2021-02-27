from django.shortcuts import render
from rest_framework import status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.views.generic import TemplateView, View
from django.http import HttpResponse, HttpRequest
import json
import requests
from .models import APIKeys
import urllib.parse

class WeatherView(TemplateView):
    def get(self, request):
        return render(request, 'weather/weather.html')


class WeatherData(APIView):
    def post(self, request):
        open_weather_api_key = APIKeys.objects.get(key_name = 'openweathermap.org').key_value
        map_box_api_key = APIKeys.objects.get(key_name = 'mapbox.com').key_value
        mapbox_api = 'https://api.mapbox.com/geocoding/v5/mapbox.places/'
        x = urllib.parse.quote_plus("37 Cookham Road, Johannesburg, Johannesburg, Gauteng 2092, South Africa")
        print(x)
        # searchTerm = request.data['city']
        # response = requests.get(
        #     'http://api.openweathermap.org/data/2.5/weather',
        #     params={'q': searchTerm, 'appId': open_weather_api_key, "units": 'metric'}
        # )
        # print(response.json())
        return Response({"success":True, "data":{"Name":"Riyaaz"}})