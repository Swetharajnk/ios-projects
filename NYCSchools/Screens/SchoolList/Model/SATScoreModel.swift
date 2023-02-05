//
//  SATScoreModel.swift
//  NYCSchools
//
//  Created by SwethaVipinKumar on 11/01/23.
//

import Foundation

// MARK: - SATScoreModel
struct SATScoreModel: Codable {
    var dbn, schoolName, numOfSatTestTakers, satCriticalReadingAvgScore: String?
    var satMathAvgScore, satWritingAvgScore: String?
    
    enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
}
