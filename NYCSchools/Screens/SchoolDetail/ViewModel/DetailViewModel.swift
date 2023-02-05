//
//  detailViewModel.swift
//  NYCSchools
//
//  Created by SwethaVipinKumar on 11/01/23.
//

import Foundation


class DetailViewModel: DetailViewModelProtocol {
 
    // MARK: - Protocol Properties
    let satScore: SATScoreModel
   
    // MARK: - initializer
    init(satScore: SATScoreModel) {
        self.satScore = satScore
        
    }
    
    
}

