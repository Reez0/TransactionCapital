from django.db import models
from django.utils import timezone

class Requests(models.Model):
    request_timestamp = models.DateField(default=timezone.now)
    request_city = models.CharField(max_length=100)
    request_response_data = models.TextField()

class APIKeys(models.Model):
    key_name = models.CharField(max_length=256)
    key_value = models.CharField(max_length=256)
