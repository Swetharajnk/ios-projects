//
//  SchoolListViewModelProtocol.swift
//  NYCSchools
//
//  Created by SwethaVipinKumar on 11/01/23.
//

import Foundation

protocol SchoolListViewModelProtocol {
    var schoolLists: Dynamic<[SATScoreModel]?> { get }
    var error: Dynamic<String?> { get }
    func fetchSchoolList()
}

