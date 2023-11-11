# import_data.py
from datetime import datetime
from django.utils import timezone

import json
from django.core.management.base import BaseCommand

from FarmInfo.models import WeatherObservation


class Command(BaseCommand):
    """python manage.py import_data"""
    help = 'Import data from JSON to model'

    def handle(self, *args, **options):
        try:
            # 讀取本地 JSON 檔案
            with open('./static/local_data_2.json', 'r') as file:
                json_data = json.load(file)

            # 定義處理空字串的函數
            def convert_empty_string_to_none(value):
                if value == "（儀器校驗中）":
                    return 0.0
                return None if value == '' else value

            # 將 JSON 資料轉換為模型對應的格式，並存入模型
            for entry in json_data:
                WeatherObservation.objects.create(
                    humd=convert_empty_string_to_none(entry['HUMD']),
                    temp=convert_empty_string_to_none(entry['TEMP']),
                    # 將空字串轉換為 None
                    elev=float(entry['ELEV']) if entry['ELEV'] else None,
                    time=timezone.now(),
                    pres=convert_empty_string_to_none(entry['PRES']),
                    city=convert_empty_string_to_none(entry['CITY']),
                )

            self.stdout.write(self.style.SUCCESS('資料已成功匯入模型'))
        except Exception as e:
            self.stdout.write(self.style.ERROR(f'匯入資料時發生錯誤：{e}'))
