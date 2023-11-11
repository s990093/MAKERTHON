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

struct ControlSettings:Decodable ,  Identifiable {
    var id: Int
    var city: String
    var control_valve: Bool
    var auto_detect: Bool
    
    init(id: Int, city: String) {
            self.id = id
            self.city = city
            self.control_valve = false
            self.auto_detect = false
        }
}


struct Weather: Decodable , Identifiable {
    var id: Int
    var city: String
    var this_month_rainfall_level: Int
    var this_month_temperature_level: Int
    var three_months_rainfall_level: Int
    var three_months_temperature_level: Int
    var one_year_rainfall_level: Int
    var one_year_temperature_level: Int
}
