//
//  ApiError.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import Foundation

enum ApiError: Error {
    case badUrl
    case notFound
    case missingData
    case decodindError
}
