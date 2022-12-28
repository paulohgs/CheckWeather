//
//  NetworkSessionMock.swift
//  CheckWeatherTests
//
//  Created by Paulo Henrique Gomes da Silva on 21/10/22.
//
@testable import CheckWeather
import Foundation

class NetworkSessionMock: NetworkSession {

    var data: Data?

    func fetchAPI(urlRequest: URLRequest, completion: @escaping (
        Result<CheckWeather.WeatherModel, CheckWeather.NetworkErrorsHandler>) -> Void) {
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
}
