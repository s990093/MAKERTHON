from django.conf import settings
from django.shortcuts import render
import requests

from FarmInfo.models import ControlSettings, LocalWeather, WeatherObservation
from FarmInfo.serializers import ControlSettingsSerializer, LocalWeatherSerializer, WeatherObservationSerializer


# rest_framework
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.renderers import JSONRenderer
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
# Create your views here.


@api_view(['GET'])
def get_data(request):
    weatherObservationSerializer_data = WeatherObservationSerializer(
        WeatherObservation.objects.all(), many=True)
    localWeatherSerializer_data = LocalWeatherSerializer(
        LocalWeather.objects.all(), many=True)

    data = {
        "weather": weatherObservationSerializer_data.data,
        "local": localWeatherSerializer_data.data,
    }

    return Response(data=data, status=status.HTTP_200_OK)


class ControlSettingsAPIView(APIView):
    def get(self, request):
        serializer = ControlSettingsSerializer(
            ControlSettings.objects.get(city="南投縣"))

        return Response(serializer.data)

    def put(self, request):
        serializer = ControlSettingsSerializer(
            ControlSettings, data=request.data, partial=True)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
