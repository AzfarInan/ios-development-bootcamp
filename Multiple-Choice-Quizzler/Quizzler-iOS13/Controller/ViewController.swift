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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var multipleChoiceOne: UIButton!
    @IBOutlet weak var multipleChoiceTwo: UIButton!
    @IBOutlet weak var multipleChoiceThree: UIButton!
    
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        scoreLabel.text = "Score: 0"
        updateUI()
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        if (sender.currentTitle == "Reset"){
            progressBar.progress = 0
            scoreLabel.text = "Score: 0"
            multipleChoiceOne.backgroundColor = UIColor.clear
            multipleChoiceTwo.backgroundColor = UIColor.clear
            multipleChoiceThree.backgroundColor = UIColor.clear
            scoreLabel.isHidden = false
            multipleChoiceOne.isHidden = false
            multipleChoiceTwo.isHidden = false
            multipleChoiceThree.isHidden = false
            quizBrain.resetQuiz()
            updateUI()
        }
        else {
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
    }
    
    @objc func updateUI() {
        multipleChoiceOne.backgroundColor = UIColor.clear
        multipleChoiceTwo.backgroundColor = UIColor.clear
        multipleChoiceThree.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        multipleChoiceOne.setTitle(quizBrain.getChoiceOne(), for: UIControl.State.normal)
        multipleChoiceTwo.setTitle(quizBrain.getChoiceTwo(), for: UIControl.State.normal)
        multipleChoiceThree.setTitle(quizBrain.getChoiceThree(), for: UIControl.State.normal)
        questionLabel.text = quizBrain.getQuestion()
    }
    
    @objc func gameOver() {
        scoreLabel.isHidden = true
        multipleChoiceOne.isHidden = true
        multipleChoiceTwo.setTitle("Reset", for: UIControl.State.normal)
        multipleChoiceThree.isHidden = true
        questionLabel.text = "It's Over\nCorrectly Answered \(quizBrain.getScore()) Out Of \(quizBrain.quiz.count)"
    }
    
}

