//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //IBOutlet allows me to  reference UI element
    @IBOutlet weak var diceImageViewOne: UIImageView!
    
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    var dice1 = UIImage(named: "DiceOne")
    var dice2 = UIImage(named: "DiceTwo")
    var dice3 = UIImage(named: "DiceThree")
    var dice4 = UIImage(named: "DiceFour")
    var dice5 = UIImage(named: "DiceFive")
    var dice6 = UIImage(named: "DiceSix")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        diceImageViewOne.image = dice1
        diceImageViewTwo.image = dice6
    }


    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let diceArray = [dice1, dice2, dice3, dice4, dice5, dice6]
        
        diceImageViewOne.image = diceArray[Int.random(in: 0...5)]
        
        diceImageViewTwo.image = diceArray[Int.random(in: 0...5)]
    }
}

