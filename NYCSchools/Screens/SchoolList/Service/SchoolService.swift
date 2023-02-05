//
//  SchoolService.swift
//  NYCSchools
//
//  Created by SwethaVipinKumar on 11/01/23.
//

import Foundation

protocol SchoolsServiceProtocol : AnyObject {
    func fetchSchool(completion: @escaping ([SATScoreModel]?, Error?) -> ())
}

class SchoolService: SchoolsServiceProtocol {
    private var request: APIRequest<SchoolResource>?
    
    // MARK: - Protocol Function
    func fetchSchool(completion: @escaping ([SATScoreModel]?, Error?) -> ()) {
        let resource = SchoolResource()
        let request = APIRequest(resource: resource)
        self.request =  request
        request.execute(withCompletion: completion)
    }
}
