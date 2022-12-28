//
//  APIManagerTests.swift
//  CheckWeatherTests
//
//  Created by Paulo Henrique Gomes da Silva on 20/10/22.
//

import XCTest
@testable import CheckWeather

final class APIManagerTests: XCTestCase {
    // testes da camada de network
    func test_networkSession_networkResultIsSuccess() {
        // given
        let session = NetworkSessionMock()
        session.data = loadDataMock()
        let apiManager = APIManager(session: session)

        let expectedWeatherModel = loadWeatherModelMock()
        let expectation = XCTestExpectation(description: "Result sent by completion")

        // when
        apiManager.fetchAPI(urlRequest: mockEmptyURLRequest()) { result in
            expectation.fulfill()

            // then
            switch result {
            case .success(let model):
                XCTAssertEqual(model.id, expectedWeatherModel.id)
            case .failure:
                XCTFail("Failure was not supposed to be returned")
            }
        }

        wait(for: [expectation], timeout: 2)
    }

    // swiftlint:disable force_try
    func loadDataMock() -> Data {
        let url = Bundle.main.url(forResource: "data", withExtension: "json")!
        return try! Data(contentsOf: url)
    }

    func loadWeatherModelMock() -> WeatherModel {
        WeatherModel(
            coord: .init(lon: 10.99, lat: 44.34),
            weather: [
                .init(id: 501, main: "Rain", weatherDescription: "moderate rain", icon: "10d")
            ],
            base: "stations",
            main: .init(
                temp: 298.48,
                feelsLike: 298.74,
                tempMin: 297.56,
                tempMax: 300.05,
                pressure: 1015,
                humidity: 64
            ),
            visibility: 10000,
            wind: .init(speed: 0.64, deg: 349),
            clouds: .init(all: 100),
            datatime: 1661870592,
            sys: .init(type: 2, id: 2075663, country: "IT", sunrise: 1661834187, sunset: 1661882248),
            timezone: 7200,
            id: 3163858,
            name: "Zocca",
            cod: 200
        )
    }

    func mockEmptyURLRequest() -> URLRequest {
        URLRequest(url: URL(fileURLWithPath: "url"))
    }
}
