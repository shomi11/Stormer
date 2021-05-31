//
//  Wheater.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import Foundation

struct BaseWeather: Codable {
    let id: Int?
    let name: String?
    let coord: Coord?
    let main: MainWeather?
    let dt: Int?
    let wind: Wind?
    let sys: Sys?
    let clouds: Clouds?
    let weather: [WeatherDesc]?

    static var initial: BaseWeather = {
        let base = BaseWeather(id: nil, name: nil, coord: nil, main: nil, dt: nil, wind: nil, sys: nil, clouds: nil, weather: nil)
        return base
    }()

    static let example: BaseWeather = {
        let base = BaseWeather(id: 0, name: "Belgrade", coord: Coord(lon: 0.0, lat: 0.0), main: MainWeather.example, dt: 0, wind: Wind(speed: 0.0, deg: 1), sys: Sys(type: nil, id: nil, message: nil, country: "RS", sunrise: 0, sunset: 0), clouds: Clouds(all: 0), weather: [WeatherDesc(id: 0, main: .Clear, weatherDescription: "clear", icon: "")])
        return base
    }()
}
