//
//  PlanetService.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-06.
//

import Foundation
import Alamofire




class PlanetService{
    
    func getPlanets(completion: @escaping (Result<[PlanetModel],APIServiceError>) -> Void){
        
        let requestURL =  APIEndPoints().getPlanetsEndPoint
        
        let request = AF.request(requestURL , method: .get).validate()
        
        request.responseDecodable(of:PlanetsResultModel.self) { (response) in
            
            switch response.result {
            case  .success:
                if let result = response.value {
                    completion(.success(result.results))
                }else{
                    completion(.failure(APIServiceError.ErrorMessage(message: "Unable to retrive data!")))
                }
            case let .failure(error):
                completion(.failure(APIServiceError.ErrorMessage(message: error.localizedDescription)))
            }
            
        }
    }
    
    
}
