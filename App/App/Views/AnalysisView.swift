//
//  AnalysisView.swift
//  App
//
//  Created by laihungwei on 2023/11/11.
//

import SwiftUI
import Charts

struct AnalysisView: View {
    
    @State private var weatherData: Weather?
    @State private var isLoading: Bool = true
    
    let soilCompositionData = [
        SoilComposition(name: "氮", percentage: 20.0),
        SoilComposition(name: "磷", percentage: 10.5),
        SoilComposition(name: "鉀", percentage: 15.8),
        // 添加其他成分...
    ]
    
    let  sunlightModels: [SunlightModel] = [
           SunlightModel(time: "00:00 AM", irradiance: 7.5),
           SunlightModel(time: "01:00 AM", irradiance: 7.2),
           SunlightModel(time: "02:00 AM", irradiance: 6.8),
           // ... 添加其他時間點的數據，一直到 "23:00 PM"
           SunlightModel(time: "23:00 PM", irradiance: 6.0),
       ]
    
    let  sunlightModels_2: [SunlightModel] = [
           SunlightModel(time: "00:00 AM", irradiance: 4.5),
           SunlightModel(time: "01:00 AM", irradiance: 5.2),
           SunlightModel(time: "02:00 AM", irradiance: 10.8),
           // ... 添加其他時間點的數據，一直到 "23:00 PM"
           SunlightModel(time: "23:00 PM", irradiance: 4.0),
       ]
    
    
    let  sunlightModels_3: [SunlightModel] = [
           SunlightModel(time: "00:00 AM", irradiance: 2.5),
           SunlightModel(time: "01:00 AM", irradiance: 9.2),
           SunlightModel(time: "02:00 AM", irradiance: 1.8),
           // ... 添加其他時間點的數據，一直到 "23:00 PM"
           SunlightModel(time: "23:00 PM", irradiance: 8.0),
       ]


    var body: some View {
        if isLoading {
            ProgressView("loading")
                .onAppear {
                    fetchDataFromBackend()
                }
        } else {
            VStack{
                Text(weatherData?.city ?? "nil")
                    .font(.title)
                    .fontWeight(.bold)
                    .shadow(color: .gray, radius: 1, x: 1, y: 1)
                    .minimumScaleFactor(0.5) // 自動調整字號


                ScrollView {
                    GroupBox(label: Text("土壤分析")) {
                        Chart {
                            ForEach(soilCompositionData) { item in
                                BarMark(
                                    x: .value("成分", item.name),
                                    y: .value("份量", item.percentage)
                                )
                                .foregroundStyle(by: .value("City", "南投縣"))

                            }
                        }
                        .frame(height: 300)
                        
                        
                    }
                    .padding()
                    
                    GroupBox(label: Text("照射普及率")) {
                        Chart {
                            ForEach(sunlightModels) { item in
                                PointMark(
                                    x: .value("成分", item.time),
                                    y: .value("份量", item.irradiance)
                                )
                            }
                            .foregroundStyle(by: .value("City", "前天"))

                            ForEach(sunlightModels_2) { item in
                                PointMark(
                                    x: .value("成分", item.time),
                                    y: .value("份量", item.irradiance)
                                )
                            }
                            .foregroundStyle(by: .value("City", "當日"))

                            
                            ForEach(sunlightModels_3) { item in
                                PointMark(
                                    x: .value("成分", item.time),
                                    y: .value("份量", item.irradiance)
                                )
                            }
                            .foregroundStyle(by: .value("City", "其他地區"))

                        }
                        .frame(height: 300)
                        
                        
                    }
                    .padding()
                    
                    
                    LazyVGrid(columns: [GridItem(), GridItem()  ,  GridItem()]) {
                        // 第一个卡片
                        CardView(iconName: "cloud.rain.fill", title: "當月降雨", number: weatherData?.this_month_rainfall_level ?? 0, additionalInfo: "test", color: .gray)
                        
                        
                        // 第二个卡片
                        CardView(iconName: "cloud.rain.fill", title: "當季降雨", number: weatherData?.one_year_rainfall_level ?? 0, additionalInfo: "test", color: .gray)
                        
                        
                        CardView(iconName: "cloud.rain.fill", title: "當年降雨", number: weatherData?.one_year_rainfall_level ?? 0, additionalInfo: "test", color: .gray)
                        
                        // 第三个卡片
                        CardView(iconName: "medical.thermometer.fill", title: "當月溫度", number: weatherData?.this_month_temperature_level ?? 0, additionalInfo: "test", color: .gray)
                        
                        
                        CardView(iconName: "medical.thermometer.fill", title: "當季溫度", number:
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

