//
//  APIManager.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 13/10/22.
//

import Foundation
/*
    Responsabilidades da classe:
        - Realize the request and return the decoded data;
 */
// - Realize the request and return the decoded data;
class APIManager {
    // Get API Key from a .env or Xcode Configuration File. This key is set on init moment.
    let apiKey: String
    // MARK: - INIT
    // Initializer getting the api key in construct moment and setting the urlComponents
    init(apiKey: String) {
        self.apiKey = apiKey
    }
    // MARK: - FetchAPI()
    // consult the weather info by city, state and country
    func fetchAPI(url: URL, completion: @escaping(Result<WeatherModel, NetworkErrorsHandler>) -> Void) {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/JSON", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard data != nil else {
                completion(.failure(NetworkErrorsHandler.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(WeatherModel.self, from: data!)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
                print(error)
                completion(.failure(NetworkErrorsHandler.requestError))
            }
        }.resume()
    }
}
