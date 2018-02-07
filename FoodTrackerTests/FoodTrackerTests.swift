//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Mike on 2/4/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    func testOnMealSucceds (){
        let zeroRatingMeal = Meal.init(name: "zero", rating: 0, photo: nil)
        XCTAssertNotNil(zeroRatingMeal)
        
        let fivestarRating =  Meal.init(name: "positive", rating: 5, photo: nil)
        XCTAssertNotNil(fivestarRating)
    }
    
    func testFails(){
        let zeroMealFail = Meal.init(name: "poop", rating: -1, photo: nil)
        XCTAssertNil(zeroMealFail)
        
        let anotherFail =  Meal.init(name:"sdds", rating: 7 , photo: nil)
        XCTAssertNil(anotherFail)
    }
}
