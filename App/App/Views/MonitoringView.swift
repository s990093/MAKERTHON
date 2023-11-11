import SwiftUI
import Charts

struct MonitoringView: View {
    @State private var weatherData: [WeatherObservation] = []
    @State private var localData: [LocalWeather] = []

    var body: some View {
        ScrollView {
            if weatherData.isEmpty && localData.isEmpty {
                ProgressView("loading")
                    .onAppear {
                        fetchDataFromBackend()
                    }
            } else {
                
                Text("溫度")
                Chart(){
                    ForEach(weatherData) { item in
                        LineMark(
                            x: .value("Shape Type", item.time),
                            y: .value("Shape Type", item.temp ?? 0),
                            series: .value("Company", "A")
                            
                        )
                        .foregroundStyle(by: .value("City", "大數據"))

                    }

                    ForEach(localData) { item in
                        LineMark(
                            x: .value("Shape Type", item.time),
                            y: .value("Shape Type", item.temp ?? 0),
                            series: .value("Company", "南投縣")
                            
                        )
                        .foregroundStyle(by: .value("City", "南投縣"))

                    }
                }
                .frame(height: 300)

                


                // 濕度
                Text("濕度")
                Chart(){
                    ForEach(weatherData) { item in
                        LineMark(
                            x: .value("Shape Type", item.time),
                            y: .value("Shape Type", item.humd ?? 0),
                            series: .value("Company", "A")
                            
                        )
                        .foregroundStyle(by: .value("City", "大數據"))

                    }

                    ForEach(localData) { item in
                        LineMark(
                            x: .value("Shape Type", item.time),
                            y: .value("Shape Type", item.humd ?? 0),
                            series: .value("Company", "南投縣")
                            
                        )
                        .foregroundStyle(by: .value("City", "南投縣"))

                    }
                }
                .frame(height: 300)

            
                // 氣壓
                Text("氣壓")
                Chart(){
                    ForEach(weatherData) { item in
                        LineMark(
                            x: .value("Shape Type", item.time),
                            y: .value("Shape Type", item.pres ?? 0),
                            series: .value("Company", "A")
                            
                        )
                        .foregroundStyle(by: .value("City", "大數據"))

                    }

                    ForEach(localData) { item in
                        LineMark(
                            x: .value("Shape Type", item.time),
                            y: .value("Shape Type", item.pres ?? 0),
                            series: .value("Company", "南投縣")
                            
                        )
                        .foregroundStyle(by: .value("City", "南投縣"))

                    }
                }
                .frame(height: 300)

            }
        }
        .padding()
    }

    private func fetchDataFromBackend() {
        guard let url = URL(string: "\(AppConfig.baseUrl)/i") else {
            return
        }

        // 执行网络请求
        URLSession.shared.dataTask(with: url) { data, response, error in
            // 处理响应，解析数据
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(ResponseModel.self, from: data)
                    DispatchQueue.main.async {
                        // 使用解码的数据更新 weatherData 和 localData
                        self.weatherData = decodedData.weather
                        self.localData = decodedData.local
                    }
                } catch {
                    print("JSON 解码错误: \(error)")
                }
            }
        }.resume()
    }
}
