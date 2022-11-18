//
//  UseCases.swift
//  AssignmentTests
//
//  Created by Senkordan Satchithananthan on 2022-11-18.
//

import XCTest
import RxSwift
import RxCocoa
import RxBlocking
@testable import Assignment

final class UseCasesTests: XCTestCase {
    
    var useCases: UseCases!
    var apiClient: AppApiClientMock!
    
    private let disposeBag = DisposeBag()
    
    override func setUp() {
        super.setUp()
        apiClient = AppApiClientMock()
        useCases = AppUseCases()
    }
    
    func testFetchPlanetsHasCorrentValue() {
        // arrange
        apiClient.responseValue = Single.just(TestUtils.stubbedResponse(responseJsonFileName: "planet_results",
                                                                        responseClass: PlanetsResponse.self,
                                                                        classType: type(of: self)))

        // act
        let planetResponse = try! useCases.fetchPlanets().toBlocking().first()!

        // assert
        XCTAssertEqual(planetResponse.results?.count, 10)
    }
    
}
