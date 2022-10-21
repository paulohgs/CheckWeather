//
//  NetworkSession.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 20/10/22.
//

import Foundation

protocol NetworkSession {
    func fetchAPI(urlRequest: URLRequest, completion: @escaping(Result<WeatherModel, NetworkErrorsHandler>) -> Void)
}

extension URLSession: NetworkSession {
    func fetchAPI(urlRequest: URLRequest, completion: @escaping (Result<WeatherModel, NetworkErrorsHandler>) -> Void) {
        let task = dataTask(with: urlRequest) { data, _, error in
            guard data != nil else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(WeatherModel.self, from: data!)
                completion(.success(decodedData))
            } catch {
                print(error)
                completion(.failure(.invalidRequest))
            }
        }
        task.resume()
    }
}
