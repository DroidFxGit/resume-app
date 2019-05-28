//
//  Education.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation

// MARK: - Education struct
/// holder for Education section
struct Education: Codable {
    var imageURL: URL
    var university: String
    var career: String
    var period: String
}
