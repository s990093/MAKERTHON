from django.db import models


class BaseWeather(models.Model):
    humd = models.FloatField(verbose_name='相對濕度', null=True)
    temp = models.FloatField(verbose_name='溫度', null=True)
    elev = models.FloatField(verbose_name='高度', null=True)
    time = models.DateTimeField(verbose_name='資料觀測時間', unique=True)
    pres = models.FloatField(verbose_name='測站氣壓', null=True)
    city = models.CharField(max_length=50, verbose_name='縣市')

    def __str__(self):
        return f"{self.city} - {self.time}"

    class Meta:
        abstract = True  # 讓這個模型成為抽象基類


class WeatherObservation(BaseWeather):
    h_24r = models.FloatField(verbose_name='日累積雨量', null=True)

    class Meta:
        verbose_name = '氣象觀測'
        verbose_name_plural = '氣象觀測'


class LocalWeather(BaseWeather):
    class Meta:
        verbose_name = '本地天氣'
        verbose_name_plural = '本地天氣數據'


class ControlSettings(models.Model):
    city = models.CharField(max_length=50, verbose_name='縣市')

    control_valve = models.BooleanField(
        default=False, verbose_name='Control Valve')
    auto_detect = models.BooleanField(
        default=False, verbose_name='Auto Detect')

    def __str__(self):
        return f"{self.city} - Control Valve: {self.control_valve}, Auto Detect: {self.auto_detect}"

    class Meta:
        verbose_name_plural = "控制設置"


class Weather(models.Model):
    MONTH_CHOICES = [
        ('一月', '一月'),
        ('二月', '二月'),
        ('三月', '三月'),
        ('四月', '四月'),
        ('五月', '五月'),
        ('六月', '六月'),
        ('七月', '七月'),
        ('八月', '八月'),
        ('九月', '九月'),
        ('十月', '十月'),
        ('十一月', '十一月'),
        ('十二月', '十二月'),
    ]

    WEATHER_CHOICES = [
        (1, '等级 1'),
        (2, '等级 2'),
        (3, '等级 3'),
        (4, '等级 4'),
        (5, '等级 5'),
    ]

    city = models.CharField(max_length=50, verbose_name='縣市')

    this_month_rainfall_level = models.IntegerField(
        choices=WEATHER_CHOICES, verbose_name='This Month Rainfall Level')
    this_month_temperature_level = models.IntegerField(
        choices=WEATHER_CHOICES, verbose_name='This Month Temperature Level')

    three_months_rainfall_level = models.IntegerField(
        choices=WEATHER_CHOICES, verbose_name='Three Months Rainfall Level')
    three_months_temperature_level = models.IntegerField(
        choices=WEATHER_CHOICES, verbose_name='Three Months Temperature Level')

    one_year_rainfall_level = models.IntegerField(
        choices=WEATHER_CHOICES, verbose_name='One Year Rainfall Level')
    one_year_temperature_level = models.IntegerField(
        choices=WEATHER_CHOICES, verbose_name='One Year Temperature Level')

    def __str__(self):
        return f" {self.city}"

    class Meta:
        verbose_name = '天氣狀態'
        verbose_name_plural = "天氣狀態"
