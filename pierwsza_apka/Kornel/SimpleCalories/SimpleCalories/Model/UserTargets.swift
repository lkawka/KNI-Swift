//
//  UserTargets.swift
//  SimpleCalories
//
//  Created by Kornel on 04/03/2018.
//  Copyright © 2018 Kornel Skorka. All rights reserved.
//

import Foundation

struct UserTargets{
    var fat: Int
    var carbs: Int
    var protein: Int
var calories: Int
    init(_fat: Int, _carbs: Int, _protein: Int){
        fat = _fat
        carbs = _carbs
        protein = _protein
        calories = _fat*9 + _carbs * 4 + _protein * 4
    }
}
