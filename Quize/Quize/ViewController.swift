//
//  ViewController.swift
//  Quize
//
//  Created by ouou on 2017/9/7.
//  Copyright © 2017年 ouou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    
    @IBOutlet var currentQuestionLabelCenterContraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabelCenterContraint: NSLayoutConstraint!
    
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["From what is cgnac made?",
                               "What is 7+7?",
                               "What is the capital of Vermont?"]
    
    let answers: [String] = ["Grapes",
                             "14",
                             "Montpelier"]
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        print("show next qu")
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        nextQuestionLabel.text = questions[currentQuestionIndex]
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        answerLabel.text = answers[currentQuestionIndex]
    }
    
    override func viewDidLoad() {
        print("view did load")
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterContraint.constant = -screenWidth
    }
    
    func animateLabelTransitions () {
        print("animate")
        view.layoutIfNeeded()
        
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterContraint.constant = 0
        self.currentQuestionLabelCenterContraint.constant += screenWidth
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.curveLinear],
                       animations: {
                        self.currentQuestionLabel.alpha = 0
                        self.nextQuestionLabel.alpha = 1
                        
                        self.view.layoutIfNeeded()
        },
                       completion: {(_in: Bool) -> Void in
                        swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
                        
                        swap(&self.currentQuestionLabelCenterContraint, &self.nextQuestionLabelCenterContraint)
                        
                        self.updateOffScreenLabel()
        })
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0
    }
}

