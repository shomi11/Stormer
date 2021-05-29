//
//  MainWeather.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import Foundation

struct MainWeather: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}
