//
//  MockResumeService.swift
//  resume appTests
//
//  Created by Carlos Vázquez Gómez on 5/26/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation
@testable import resume_app

// MARK: - MockResumeService class
class MockResumeService: ResumeServiceProtocol {
    
    // MARK: - Attributes
    var shouldShowError = false
    
    // MARK: - Main Functions
    func fetchMainInfo(_ completion: @escaping completionHandler<ResumeResponse>) {
        let data = mockedData()
        let session = mockedSession(data: data!)
        let mockURL = URL(fileURLWithPath: "url")

        let task = session.dataTask(with: mockURL) { (data, _, error) in
            if let data = data {
                guard let object = try? JSONDecoder().decode(ResumeResponse.self, from: data) else {
                    completion(.failure(error: ServiceError.errorParse))
                    return
                }
                completion(.success(response: object))
            }
            
            if let error = error {
                completion(.failure(error: error))
            }
        }
        task.resume()
    }
    
    func mockedSession(data: Data) -> URLSessionMock {
        let session = URLSessionMock()
        if shouldShowError {
            session.data = nil
            session.error = ServiceError.badrequest
        } else {
            session.data = data
            session.error = nil
        }
        
        return session
    }
    
    func mockedData() -> Data? {
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.path(forResource: "mock_response", ofType: "json")
        let data = try? Data(contentsOf: URL(fileURLWithPath: path!), options: .alwaysMapped)
        return data
    }
}
