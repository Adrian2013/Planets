//
//  ServiceError.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-06.
//

import Foundation

enum APIServiceError: Error {
    
    case ErrorMessage(message:String)
    
}

enum GetPlanetFailureReason: Int, Error {
    
    case unAuthorized = 401
    case notFound = 404
    
}
