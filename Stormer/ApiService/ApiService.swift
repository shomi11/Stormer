//
//  ApiService.swift
//  Stormer
//
//  Created by Milos Malovic on 29.5.21..
//

import Foundation

class ApiService {

    static let shared = ApiService()
    var config: URLSessionConfiguration
    var session: URLSession

    init() {
        config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 20
        config.timeoutIntervalForResource = 20
        session = URLSession(configuration: config)
    }

    func request<T>(type: T.Type, router: Router, completion: @escaping (Result<T, ApiError>) -> Void) where T: Codable {
        do {
            let task = try session.dataTask(with: router.request()) { data, response, error in
                guard error == nil else {
                    return
                }
                guard let data = data else { completion(.failure(.missingData)); return }
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch let err {
                    completion(.failure(.decodindError))
                }
            }
            task.resume()
        } catch {

        }
    }
}
