//
//  Wheater.swift
//  Stormer
//
//  Created by Milos Malovic on 30.5.21..
//

import Foundation

struct WheaterDesc: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}
