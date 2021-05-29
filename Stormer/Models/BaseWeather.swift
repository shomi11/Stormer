//
//  Wheater.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import Foundation

struct BaseWeather: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: MainWeather
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}
