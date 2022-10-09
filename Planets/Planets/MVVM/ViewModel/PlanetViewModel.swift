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
    
    private var appServerClient:AppServerClient?
   
    let errorPublishSubject:PublishSubject<APIServiceError> = PublishSubject()
    let loadingStatusPublishSubject:PublishSubject<Bool> = PublishSubject()
    let planetsPublisheSubject:PublishSubject<[PlanetModel]> = PublishSubject()


    /// Initialize a new object (the receiver) immediately after memory for it has been allocated.
    /// - Parameter service: The planet api service
    init(service:AppServerClient) {
        
        self.appServerClient = service
        
    }
    
    /// Get planet list
    func getPlanetsList() {
        
        loadingStatusPublishSubject.onNext(true)
        appServerClient?.getPlanets(completion: { (result) in
            loadingStatusPublishSubject.onNext(false)
            switch result{
            case let .success(data):
                planetsPublisheSubject.onNext(data)
            case let .failure(apiError):
                errorPublishSubject.onNext(apiError)
            }
        })
    
    }
    
    
}

