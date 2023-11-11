//
//  SettingView.swift
//  App
//
//  Created by laihungwei on 2023/11/11.
//

import SwiftUI

struct SettingView: View {
    @State private var controlSettingsData: ControlSettings?
    
    var body: some View {
        VStack {
            if  ((controlSettingsData?.auto_detect.description.isEmpty) != nil) {
                ProgressView("loading")
                
            } else {
                
                VStack(alignment: .leading, spacing: 10) {
                  
                    
                    Toggle("控制閥", isOn: controlSettingsData?.control_valve)
                        .padding(.horizontal)
                    
                    Toggle("自動檢測", isOn:controlSettingsData?.auto_detect)
                        .padding(.horizontal)
                }
                .padding()
            }
        }
        .onAppear {
            fetchDataFromBackend()
        }
    }
    
    private func fetchDataFromBackend() {
        guard let url = URL(string: "\(AppConfig.baseUrl)/i/setting") else {
            return
        }
        
        // 执行网络请求
        URLSession.shared.dataTask(with: url) { data, response, error in
            // 处理响应，解析数据
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(ControlSettings.self, from: data)
                    DispatchQueue.main.async {
                        // 使用解码的数据更新 controlSettingsData
                        self.controlSettingsData = decodedData
                    }
                } catch {
                    print("JSON 解码错误: \(error)")
                }
            }
        }.resume()
    }
}
