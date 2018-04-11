//
//  PONTests.swift
//  PONTests
//
//  Created by 123 on 11.04.2018.
//  Copyright © 2018 123. All rights reserved.
//

import XCTest
@testable import PON

class Fake_FoodService: Gettable {
    typealias Data = [Food]
    
    init() {
        self.food = [Food(), Food(), Food(), Food()]
    }
    
    var getWasCalled = false
    // you can assign a failure result here
    // to test that scenario as well
    // the food here is just an array of food for testing purposes
    let food: [Food]
    
    func get(completionHandler: (Result<[Food]>) -> Void) {
        getWasCalled = true
        let result = Result.Success(food)
        completionHandler(result)
    }
}

class PONTests: XCTestCase {
    
    var viewController: ViewController!
    var food: [Food]!
    
    override func setUp() {
        super.setUp()
        
        food = [Food(), Food(), Food(), Food()]
        
        viewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as! ViewController?
    }
  
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testFetchFood_Success() {
        // inject
        let fakeFoodService = Fake_FoodService()
        viewController.getFood(fromService: fakeFoodService)
        guard let food = food else { return }
        
        XCTAssertTrue(fakeFoodService.getWasCalled)
        XCTAssertEqual(viewController.dataSource.count, food.count)
    }
    
}















