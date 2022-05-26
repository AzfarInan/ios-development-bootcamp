//
//  ResultViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by BS851 on 26/5/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var bmiValue: String?

    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bmiLabel.text = bmiValue

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
