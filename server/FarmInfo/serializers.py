from rest_framework import serializers

from FarmInfo.models import ControlSettings, Weather, WeatherObservation, LocalWeather


class WeatherObservationSerializer(serializers.ModelSerializer):
    class Meta:
        model = WeatherObservation
        exclude = ['id']


class LocalWeatherSerializer(serializers.ModelSerializer):
    class Meta:
        model = LocalWeather
        exclude = ['id']


class ControlSettingsSerializer(serializers.ModelSerializer):
    class Meta:
        model = ControlSettings
        exclude = ['id']


class WeatherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Weather
        exclude = ['id']
