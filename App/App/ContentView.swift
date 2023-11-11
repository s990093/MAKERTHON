//
//  ContentView.swift
//  Appx
//
//  Created by laihungwei on 2023/11/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            MonitoringView()
                .tabItem {
                    Image(systemName: "eye")
                    Text("監控")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("設定")
                }

         
            
            AnalysisView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("分析")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



