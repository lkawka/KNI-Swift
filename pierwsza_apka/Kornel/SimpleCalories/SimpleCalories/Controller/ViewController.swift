//
//  ViewController.swift
//  SimpleCalories
//
//  Created by Kornel on 03/03/2018.
//  Copyright © 2018 Kornel Skorka. All rights reserved.
//

import UIKit
import GTProgressBar

class ViewController: UIViewController {
    
    @IBOutlet weak var totalCalories: UILabel!
    @IBOutlet weak var totalCarbs: UILabel!
    @IBOutlet weak var totalFat: UILabel!
    @IBOutlet weak var totalProtein: UILabel!
    
    @IBOutlet weak var caloriesBar: GTProgressBar!
    @IBOutlet weak var carbsBar: GTProgressBar!
   @IBOutlet weak var fatBar: GTProgressBar!
    @IBOutlet weak var proteinBar: GTProgressBar!
    
    @IBOutlet weak var carbsTextField: UITextField!
    @IBOutlet weak var fatTextField: UITextField!
    @IBOutlet weak var proteinTextField: UITextField!
    
    var user = UserTargets(_fat: 100, _carbs: 220, _protein: 160)
    var currentProtein = 0
    var currentCarbs = 0
    var currentFat = 0
    var currentCalories = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        self.setUI()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUI(){
        totalCalories.text = "\(currentCalories)/\(user.calories)"
        totalCarbs.text = "\(currentCarbs)/\(user.carbs)"
        totalFat.text = "\(currentFat)/\(user.fat)"
        totalProtein.text = "\(currentProtein)/\(user.protein)"
        caloriesBar.progress = CGFloat(currentCalories)/CGFloat(user.calories)
        //print(caloriesBar.progress)
        carbsBar.progress = CGFloat(currentCarbs)/CGFloat(user.carbs)
        fatBar.progress = CGFloat(currentFat)/CGFloat(user.fat)
        proteinBar.progress = CGFloat(currentProtein)/CGFloat(user.protein)
        
    }
    @IBAction func addMeal(_ sender: Any) {
        if let carbs = carbsTextField.text{
            if carbs != ""{
           currentCarbs += Int(carbs)!
            }
        }
        if let protein = proteinTextField.text{
            if protein != ""{
            currentProtein += Int(protein)!
            }
        }
        if let fat = fatTextField.text{
            if fat != ""{
            currentFat += Int(fat)!
            }
        }
        currentCalories = currentCarbs*4 + currentProtein*4 + currentFat * 9
        carbsTextField.text = nil
        fatTextField.text = nil
        proteinTextField.text = nil
        self.setUI()
    }
    
    
    
}

