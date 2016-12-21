//
//  ViewController.swift
//  Quiz
//
//  Created by Cecilia  Villatoro on 1/17/16.
//  Copyright (c) 2016 Cecilia  Villatoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var answerLabel: UILabel!

    //let is constant, cannot be changed
    let questions: [String] = ["From what is cognac mde?", "What is 7+7?", "What is the capital of Vermont?"]
    
    let answers: [String] = ["Grapes","14", "Montpelier"]
    
    //var means its value can be changed
    var currentQuestionIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        updateOffScreenLabel()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //set the label's initial alpha
        nextQuestionLabel.alpha = 0
    }
    
    @IBAction func showNextQuestion(sender: AnyObject){
        ++currentQuestionIndex
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        animateLabelTransitions()
        
        
    }
    
    func updateOffScreenLabel(){
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }
    @IBAction func showAnswer(sender: AnyObject){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    func animateLabelTransitions(){
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        UIView.animateWithDuration(0.5,
            delay: 0,
            options: [],
            animations: { self.currentQuestionLabel.alpha = 0
                          self.nextQuestionLabel.alpha = 1
                          self.view.layoutIfNeeded()},
            completion: { _ in
                swap(&self.currentQuestionLabel,
                    &self.nextQuestionLabel)
                swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCenterXConstraint)
                self.updateOffScreenLabel()
                })
    }
    

}

