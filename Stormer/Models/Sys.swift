//
//  Sys.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import Foundation

struct Sys: Codable {
    let type, id: Int
    let message: Double
    let country: String
    let sunrise, sunset: Int
}
