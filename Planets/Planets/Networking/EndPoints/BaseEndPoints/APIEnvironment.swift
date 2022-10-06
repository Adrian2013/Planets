//
//  APIEnvironment.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-06.
//

import Foundation

enum APIEnvironment {
    case development
    case staging
    case production
   
    func baseURL () -> String {
        return "https://\(subdomain()).\(domain())"
    }
    
    func domain() -> String {
        switch self {
        case .development:
            return "dev"
        case .staging:
            return "dev"
        case .production:
            return "dev"
        }
    }
    
    func subdomain() -> String {
        switch self {
        case .development, .production, .staging:
            return "swapi"
        }
    }
    
    
}
