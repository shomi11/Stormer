//
//  Wheater.swift
//  Stormer
//
//  Created by Milos Malovic on 30.5.21..
//

import Foundation

struct WeatherDesc: Codable {
    let id: Int?
    let main: ConditionsCodes?
    let weatherDescription, icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }

    var description: String {
        if let description = weatherDescription {
            return "\(description)"
        }
        return ""
    }

    static var initial: WeatherDesc = {
        let desc = WeatherDesc(id: nil, main: nil, weatherDescription: nil, icon: nil)
        return desc
    }()

    static var example: WeatherDesc = {
        let desc = WeatherDesc(id: nil, main: .Rain, weatherDescription: "hard rain", icon: "")
        return desc
    }()
}
