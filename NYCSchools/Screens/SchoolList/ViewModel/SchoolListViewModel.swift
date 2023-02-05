//
//  SchoolListViewModel.swift
//  NYCSchools
//
//  Created by SwethaVipinKumar on 11/01/23.
//

import Foundation

class SchoolListViewModel: SchoolListViewModelProtocol {
    
    // MARK: - Protocol Properties
    var schoolLists: Dynamic<[SATScoreModel]?> = Dynamic(nil)
    var error: Dynamic<String?> = Dynamic(nil)
    
    // MARK: - Properties
    private var schoolsService: SchoolsServiceProtocol
    
    // MARK: - initializer
    init(withService service: SchoolsServiceProtocol) {
        // perform initialization
        self.schoolsService = service
    }
    
    // MARK: - Protocol function
    func fetchSchoolList() {
        /// show Activity indicator
        Loader.shared.showLoadingView(true)
        
        /// fetch school from server
        schoolsService.fetchSchool() { [weak self] (data, err) in
            /// hide Activity indicator
            Loader.shared.showLoadingView(false)
            
            /// Bind data
            if let _data = data {
                self?.schoolLists.value = _data
            } else {
                self?.error.value = err?.localizedDescription ?? Errors.NoData.rawValue
            }
        }
    }
}
