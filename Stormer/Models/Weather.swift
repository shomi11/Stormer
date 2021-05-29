//
//  Weather.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import Foundation

struct Weather: Codable {
    let message, cod: String
    let count: Int
    let list: [BaseWeather]
}
