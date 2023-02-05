//
//  Constants.swift
//  NYCSchools
//
//  Created by SwethaVipinKumar on 11/01/23.
//

import Foundation

// MARK: - Url
enum UrlEnum {
    // Host
    static let baseURL = "https://data.cityofnewyork.us"
    // path
    static let satScore = "/resource/f9bf-2cp4.json"
}


// MARK: - Error 
enum Errors: String {
    case NOInternetConnection = "NO Internet Connection , Try Again"
    case NoData = "Data Not Available"
    case InvalidUrl = "Url Not Valid"
}

enum ErrorResult: Error {
    case custom(string: String)
}

enum ScreenTitle {
    static let Countries = "Countries"
}
