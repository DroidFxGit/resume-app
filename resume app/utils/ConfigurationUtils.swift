//
//  ConfigurationUtils.swift
//  resume app
//
//  Created by Carlos Vázquez Gómez on 5/12/19.
//  Copyright © 2019 Carlos Vázquez Gómez. All rights reserved.
//

import Foundation

// MARK: - ConfigurationUtils struct
struct ConfigurationUtils {
    
    // MARK: - DictionaryKey enum
    /// enumeration for constants from Info.plist
    enum DictionaryKey: String {
        case mainURL
        case linkedinURL
        case githubURL
        
        static func value(_ key: DictionaryKey) -> String {
            return key.rawValue
        }
    }
    
    // MARK: - Public methods
    public static func value(_ key: DictionaryKey) -> String {
        return infoDictionary[DictionaryKey.value(key)] as! String
    }
    
    // MARK: - Private methods
    fileprivate static var infoDictionary: [String: Any] = {
        guard let dictionary = Bundle.main.infoDictionary else {
            fatalError("Info.plist cannot be found")
        }
        return dictionary
    }()
}
