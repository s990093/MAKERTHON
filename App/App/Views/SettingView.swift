//
//  SettingView.swift
//  App
//
//  Created by laihungwei on 2023/11/11.
//

import SwiftUI

struct SettingView: View {
    @State private var controlSettingsData: ControlSettings?
    @State private var isLoading: Bool = true
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("loading")
                    .onAppear {
                        fetchDataFromBackend()
                    }
            } else {
                VStack(alignment: .leading, spacing: 10) {
                    GroupBox(label: Text("設定")) {
                           VStack(alignment: .leading, spacing: 10) {
                               Text(controlSettingsData?.city ?? "無")
                                   .font(.title)  // 根據需要調整字體大小

                               Toggle("開水閘", isOn: Binding(
                                   get: {
                                       controlSettingsData?.control_valve ?? false
                                   },
                                   set: { newValue in
                                       // 在這裡處理 Toggle 的狀態改變
                                       // newValue 就是新的狀態值
                                       
                                       updateControlValveStatus(newValue)
                                       controlSettingsData?.control_valve  = !(controlSettingsData?.control_valve ?? false)

                                   }
                               ))
                               .padding(.horizontal)

                               Toggle("自動偵測", isOn: Binding(
                                   get: {
                                       controlSettingsData?.auto_detect ?? false
                                   },
                                   set: { newValue in
                                       // 在這裡處理 Toggle 的狀態改變
                                       // newValue 就是新的狀態值
                                       if newValue {
                                                  // 如果是開啟狀態，執行 post 行為
                                                  postAutoDetectStatus(newValue)
                                              }
                                       
                                       controlSettingsData?.auto_detect  = !(controlSettingsData?.auto_detect ?? false)
                                   }
                               ))
                               .padding(.horizontal)
                           }
                           .padding()
                       }
                    Spacer()  // 將 Toggle 推到頂部

                }.padding()

            }
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
                        self.isLoading = false
                    }
                } catch {
                    print("JSON 解码错误: \(error)")
                }
            }
        }.resume()
    }
}
