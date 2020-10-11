//
//  QuizGameViewController.swift
//  RiversideIOS
//
//  Created by Nicole Selig on 9/15/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import UIKit

class QuizGameViewController: UIViewController {
    
    //import QuizLogic Clas
    var quizLogic = QuizLogic()
    
    //MARK: Outlets And Buttons

    //UI outlets
    @IBOutlet weak var progressview: UIProgressView!
    @IBOutlet weak var questionCounter: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionView: UIImageView!
    
    //outlets for buttons
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    //MARK: Class Variables
    
    //game variables
    let questionBank = QuestionBank()
    var questionNumber: Int = 0
    var selectedAnswer: String = ""
    var newQuestion: Question!
    var questionObj: Question!
    var rightAnswer: String = ""
    let answers:[String] = ["happy", "sad", "angry", "disgust", "surprised", "neutral"]
    public var finalScore = ""
    
    //MARK: View Did Load
    
    //viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this makes the progress bar bigger
        progressview.transform = progressview.transform.scaledBy(x: 1, y: 5)
        
        progressview.progress = 0.0
       
        //deciding what questions we are going to pull
        //repetitions = how many questions
        //maxValue = how many pictures we have
        quizLogic.getArrayOfRandomNumbers(repetitions:10, maxValue: 12)
        quizLogic.resetScore()
        scoreLabel.text = String(quizLogic.getScore())
        updateQuestion()
        rightAnswer = questionObj.correctAnswer
    }
    
    //MARK: Update Question
    //loads a new question image into the UIview
    func updateQuestion(){
        //reset button colors
        option1.backgroundColor = UIColor.purple
        option2.backgroundColor = UIColor.purple
        option3.backgroundColor = UIColor.purple
        option4.backgroundColor = UIColor.purple
        
        //update score
        scoreLabel.text = String(quizLogic.getScore())
       
        //print(questionNumber)
        //print(numbers.count)
        //print("% progress =")
        //print(Float(questionNumber) / Float(numbers.count))
        
        //update the progress bar
        progressview.progress = (Float(questionNumber + 1) / Float (quizLogic.numbers.count))
        
        //set the question object
        newQuestion = questionBank.list[quizLogic.numbers[questionNumber]]
        questionObj = Question(questionImage: newQuestion.questionImage, correctAnswer: newQuestion.correctAnswer)
        var usedChoices: [String] = []
            
        //set the image
        questionView.image = UIImage(named: questionObj.questionImage)
        
        //set the buttons
        let correctAnswerPlacement = arc4random_uniform(4) + 1
        
        for i in 1...4 {
            
            //create a button reference
            let button = view.viewWithTag(i) as! UIButton
            
            if i == correctAnswerPlacement {
                button.setTitle(newQuestion.correctAnswer, for: .normal)
                usedChoices.append(newQuestion.correctAnswer)
                //print("usedChoices = ")
                //print(usedChoices)
            }
            else {
                var choice = quizLogic.getNewChoice()
                while choice == newQuestion.correctAnswer || usedChoices.contains(choice) {
                    choice = quizLogic.getNewChoice()
                }
                do {
                    button.setTitle(choice, for: .normal)
                    usedChoices.append(choice)
                  //  print("usedChoices")
                    //print(usedChoices)
                }
                
            }
        }
    }
    
    //MARK: Answer Pressed
    //all buttons are referenced to this function
    //to reference any button, open up the story board, click on the assistant button, and control-click and drag the button into the code
    @IBAction func answerPressed(_ sender: UIButton) {
        rightAnswer = questionObj.correctAnswer
        //control flow for buttons
        if sender.titleLabel?.text == rightAnswer {
            print("CORRECT")
            sender.backgroundColor = UIColor.green
            quizLogic.correctAnswerScore()
            let delaySeconds = 0.5
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delaySeconds) { [self] in
                questionNumber += 1
                if(questionNumber < quizLogic.numbers.count){
                    self.updateQuestion()
                }
                else{
                    print("Final Score")
                    print(quizLogic.getScore())
                    let finalVC = FinalScoreViewController()
                    finalVC.finalScore = String(quizLogic.getScore())
                    performSegue(withIdentifier: "QuizToScore", sender: self)
                }
            }
            
        }
        else{
            sender.backgroundColor = UIColor.red
            print("WRONG")
            quizLogic.incorrectAnswerScore()
        }
    }
    
    
    //MARK: Prepare Segue
    //this is how we pass the score value to the next finalScoreViewController. Anytime you need to pass data from one screen to another
    //use a prepare function like this one.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if the destination is FinalScoreVC
        if segue.destination is FinalScoreViewController
        {
            let vc = segue.destination as? FinalScoreViewController
            //the final score variable is the finalScore currently stored in the quiz logic class
            vc?.finalScore = String(quizLogic.getScore())
        }
    }

}
