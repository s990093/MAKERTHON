//
//  AnalysisView.swift
//  App
//
//  Created by laihungwei on 2023/11/11.
//

import SwiftUI

struct AnalysisView: View {
    
    @State private var weatherData: Weather?
    @State private var isLoading: Bool = true
    var body: some View {
        if isLoading {
            ProgressView("loading")
                .onAppear {
                    fetchDataFromBackend()
                }
        } else {
            VStack{
                Text(weatherData?.city ?? "nil")
                    .font(.system(.title))
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()  ,  GridItem()]) {
                        // 第一个卡片
                        CardView(iconName: "cloud.rain.fill", title: "當月降雨", number: weatherData?.this_month_rainfall_level ?? 0, additionalInfo: "test", color: .gray)
                        
                        
                        // 第二个卡片
                        CardView(iconName: "cloud.rain.fill", title: "當季降雨", number: weatherData?.one_year_rainfall_level ?? 0, additionalInfo: "test", color: .gray)
                        
                        
                        CardView(iconName: "cloud.rain.fill", title: "當年降雨", number: weatherData?.one_year_rainfall_level ?? 0, additionalInfo: "test", color: .gray)
                        
                        // 第三个卡片
                        CardView(iconName: "medical.thermometer.fill", title: "當月溫度", number: weatherData?.this_month_temperature_level ?? 0, additionalInfo: "test", color: .gray)
                        
                        
                        CardView(iconName: "medical.thermometer.fill", title: "當年溫度", number:
                                    weatherData?.three_months_temperature_level ?? 0, additionalInfo: "test", color: .gray)
                        
                    
                        // 第四个卡片
                        CardView(iconName: "medical.thermometer.fill", title: "當年溫度", number: weatherData?.one_year_temperature_level ?? 0, additionalInfo: "test", color: .gray)
                        
                        
                    }
                    .padding()
                }
            }
        }
    }
    
    private func fetchDataFromBackend() {
        guard let url = URL(string: "\(AppConfig.baseUrl)/i/analysis") else {
            return
        }
        
        // 执行网络请求
        URLSession.shared.dataTask(with: url) { data, response, error in
            // 处理响应，解析数据
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(Weather.self, from: data)
                    DispatchQueue.main.async {
                        // 使用解码的数据更新 controlSettingsData
                        self.weatherData = decodedData
                        self.isLoading = false
                    }
                } catch {
                    print("JSON 解码错误: \(error)")
                }
            }
        }.resume()
    }
}

