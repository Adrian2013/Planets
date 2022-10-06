//
//  PlanetsTests.swift
//  PlanetsTests
//
//  Created by Dhanushka Adrian on 2022-10-05.
//
import Foundation
import RxCocoa
import XCTest
import Alamofire
@testable import Planets

class PlanetsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    
    func test_api_for_get_60_records_per_page() {
        
        PlanetService().getPlanets(completion: { (result) in

            switch result{
            case let .success(data):
                XCTAssertEqual(data.count ,60)
            case let .failure(error):
                XCTAssertNotNil(error.localizedDescription)
                  
            }
        })
    }
    
    func test_ViewModel() {
        
         let planetViewModel:PlanetViewModel = PlanetViewModel(
            service: PlanetService()
        )
        XCTAssertNotNil(planetViewModel.getPlanetsList())
       
    }

}
