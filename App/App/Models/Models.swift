import Foundation



struct WeatherObservation: Decodable , Identifiable {
    var id: Int
    var humd: Double?
    var temp: Double?
    var elev: Double?
    var time: String
    var pres: Double?
    var city: String
    var h_24r: Double?

    
}

struct LocalWeather: Decodable , Identifiable {
    var id: Int
    var humd: Double?
    var temp: Double?
    var elev: Double?
    var time: String
    var pres: Double?
    var city: String
}



struct ResponseModel: Decodable {
    var weather: [WeatherObservation]
    var local: [LocalWeather]
}

struct ControlSettings: Identifiable {
    var id: UUID = UUID()
    var city: String
    var controlValve: Bool
    var autoDetect: Bool

    var displayName: String {
        return "\(city) - Control Valve: \(controlValve), Auto Detect: \(autoDetect)"
    }
}


struct Weather: Identifiable {
    var id: UUID = UUID()
    var city: String
    var thisMonthRainfallLevel: Int
    var thisMonthTemperatureLevel: Int
    var threeMonthsRainfallLevel: Int
    var threeMonthsTemperatureLevel: Int
    var oneYearRainfallLevel: Int
    var oneYearTemperatureLevel: Int

    var displayName: String {
        return "\(city)"
    }
}
