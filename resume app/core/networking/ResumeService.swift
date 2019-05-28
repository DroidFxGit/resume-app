//
//  ResumeService.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation

// MARK: - ResumeService class
class ResumeService: BaseService<ResumeResponse> {
    
    // MARK: - Attributes
    private let mainPath = ConfigurationUtils.value(.mainURL)
}

// MARK: - ResumeServiceProtocol implementation
extension ResumeService: ResumeServiceProtocol {
    
    // MARK: - Public methods
    func fetchMainInfo(_ completion: @escaping completionHandler<ResumeResponse>) {
        guard let url = URL(string: mainPath) else {
            completion(.failure(error: ServiceError.badrequest))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = HttpMethod.get.rawValue
        perform(request: request, completion: completion)
    }
}
