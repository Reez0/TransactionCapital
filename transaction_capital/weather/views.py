from django.shortcuts import render
from rest_framework import serializers, status
from rest_framework.response import Response
from rest_framework.views import APIView
from django.views.generic import TemplateView, View
from django.http import HttpResponse, HttpRequest
import json
import requests
from .models import APIKeys, Requests
import urllib.parse
from requests.adapters import HTTPAdapter
from requests.packages.urllib3.util.retry import Retry
import datetime
from .serializers import HistorySerializer

class WeatherView(TemplateView):
    def get(self, request):
        return render(request, 'weather/weather.html')

class WeatherData(APIView):
    def post(self, request):
        openweather_api_key = APIKeys.objects.get(key_name = 'openweathermap.org').key_value
        mapbox_api_key = APIKeys.objects.get(key_name = 'mapbox.com').key_value
        encoded_address = urllib.parse.quote_plus(request.data['address']) 
        response = self.get_coordinates(encoded_address, mapbox_api_key)
        coordinates = response['features'][0]['geometry']['coordinates']
        current_weather = self.get_current_weather(coordinates, openweather_api_key)
        weather_forecast = self.get_hourly_forecast(coordinates, openweather_api_key)
        return Response({"success":True, "status": status.HTTP_200_OK, "data": {"current_weather": current_weather.json(), "weather_forecast": weather_forecast.json()}})

    def get_coordinates(self, address, mapbox_api_key):
        http = self.get_http_adapter()
        mapbox_geotagging_api = 'https://api.mapbox.com/geocoding/v5/mapbox.places/'
        response = http.get(
            f"{mapbox_geotagging_api}{address}.json?access_token={mapbox_api_key}"
        )
        return response.json()

    def get_current_weather(self, coordinates, openweather_api_key):
        http = self.get_http_adapter()
        response = http.get(
            'http://api.openweathermap.org/data/2.5/weather',
            params={'lat': coordinates[0], 'lon': coordinates[1], 'appId': openweather_api_key, "units": 'metric'}
        )
        return response

    def get_hourly_forecast(self, coordinates, openweather_api_key):
        http = self.get_http_adapter()
        response = http.get(
            'https://api.openweathermap.org/data/2.5/onecall',
            params={'lat': coordinates[0], 'lon': coordinates[1], 'exclude': 'current,minutely,daily,alerts', 'appid': openweather_api_key, "units": 'metric'}
        )
        return response

    def get_http_adapter(self):
        retry_strategy = Retry(
            total=3,
            status_forcelist=[429, 500, 502, 503, 504],
            method_whitelist=["HEAD", "GET", "OPTIONS"]
        )
        adapter = HTTPAdapter(max_retries=retry_strategy)
        http = requests.Session()
        http.mount("https://", adapter)
        http.mount("http://", adapter)
        return http

class History(APIView):
    def get(self, request):
        history = Requests.objects.all()
        serializer = HistorySerializer(data=history, many=True)
        # if serializer.is_valid:
        #     return Response({"success":True, "status":status.HTTP_200_OK, "data":serializer.data})
        # else:
        #     return Response({"No":"No"})
        return Response({"Okay": "OKay"})

    def post(self, request):
        serializer = HistorySerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
        else:
            return Response({'success':False,'message':'Unable to save history at this time, please try again later.'})  
        return Response({'success': True, 'message':"History saved successfully"})