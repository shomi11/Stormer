//
//  Weather.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import Foundation

struct Weather: Codable {
    let message, cod: String
    let count: Int?
    let list: [BaseWeather]?

    static let initial: Weather = {
        let weather = Weather(message: "", cod: "", count: nil, list: nil)
        return weather
    }()

    static var example: Weather = {
        let weather = Weather(message: "new message", cod: "200", count: 1, list: [BaseWeather.example])
        return weather
    }()

    var locationName: String {
        if let name = list?.first?.name {
            return name
        }
        return ""
    }
}
