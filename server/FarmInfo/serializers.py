from rest_framework import serializers

from FarmInfo.models import ControlSettings, Weather, WeatherObservation, LocalWeather


class WeatherObservationSerializer(serializers.ModelSerializer):
    class Meta:
        model = WeatherObservation
        fields = '__all__'
        # exclude = ['id']


class LocalWeatherSerializer(serializers.ModelSerializer):
    class Meta:
        model = LocalWeather
        fields = '__all__'
        # exclude = ['id']


class ControlSettingsSerializer(serializers.ModelSerializer):
    class Meta:
        model = ControlSettings
        fields = '__all__'
        # exclude = ['id']


class WeatherSerializer(serializers.ModelSerializer):
    class Meta:
        model = Weather
        fields = '__all__'
        # exclude = ['id']
