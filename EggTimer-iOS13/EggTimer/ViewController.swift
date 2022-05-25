//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
//    var secondsRemaining = 60
    
    var secondsPassed = 0
    
    var totalTime = 0
    
    var timer = Timer()
    
    @IBOutlet weak var progressIndicator: UIProgressView!
    
    @IBOutlet weak var labelNotifier: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        
        progressIndicator.progress = 0
        secondsPassed = 0
        
        
        let hardness = sender.currentTitle!;
        
        labelNotifier.text = "Egg processing..."
        
        totalTime = eggTimes[hardness]!;
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressIndicator.progress = Float(secondsPassed) / Float(totalTime)
            } else {
            timer.invalidate()
            labelNotifier.text = "DONE!"
        }
    }
    
}
