//
//  BMIBrain.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by BS851 on 26/5/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct BMIBrain {
    var bmi: Float = 0.0
    
    func getBmi() -> String {
        return String(format: "%.1f", bmi)
    }
    
    mutating func calculateBmi(height: Float, weight: Float){
        bmi = weight / Float(pow(Double(height), 2))
        
    }
}
