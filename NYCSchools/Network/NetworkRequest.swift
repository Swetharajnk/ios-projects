//
//  NwtworkRequest.swift
//  NYCSchools
//
//  Created by SwethaVipinKumar on 11/01/23.
//

import Foundation
import UIKit

// MARK: - NetworkRequest
protocol NetworkRequest: AnyObject {
    associatedtype ModelType
    func decode(_ data: Data) -> ModelType?
    func execute(withCompletion completion: @escaping (ModelType?,Error?) -> Void)
}

extension NetworkRequest {
    func load(_ url: URL, withCompletion completion: @escaping (ModelType?,Error?) -> Void) {
        var request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, _ , err) -> Void in
            guard let data = data, let value = self?.decode(data) else {
                DispatchQueue.main.async { completion(nil,err) }
                return
            }
            
            DispatchQueue.main.async { completion(value,nil) }
        }
        task.resume()
    }
}
