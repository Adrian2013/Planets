//
//  AppServerClient.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-06.
//

import Foundation
import Alamofire

/// Response for  handling api call  with server
class AppServerClient {
    
    typealias GetPlanetResult = Result<[PlanetModel], APIServiceError>
    typealias GetPlanetResponseCompletion = (_ result: GetPlanetResult) -> Void
    
    func getPlanets(completion: @escaping GetPlanetResponseCompletion) {
        
        let requestURL =  APIEndPoints().getPlanetsEndPoint
        
        let request = AF.request(requestURL , method: .get).validate()
        request.responseDecodable(of:PlanetsResultModel.self) { (response) in
            switch response.result {
                
            case .success:
                guard let planet = response.value else {
                 
                    completion(.failure(APIServiceError.ErrorMessage(message:PlanetErrorMessage.errorMessage)))
                    return
                    
                }
                
                completion(.success(planet.results))
                
            case let .failure(error):
                
                if let statusCode = response.response?.statusCode,
                   
                    let reason = GetPlanetFailureReason(rawValue: statusCode) {
                    completion(.failure(APIServiceError.ErrorMessage(message: error.localizedDescription + String(reason.rawValue))))
                }
                
                completion(.failure(APIServiceError.ErrorMessage(message: error.localizedDescription)))
                
            }
        }
    }
    
    
}
