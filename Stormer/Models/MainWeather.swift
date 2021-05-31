//
//  MainWeather.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import Foundation

struct MainWeather: Codable {
    let temp, feelsLike, tempMin, tempMax: Double?
    let pressure, humidity: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }

    var currentTemp: String {
        if let temp = temp {
            return "\(Int(temp))°"
        }
        return ""
    }

    var feeling: String {
        if let feelsLike = feelsLike {
            return "Feels like: \(Int(feelsLike))°"
        }
        return ""
    }

    var minimumTemp: String {
        if let tempMin = tempMin {
            return "Min: \(Int(tempMin))°"
        }
        return ""
    }

    var maximumTemp: String {
        if let maxTemp = tempMax {
            return "Max: \(Int(maxTemp))°"
        }
        return ""
    }

    static var initial: MainWeather = {
        let main = MainWeather(temp: nil, feelsLike: nil, tempMin: nil, tempMax: nil, pressure: nil, humidity: nil)
        return main
    }()

    static let example: MainWeather = {
        let main = MainWeather(temp: 16, feelsLike: 18, tempMin: 12, tempMax: 23, pressure: nil, humidity: nil)
        return main
    }()
}
