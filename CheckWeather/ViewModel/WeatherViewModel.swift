//
//  HomeViewModel.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 13/10/22.
//

class WeatherViewModel {
    var weatherInfos: WeatherModel?
    let apiManager = APIManager(apiKey: "a7de71e44e183c1599278ddeb26caebe")
    init() {
        let query = [
            "q": ["Fortaleza", "BR-CE", "BRA"].joined(separator: ","),
            "appid": apiManager.apiKey,
            "units": "metric",
            "lang": "pt_br"
        ]
        apiManager.fetchAPI(url: Router(path: "data/2.5/weather", params: query).url) { result in
            switch result {
            case .success(let data):
                self.weatherInfos = data
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
