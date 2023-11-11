from django.conf import settings
from django.shortcuts import render
import requests

# Create your views here.


def get_data(request):

    try:
        # 發送 GET 請求
        headers = {"Authorization": f"Bearer {settings.API_KEY}"}
        response = requests.get(
            "https://data.moa.gov.tw/api/v1/TaiwanMeteorologicalStationInformationType/")

        # 檢查是否成功收到回應
        if response.status_code == 200:
            # 返回 JSON 格式的資料
            return response.json()
        else:
            print(f"錯誤： {response.status_code}")
            return None 
    except Exception as e:
        print(f"發生例外： {e}")
        return None
