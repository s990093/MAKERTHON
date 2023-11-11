//
//  CardView.swift
//  App
//
//  Created by laihungwei on 2023/11/12.
//

import SwiftUI


func getColorForNumber(_ number: Int) -> Color {
    switch number {
    case 1:
        return Color.red
    case 2:
        return Color.orange
    case 3:
        return Color.yellow
    case 4:
        return Color.green
    case 5:
        return Color.blue
    default:
        return Color.gray
    }
}

struct CardView: View {
    let iconName: String 
    let title: String
    let number: Int
    let additionalInfo: String
    let color: Color

    var body: some View {
          VStack {
          
              HStack {
                  VStack(alignment: .leading) {
                      Text(title)
                          .font(.headline)
                          .foregroundColor(.secondary)
                      HStack{
                          Image(systemName: iconName)
                              .padding(2)
                              .font(Font.system(size: 25))
                              .font(.largeTitle)
                              .foregroundColor(color)
                          
                          Spacer()

                          Circle()
                                 .foregroundColor(getColorForNumber(number))
                                 .frame(width: 20, height: 20)

                      }
                      
                  }
                  .layoutPriority(100)

              }
              .padding()
          }
          .cornerRadius(10)
          .overlay(
              RoundedRectangle(cornerRadius: 10)
                  .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.3), lineWidth: 1)
          )
          .padding([.top, .horizontal])
      }
  }

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(iconName: "Stringcloud.rain.fill", title: "測試", number: 2, additionalInfo: "test", color: .gray)    }
}
