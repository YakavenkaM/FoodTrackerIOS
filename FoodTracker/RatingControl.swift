//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Mike on 2/4/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    // MARK: add inspectable properties
    @IBInspectable var starSize: CGSize =  CGSize(width: 44.0, height: 44.0){
        didSet{
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet{
            setupButtons()
        }
    }
    
    // MARK:  init -------------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButtons()
    }
    
    
    
    required init(coder:  NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: Rating button -------------------------
    
    @objc func ratingButtontapped (button: UIButton){
        guard let index = ratingButtons.index(of: button )
            else {
                fatalError("the button \(button ) is not in the ratings Array \(ratingButtons) ")
        }
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        }
        else {
            rating = selectedRating
            
        }
        
        
    }
    private var ratingButtons = [UIButton]()
    var rating = 0{
        didSet{
            updateButtonStates()
        }
    }
    
    // MARK: Buttons setup func -------------------------
    
    private func setupButtons () {
        //clear buttons
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // connect images to buttons
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        // set up button stuff
        
        for index in 0..<starCount {
            let button = UIButton()
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage (highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            //add accesabillity
            button.accessibilityLabel = "set \(index+1 ) star rating "
            
            //make button respond to event action programatically
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtontapped(button:)), for: .touchUpInside)
            
            // add to stack view
            addArrangedSubview(button)
            // append buttons to an array
            ratingButtons.append(button)
            
        }
        updateButtonStates()
    }
    
    private func updateButtonStates(){
        for (index, button) in ratingButtons.enumerated(){
            button.isSelected = index < rating
            let hintString: String?
            if rating == index+1 {
                hintString = "tap first star to reset raiting"
            }
            else{
                hintString = nil
            }
            
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "no rating set"
            case 1:
                valueString = "1 star is set"
            default:
                valueString = "\(rating) stars set"
            }
            button.accessibilityValue = valueString
            button.accessibilityHint = hintString
            
        }
        
    }
}


