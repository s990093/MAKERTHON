# MAKERTHON 2023 校內比賽

歡迎參與 2023 校內比賽 MAKERTHON！本專案由三個主要組成部分構成：`server`、`app`（SwiftUI）以及 `arduino`。

## Server

### Django

我們使用 Django 作為後端框架，用於處理後端邏輯和數據庫交互。Django 提供了一個強大的 MVC（模型-視圖-控制器）架構，使得開發 RESTful API 及處理用戶請求變得更加簡單。

#### 如何運行 Django 服務器

1. 進入 `server` 目錄：

   ```bash
   cd server
   ```

2. 啟動虛擬環境：

   ```bash
   source .venv/bin/activate
   ```

3. 安裝相依套件：

   ```bash
   pip install -r requirements.txt
   ```

4. 執行遷移：

   ```bash
   python manage.py migrate
   ```

5. 啟動 Django 服務器：
   ```bash
   python manage.py runserver
   ```

### App (SwiftUI)

我們的 iOS 應用程式是使用 SwiftUI 構建的。這提供了現代、直觀的用戶界面，同時具有優雅的程式碼編寫方式。

## Arduino

在 MAKERTHON 中，我們使用 Arduino 來處理硬體相關的任務。這可能涉及傳感器讀取、控制外部設備等。請參考 `arduino` 目錄中的相應文檔以進行配置和開發。
