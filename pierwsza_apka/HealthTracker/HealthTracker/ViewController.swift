//
//  ViewController.swift
//  HealthTracker
//
//  Created by Bartosz Cybulski on 07.03.2018.
//  Copyright © 2018 Bartosz Cybulski. All rights reserved.
//

import UIKit

class BMI{
    var weight:Int
    var size:Int
    lazy var bmi: Double = Double({
        return (Double(weight) * 10000) / ( Double(size) * Double(size) )
        }())
    
    init(_weight:Int, _size:Int){
        weight = _weight
        size = _size
    }
}

class ViewController: UIViewController , UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var bmi:Double = 0
    //MARK: Properties
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    
    @IBAction func countBMI(_ sender: UIButton) {
        let tmp = BMI(_weight:Int(weightTextField.text!)!, _size:Int(heightTextField.text!)!)
        bmi = tmp.bmi
        textFieldShouldReturn(weightTextField)
        textFieldShouldReturn(heightTextField)
        showBMI()
        clearTextFields()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearTextFields()
        showBMI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide keyboard
        textField.resignFirstResponder();
        return true
    }
    
    func clearTextFields(){
        weightTextField.text = ""
        heightTextField.text = ""
    }
    
    func showBMI(){
        bmiLabel.text = "BMI: \(bmi)"
    }
    
    /*func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
        
    }*/
    

/*    //MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide the keyboard
        nameTextField.resignFirstResponder()
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        // only allow to pick pictures , not take
        imagePickerController.sourceType = .photoLibrary
        // Make sure ViewController is notified when the user picks an image.
        imagePickerController.delegate = self
        present(imagePickerController, animated : true , completion: nil)
        
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker : UIImagePickerController){
        //Dismiss pickerControler if user canceled
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        // Set photoImageView to display the selected image.
        photoImageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    */
    


}

