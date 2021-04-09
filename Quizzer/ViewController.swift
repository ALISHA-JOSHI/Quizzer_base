//
//  ViewController.swift
//  Quizzer
//
//  Created by ALISHA JOSHI K on 02/04/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var bubbleView: UIImageView!
    @IBOutlet weak var btnTRUE: UIButton!
    @IBOutlet weak var btnFALSE: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var questionNumber = 0
//    let questionArray = ["Marrakesh is the capital of Morocco", " M&M stands for Mars and Moordale", "The unicorn is the national animal of Scotland" ]
    let questionArray = [Question(q: "A slug's blood is green.", a: "True"),
                         Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                         Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                         Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                         Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                         Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                         Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                         Question(q: "Google was originally called 'Backrub'.", a: "True"),
                         Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                         Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                         Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                         Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
]
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestionLabel()
        self.progressBar.progress = 0.0

    }

    
    @IBAction func TRUE_or_FALSE(_ sender: UIButton) {
        let enteredAnswer = sender.currentTitle ?? " "
        let actualAnswer = questionArray[questionNumber].answer
//        self.questionNumber += 1
        
//
        if enteredAnswer == actualAnswer{
            print("Right")
            btnTRUE.backgroundColor = UIColor.green
//            sender.backgroundColor = UIColor.green

        }else{
            print("Wrong")
//            sender.backgroundColor = UIColor.red
            btnFALSE.backgroundColor = UIColor.red


        }
//        if enteredAnswer == actualAnswer {
//                        print("Right")
//
//           sender.shortChangeTo(.green)
//        } else {
//                        print("Wrong")
//
//           sender.shortChangeTo(.red)
//        }
//
//        if sender.tag == 0 {
//            print("TRUE BUTTON")
//
//        }
        
        if self.questionNumber + 1 < questionArray.count{

            self.questionNumber += 1
            

        }else{
            self.questionNumber = 0
            progressBar.progress = 0.0

        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            self.updateQuestionLabel()
//        }
       
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestionLabel), userInfo: nil, repeats: false) 
        
    }
    
    @objc func updateQuestionLabel(){
        self.questionLabel.text = questionArray[questionNumber].question


        self.btnTRUE.backgroundColor = UIColor.clear
        self.btnFALSE.backgroundColor = UIColor.clear
        let totalQuestions = questionArray.count - 1
        let percentageProgress = Float(questionNumber)/Float(totalQuestions)
        self.progressBar.setProgress(Float(percentageProgress),animated:true)



        
    }
    
}
extension UIButton {
  func shortChangeTo(_ color:UIColor) {
    let prev = self.backgroundColor
    self.backgroundColor = color
    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
       self.backgroundColor = prev
    }
  }
}


