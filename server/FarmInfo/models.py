from django.db import models

class WeatherObservation(models.Model):
    HUMD = models.FloatField(verbose_name='相對濕度')
    TEMP = models.FloatField(verbose_name='溫度')
    ELEV = models.FloatField(verbose_name='高度')
    TIME = models.CharField(max_length=50, verbose_name='資料觀測時間')
    PRES = models.FloatField(verbose_name='測站氣壓')
    CITY = models.CharField(max_length=50, verbose_name='縣市')
    H_24R = models.FloatField(verbose_name='日累積雨量')

    def __str__(self):
        return f"{self.CITY} - {self.TIME}"

    class Meta:
        verbose_name = '氣象觀測'
        verbose_name_plural = '氣象觀測'
