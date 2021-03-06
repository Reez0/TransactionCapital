from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings
from django.conf.urls import url
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from weather.views import WeatherView

urlpatterns = [
    path('', WeatherView.as_view(), name="default"),
    path('admin/', admin.site.urls),
    path('weather/', include('weather.urls')),
]

urlpatterns += staticfiles_urlpatterns()

urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
