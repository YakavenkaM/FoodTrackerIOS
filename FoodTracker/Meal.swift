//
//  Meal.swift
//  FoodTracker
//
//  Created by Mike on 2/5/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class Meal{
    var name: String
    var rating: Int
    var photo: UIImage?
    
    //MARK: initialize properties
    
    init?(name: String, rating: Int, photo: UIImage?){
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    
}
