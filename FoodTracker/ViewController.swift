//
//  ViewController.swift
//  FoodTracker
//
//  Created by Mike on 2/4/18.
//  Copyright © 2018 Mike. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //-----------------------------------------------------
    
    @IBOutlet weak var ratingControl: RatingControl!
    //-----------------------------------------------------
    
    @IBOutlet weak var photoImageView: UIImageView!
    //-----------------------------------------------------
    
    
    //-----------------------------------------------------
    
    @IBOutlet weak var inputNameField: UITextField!
    //-----------------------------------------------------
    
    @IBOutlet weak var mealNameLabel: UILabel!
    //-----------------------------------------------------
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    //-----------------------------------------------------
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        mealNameLabel.text = textField.text
    }
    //-----------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputNameField.delegate = self
    }
    //-----------------------------------------------------
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        inputNameField.resignFirstResponder()
        let imagePickerCOntroller = UIImagePickerController()
        imagePickerCOntroller.sourceType = .photoLibrary
        imagePickerCOntroller.delegate = self
        present(imagePickerCOntroller, animated: true, completion: nil)
    }
    //-----------------------------------------------------
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    //-----------------------------------------------------
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")}
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
}

