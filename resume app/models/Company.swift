//
//  Company.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation

// MARK: - Project struct
/// holder for Company section
struct Company: Codable {
    var logoURL: URL
    var company: String
    var position: String
    var period: String
    var description: String
}
