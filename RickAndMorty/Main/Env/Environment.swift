//
//  Environment.swift
//  Main
//
//  Created by Renato Lopes on 04/01/21.
//

import Foundation

final class Environment {
    
    enum EnvironmentVariables: String {
        case apiBaseUrl = "API_BASE_URL"
    }
    
    static func variable(_ key: EnvironmentVariables) -> String? {
        let bundle: [String: Any]? = Bundle.main.infoDictionary
        return bundle?[key.rawValue] as? String
    }
}
