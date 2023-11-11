from django.contrib import admin

from FarmInfo.models import ControlSettings, WeatherObservation, LocalWeather, Weather

# Register your models here.


@admin.register(WeatherObservation)
class WeatherObservationAdmin(admin.ModelAdmin):
    list_display = ('city', 'time', 'h_24r', 'temp')  # 將欄位名稱改為小寫
    list_filter = ('city',)
    ordering = ('-time',)


@admin.register(LocalWeather)
class LocalWeatherAdmin(admin.ModelAdmin):
    list_display = ('city', 'time', 'temp')  # 將欄位名稱改為小寫
    list_filter = ('city',)
    ordering = ('-time',)


@admin.register(Weather)
class WeatherAdmin(admin.ModelAdmin):
    pass


@admin.register(ControlSettings)
class ControlSettingsAdmin(admin.ModelAdmin):
    pass
