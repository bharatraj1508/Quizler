//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let match = quizBrain.checkAnswer(userAnswer)
        
        if match {
            sender.backgroundColor = UIColor.green
        }
        else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        //This below line of code will execute after 0.2 sec when the button is clicked
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            self.updateUI()
        })
       
        //MARK: - Another method to perform the delay between two consective changes
        /*
         This can also be done using the Timer.scheduleTimer method
         This is the example below for that
         
         Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
         */
    }
    
    //MARK: - If using Timer.ScheduleTimer method we need to make below fucntion of object C by using @objc annotation
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        progressBar.progress = quizBrain.getProgress()
    }
    
}

