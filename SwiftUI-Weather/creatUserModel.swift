//
//  creatUserModel.swift
//  SwiftUI-Weather
//
//  Created by Mohamed Hammam on 24/12/2021.
//

import Foundation

// MARK: - CreatUserMode
struct CreatUserMode: Codable {
    let email, phone, password, name: String
    let userTypeID: Int

    enum CodingKeys: String, CodingKey {
        case email = "Email"
        case phone = "Phone"
        case password = "Password"
        case name = "Name"
        case userTypeID = "UserTypeId"
    }
}

// MARK: - WeatherModelElement
struct WeatherModelElement: Codable {
    let date: String
    let temperatureC, temperatureF: Int
    let summary: String

    enum CodingKeys: String, CodingKey {
        case date = "Date"
        case temperatureC = "TemperatureC"
        case temperatureF = "TemperatureF"
        case summary = "Summary"
    }
}

typealias WeatherModel = [WeatherModelElement]
