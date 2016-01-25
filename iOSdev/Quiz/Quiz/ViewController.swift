//
//  ViewController.swift
//  Quiz
//
//  Created by Cecilia  Villatoro on 1/17/16.
//  Copyright (c) 2016 Cecilia  Villatoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!

    //let is constant, cannot be changed
    let questions: [String] = ["From what is cognac mde?", "What is 7+7?", "What is the capital of Vermont?"]
    
    let answers: [String] = ["Grapes","14", "Montpelier"]
    
    //var means its value can be changed
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    
    @IBAction func showNextQuestion(sender: AnyObject){
        ++currentQuestionIndex
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
        
    }
    @IBAction func showAnswer(sender: AnyObject){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    

}

