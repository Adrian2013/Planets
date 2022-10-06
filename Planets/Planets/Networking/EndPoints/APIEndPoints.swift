//
//  APIEndPoints.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-06.
//

import Foundation

#if DEBUG
let environment = APIEnvironment.development
#else
let environment = APIEnvironment.production
#endif

let baseURL = environment.baseURL()

struct APIEndPoints {
    
    var getPlanetsEndPoint: String { return "\(baseURL)/api/planets"}

}

