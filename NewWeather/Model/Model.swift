//
//  Model.swift
//  NeoFin
//
//  Created by Nurzhan Ababakirov on 3/8/20.
//  Copyright © 2020 Nurzhan Ababakirov. All rights reserved.

import Foundation

// MARK: - WeatherFive
struct WeatherFive: Codable {
    let cod: String
    let message, cnt: Int
    let list: [List]
    let city: City
}

// MARK: - City
struct City: Codable {
    let id: Int
    let name: String
    let coord: Coord
    let country: String
    let population, timezone, sunrise, sunset: Int
}

// MARK: - Coord
struct Coord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
    let clouds: Clouds
    let wind: Wind
    let visibility: Int
    let pop: Double
    let sys: Sys
    let dt_txt: String
    let snow: Snow?
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
}

// MARK: - MainClass
struct MainClass: Codable {
    let temp, feels_like, temp_min, temp_max: Double
    let pressure, sea_level, grnd_level, humidity: Int
    let temp_kf: Double
}

// MARK: - Snow
struct Snow: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let pod: String
}


// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}

// MARK: - WeatherOne
struct WeatherOneStruct: Codable {
    let coord: CoordOne
    let weather: [WeatherOne]
    let base: String
    let main: MainOne
    let visibility: Int
    let wind: WindOne
    let clouds: CloudsOne
    let dt: Int
    let sys: SysOne
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct CloudsOne: Codable {
    let all: Int
}

// MARK: - Coord
struct CoordOne: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct MainOne: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct SysOne: Codable {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct WeatherOne: Codable {
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct WindOne: Codable {
    let speed, deg: Int
}
