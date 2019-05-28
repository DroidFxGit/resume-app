//
//  BaseService.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation

import Foundation

// MARK: - HttpMethod enum
/// enumeration for different HTTP methods
enum HttpMethod: String {
    case get = "GET"
}

// MARK: - ServiceResponse enum
/// enumeration for response options in request
enum ServiceResponse<T> {
    case success(response: T)
    case failure(error: Error)
}

// MARK: - ServiceError enum
/// enumeration with different types of error
enum ServiceError: Error {
    case errorParse
    case badrequest
    case unknown
}

// MARK: - StatusCode enum
/// enumeration with response status numbers
enum StatusCode: Int {
    case success = 200
    
    static func value(_ key: StatusCode) -> Int {
        return key.rawValue
    }
}

// MARK: - Blocks
typealias completionHandler<T> = (ServiceResponse<T>) -> Void

// MARK: - BaseService class
class BaseService<T: Codable> {
    
    // MARK: - Attributes
    fileprivate var session: URLSession
    
    // MARK: - Initializers
    init(_ session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    // MARK: - Public methods
    /**
     Executes dataTask for any given request and specified Codable
     
     - Parameter request: a common URLRequest
     - Parameter completion: closure that returns success or error
     */
    func perform(request: URLRequest, completion: @escaping completionHandler<T>) {
        
        let dataTask = session.dataTask(with: request) { [weak self] (data, urlResponse, error) in
            guard let strongSelf = self else { return }
            
            if let error = error {
                completion(.failure(error: error))
            }
            
            let successStatus = StatusCode.value(.success)
            guard let response = urlResponse as? HTTPURLResponse, response.statusCode == successStatus, let data = data else {
                completion(.failure(error: ServiceError.badrequest))
                return
            }
            
            strongSelf.processSuccessResponse(data: data, completion: completion)
        }
        dataTask.resume()
    }
    
    /**
     Parse JSON data into an specified Codable Object
     
     - Parameter data: data obtained from service
     */
    func parse(data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    // MARK: - Private methods
    /**
     returns completion after parse correctly data or error if fails
     
     - Parameter data: data obtained from service
     - Parameter completion: closure that returns success or error
     */
    private func processSuccessResponse(data: Data, completion: @escaping completionHandler<T>) {
        do {
            let responseModel = try parse(data: data)
            completion(.success(response: responseModel))
        } catch let error {
            completion(.failure(error: error))
        }
    }
}
