//
//  ResumeServiceProtocol.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/26/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation

// MARK: - ResumeServiceProtocol
protocol ResumeServiceProtocol {
    func fetchMainInfo(_ completion: @escaping completionHandler<ResumeResponse>)
}
