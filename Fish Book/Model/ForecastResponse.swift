//
//  ForcastResponse.swift
//  Fish Book
//
//  Created by mostafa on 29/02/2024.
//

import Foundation



import Foundation

struct ForecastResponse: Codable {
    let forecast: Forecast
}

struct Forecast: Codable {
    let forecastday: [ForecastDay]
}

struct ForecastDay: Codable {
     let date: String
     let day: Day
    let hour: [Hour]
}

struct Day: Codable {
    let maxtemp_c: Double
    let mintemp_c: Double
    let avgtemp_c: Double
    let maxwind_kph: Double
    let avghumidity:Int
    let daily_chance_of_rain:Int
    let condition: Condition
}
struct Condition: Codable{
    let text:String
    let icon:String
}

struct Hour: Codable {
    let time: String
    let temp_c: Double
    let condition: Condition
    let wind_kph: Double
    let wind_dir: String
    let humidity:Int
    let cloud:Int
    let chance_of_rain:Int
}


///let apiService  = APIServices.shared



