//
//  Wheater.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import Foundation

struct BaseWeather: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let main: MainWeather
    let dt: Int
    let wind: Wind
    let sys: Sys
    let rain, snow: Bool?
    let clouds: Clouds
    let weather: [WheaterDesc]
}
