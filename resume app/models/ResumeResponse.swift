//
//  ResumeResponse.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation

// MARK: - ResumeResponse struct
/// Main structure for resume response
struct ResumeResponse: Codable {
    var profileURL: URL
    var name: String
    var title: String
    var description: String
    var education: Education
    var projects: [Project]
    var experience: [Company]
}
