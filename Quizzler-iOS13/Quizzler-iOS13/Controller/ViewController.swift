//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        scoreLabel.text = "Score: 0"
        updateUI()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            quizBrain.updateScore()
            sender.backgroundColor = UIColor.systemGreen
        } else {
            sender.backgroundColor = UIColor.systemRed
        }
        
        
        
        if quizBrain.quiz.count - 1 != quizBrain.getQuestionNumber() {
            quizBrain.goToNextQuestion()
            progressBar.progress = quizBrain.getProgress()
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else {
            progressBar.progress = 1
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(gameOver), userInfo: nil, repeats: false)
        }
    }
    
    @objc func updateUI() {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        questionLabel.text = quizBrain.getQuestion()
    }
    
    @objc func gameOver() {
        scoreLabel.isHidden = true
        trueButton.isHidden = true
        falseButton.isHidden = true
        questionLabel.text = "It's Over\nCorrectly Answered \(quizBrain.getScore()) Out Of \(quizBrain.quiz.count - 1)"
    }
    
}

