from django.urls import path, include
from . import views


app_name = "FarmInfo"

urlpatterns = [
    path('c', views.ControlSettingsAPIView.as_view(), name="get_data"),

    path('', views.get_data, name="get_data"),
]
