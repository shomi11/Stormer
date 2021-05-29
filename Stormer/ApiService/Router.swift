//
//  Request.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import Foundation

enum Router {

    static let apiKey = "06b772226da20b9047cdcb341d815063"
    static var baseUrl = "http://api.openweathermap.org/data/2.5/find?"

    case getForecasts(coordinated: Coord)

    var url: URL? {
        switch self {
        case let .getForecasts(coordinated):
            let queryItems = [
                URLQueryItem(name: "lat", value: "\(coordinated.lat)"),
                URLQueryItem(name: "lon", value: "\(coordinated.lon)"),
                URLQueryItem(name: "appid", value: Router.apiKey),
                URLQueryItem(name: "units", value: "metric")
            ]
            var urlComps = URLComponents(string: Router.baseUrl)!
            urlComps.queryItems = queryItems
            return urlComps.url
        }
    }

    func request() throws -> URLRequest {
        guard let url = url else {
            throw ApiError.badUrl
        }
        let request = URLRequest(url: url)
        return request
    }
}
