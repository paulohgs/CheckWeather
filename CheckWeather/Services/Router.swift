//
//  Router.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 14/10/22.
//

import Foundation
// - Create URLComponents and build the url for request;
struct Router {
    var path: String
    var params: [String: String] = [:]
}

extension Router {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.openweathermap.org"
        components.path = "/" + path
        components.queryItems = params.map({ (key, value) -> URLQueryItem in
            URLQueryItem(name: key, value: String(value))
        })
        guard let url = components.url else {
            preconditionFailure(
                "Invalid URL Components: \(components)"
            )
        }
        return url
    }
}
