//
//  PlanetViewModel.swift
//  Planets
//
//  Created by Dhanushka Adrian on 2022-10-06.
//

import Foundation
import RxSwift


/// Receives data from VC, handles all this information, and sends it back to VC.
struct PlanetViewModel {
    
    private var planetService:PlanetService?
    let planets:PublishSubject<[PlanetModel]> = PublishSubject()
    let isLoading:PublishSubject<Bool> = PublishSubject()
    let error:PublishSubject<ServiceError> = PublishSubject()
    
    
    /// Initialize a new object (the receiver) immediately after memory for it has been allocated.
    /// - Parameter service: The planet api service
    init(service:PlanetService) {
        self.planetService = service
    }
    
    /// Get planet list
    func getPlanets() {
        isLoading.onNext(true)
        planetService?.getPlanets(completion: { (result) in
            isLoading.onNext(false)
            switch result{
            case let .success(data):
                planets.onNext(data)
            case let .failure(apiError):
                error.onNext(apiError)
            }
        })
        
    }
    
    
}

