//
//  MockCountriesService.swift
//  NYCSchoolsTests
//
//  Created by SwethaVipinKumar on 11/01/23.
//

import Foundation
@testable import NYCSchools

class MockSchoolService: SchoolsServiceProtocol {
    func fetchSchool(completion: @escaping ([SATScoreModel]?, Error?) -> ()) {
        if let data = scoreModels {
            completion(data, nil)
        } else {
            completion(nil, ErrorResult.custom(string: "mock Error"))
        }
    }
    
    // MARK: - Properties
    var scoreModels: [SATScoreModel]?
    
}
