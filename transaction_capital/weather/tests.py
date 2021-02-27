from django.test import TestCase
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APITestCase
import requests
from .models import APIKeys

class WeatherAPITests(APITestCase):
    def test_retrieve_report(self):
        url = reverse('weather_report')
        data = {'city': 'Johannesburg'}
        apikey = APIKeys(key_name='openweathermap.org',key_value='a15fafa5e9a0844798797ca91d98a2bd')
        apikey.save()
        response = self.client.post(url, data, format='json')
        self.assertEqual(response.status_code, 200)

