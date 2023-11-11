from django.urls import path, include
from . import views


app_name = "FarmInfo"

urlpatterns = [
    path('setting', views.ControlSettingsAPIView.as_view(), name="c"),
    path('local', views.LocalWeatherAPIView.as_view(), name="local"),

    path('', views.get_data, name="get_data"),
]
