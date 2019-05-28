//
//  URLSessionMock.swift
//  resume appTests
//
//  Created by Carlos Vázquez Gómez on 5/26/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation

// MARK: - URLSessionMock class
class URLSessionMock: URLSession {
    
    // MARK: - Attributes
    typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void
    
    var data: Data?
    var error: Error?
    
    // MARK: - Main Functions
    /**
     returns mocked dataTask with parameters
     
     - Parameter url: mocked URL
     - Parameter completion: closure that returns success or error
     */
    override func dataTask(with url: URL, completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
        let data = self.data
        let error = self.error
        return URLSessionDataTaskMock {
            completionHandler(data, nil, error)
        }
    }
}
