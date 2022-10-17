//
//  ErrorHandler.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 14/10/22.
//

import Foundation

enum NetworkErrorsHandler: Error {
    case invalidData
    case invalidRequest
    case requestError
}
