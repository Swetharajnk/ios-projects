//
//  APIResource.swift
//  NYCSchools
//
//  Created by SwethaVipinKumar on 11/01/23.
//

import Foundation

// MARK: - APIResource
protocol APIResource {
    associatedtype ModelType: Decodable
    var methodPath: String { get }
}

extension APIResource {
    var url: URL? {
        var components = URLComponents(string:UrlEnum.baseURL)!
        components.path = methodPath
        return components.url
    }
}

// MARK: - SchoolResource
struct SchoolResource: APIResource {
    typealias ModelType = [SATScoreModel]
    var queryValue: String?
    var methodPath: String {
        return UrlEnum.satScore
    }
}
