//
//  QuizGameViewController.swift
//  RiversideIOS
//
//  Created by Nicole Selig on 9/15/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import UIKit

class QuizGameViewController: UIViewController {
    
    //import QuizLogic Class
    var quizLogic: QuizLogic?

    //UI outlets
    @IBOutlet weak var progressview: UIProgressView!
    @IBOutlet weak var questionCounter: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    @IBOutlet weak var questionView: UIImageView!
    
    //outlets for buttons
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    //game variables
    let questionBank = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: String = ""
    var numbers: [Int] = []
    var newQuestion: Question!
    var questionObj: Question!
    var rightAnswer: String = ""
    
    //viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this makes the progress bar bigger
        progressview.transform = progressview.transform.scaledBy(x: 1, y: 5)
       
        //deciding what questions we are going to pull
        //repetitions = how many questions
        //maxValue = how many pictures we have
        getArrayOfRandomNumbers(repetitions:10, maxValue: 12)
        
        updateQuestion()
        rightAnswer = questionObj.correctAnswer
    }
    
  
    
    //loads a new question image into the UIview
    func updateQuestion(){
        //set the question object
        newQuestion = questionBank.list[numbers[questionNumber]]
        questionObj = Question(questionImage: newQuestion.questionImage, correctAnswer: newQuestion.correctAnswer)
        
        //set the image
        questionView.image = UIImage(named: questionObj.questionImage)
        
        //set the buttons
        let correctAnswerPlacement = arc4random_uniform(4) + 1
        
        let answers:[String] = ["happy", "sad", "anger", "disgust", "surprised", "neutral"]
        
        for i in 1...4 {
            
            //create a button reference
            let button = view.viewWithTag(i) as! UIButton
            
            if i == correctAnswerPlacement {
                button.setTitle(newQuestion.correctAnswer, for: .normal)
            }
            else {
                var answersIndex = Int(arc4random_uniform(UInt32(answers.count)) + 1)
                while answers[answersIndex - 1] == newQuestion.correctAnswer {
                    answersIndex = Int(arc4random_uniform(UInt32(answers.count)) + 1)
                }
                do {
                    button.setTitle(answers[answersIndex - 1], for: .normal)
                }
                
            }
        }
    }
    
    //generates an array of random numbers, the size is the amount of questions in a game
    //...like pulling questions randomly from the bank
    func getArrayOfRandomNumbers(repetitions: Int, maxValue: Int) {
        
        guard maxValue >= repetitions
            else {
                fatalError("maxValue must be >= repetitions")
        }
        
        for _ in 1...repetitions {
            var n: Int
            repeat {
                n = random(maxValue: maxValue)
            }
            while numbers.contains(n)
            numbers.append(n)
        }
        print(numbers)
    }
    
    //helper function that generates a random number
    private func random(maxValue: Int) -> Int {
        return Int(arc4random_uniform(UInt32(maxValue)))
    }
    
    //all buttons are referenced to this function
    //to reference any button, open up the story board, click on the assistant button, and control-click and drag the button into the code
    @IBAction func answerPressed(_ sender: UIButton) {
        rightAnswer = questionObj.correctAnswer
        //control flow for buttons
        if sender.titleLabel?.text == rightAnswer {
            print("CORRECT")
            questionNumber = questionNumber + 1
            updateQuestion()
        }
        else{
            print("WRONG")
        }
    }

}
