//
//  post.swift
//  App
//
//  Created by laihungwei on 2023/11/12.
//

import Foundation



func updateControlValveStatus(_ newValue: Bool) {
    guard let url = URL(string: "\(AppConfig.baseUrl)/i/setting") else {
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let requestBody: [String: Any] = [
          "control_valve": newValue,
          "city": "南投縣"
      ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)

    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("POST request error: \(error)")
        }
        // 可以在這裡處理伺服器的回應，如果需要的話
    }.resume()
}


func postAutoDetectStatus(_ newValue: Bool) {
    guard let url = URL(string: "\(AppConfig.baseUrl)/i/setting") else {
        return
    }

    var request = URLRequest(url: url)
    request.httpMethod = "PUT"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")

    let requestBody: [String: Any] = [
          "auto_detect": newValue,
          "city": "南投縣"
      ]
    request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)

    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("POST request error: \(error)")
        }
        // 可以在這裡處理伺服器的回應，如果需要的話
    }.resume()
}

