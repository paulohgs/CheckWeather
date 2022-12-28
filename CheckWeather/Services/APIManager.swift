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

class APIManager {
    // URLSession that will be injected
    private let session: NetworkSession
    // MARK: - INIT
    // Initializer getting the api key in construct moment and setting the urlComponents
    init(session: NetworkSession = URLSession.shared) {
        self.session = session
    }
    // MARK: - FetchAPI()
    // consult the weather info by city, state and country
    func fetchAPI(urlRequest: URLRequest, completion: @escaping(Result<WeatherModel, NetworkErrorsHandler>) -> Void) {
        session.fetchAPI(urlRequest: urlRequest) { result in
            completion(result)
        }
    }
}
