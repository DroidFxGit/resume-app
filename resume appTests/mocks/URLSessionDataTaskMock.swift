//
//  URLSessionDataTaskMock.swift
//  resume appTests
//
//  Created by Carlos Vázquez Gómez on 5/26/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation

// MARK: - URLSessionDataTaskMock class
class URLSessionDataTaskMock: URLSessionDataTask {
    
    // MARK: - Attributes
    private let closure: () -> Void
    
    // MARK: - Initializers
    init(closure: @escaping () -> Void) {
        self.closure = closure
    }
    
    // MARK: - Main Functions
    override func resume() {
        closure()
    }
}
