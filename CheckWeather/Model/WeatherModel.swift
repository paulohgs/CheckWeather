//
//  WeatherModel.swift
//  CheckWeather
//
//  Created by Paulo Henrique Gomes da Silva on 13/10/22.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - Weather
struct WeatherModel: Decodable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let datatime: Int?
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
    public static var weatherMainModel: WeatherModel = WeatherModel(
        coord: Coord.coordModel,
        weather: [Weather.weatherModel],
        base: "", main: Main.mainModel,
        visibility: 0, wind: Wind.windModel,
        clouds: Clouds.cloudsModel,
        datatime: 0,
        sys: Sys.sysModel,
        timezone: 0,
        id: 0,
        name: "",
        cod: 0
    )
}

// MARK: - Clouds
struct Clouds: Decodable {
    let all: Int
    public static var cloudsModel: Clouds = Clouds(all: 0)
}

// MARK: - Coord
struct Coord: Decodable {
    let lon, lat: Double
    public static var coordModel: Coord = Coord(lon: 0.0, lat: 0.0)
}

// MARK: - Main
struct Main: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
    public static var mainModel: Main = Main(temp: 0.0, feelsLike: 0.0, tempMin: 0.0, tempMax: 0.0, pressure: 0, humidity: 0)
}

// MARK: - Sys
struct Sys: Decodable {
    let type: Int?
    let id: Int?
    let country: String
    let sunrise, sunset: Int
    public static var sysModel: Sys = Sys(type: 0, id: 0, country: "", sunrise: 0, sunset: 0)
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
    public static var weatherModel: Weather = Weather(id: 0, main: "", weatherDescription: "", icon: "")
}

// MARK: - Wind
struct Wind: Decodable {
    let speed: Double
    let deg: Int
    public static var windModel: Wind = Wind(speed: 0.0, deg: 0)
}
