//
//  Constants.swift
//  CryptoApp-VIPER
//
//  Created by Bahittin on 28.10.2023.
//

import Foundation

enum Constants {
    static let apiUrl = "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json"
}

enum NetworkError: String, Error {
    case NetworkFailed = "There is a network error please try again later"
    case ParsingError  = "Something goes wrong with parsing please try again later"
}
