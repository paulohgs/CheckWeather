//
//  HomeViewModel.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 13/10/22.
//
import Foundation

class WeatherViewModel {
    var weatherInfos: Observable<WeatherModel> = Observable(WeatherModel.weatherMainModel)
    var session: URLSession!
    let apiManager: APIManager
    let apiKey: String
    init(session: URLSession = .shared) {
        self.session = session
        self.apiKey = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? "Invalid apiKey"
        self.apiManager = APIManager(session: session)
    }
    func getCitiesByName() {
        let query = [
            "q": ["Crato", "BR-CE", "BRA"].joined(separator: ","),
            "appid": apiKey,
            "units": "metric",
            "lang": "pt_br"
        ]
        apiManager.fetchAPI(urlRequest: Router(path: "data/2.5/weather", params: query).urlRequest) { result in
            switch result {
            case .success(let data):
                self.weatherInfos.value = data
            case .failure(let error):
                if error == .requestError {
                    print("requisiçao invalida")
                } else if error == .invalidData {
                    print("Dados invalidos.")
                }
            }
        }
    }
}
