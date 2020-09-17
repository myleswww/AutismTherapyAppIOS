//
//  QuizGameViewController.swift
//  RiversideIOS
//
//  Created by Mom on 9/15/20.
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
        
        
        // Do any additional setup after loading the view.
    }
    
    //all buttons are referenced to this function
    //to reference any button, open up the story board, click on the assistant button, and control-click and drag the button into the code
    @IBAction func answerPressed(_ sender: UIButton) {
        
        //control flow for buttons
        switch sender {
            case option1:
                print("option1")
                break
            case option2:
                print("option2")
                break
            case option3:
                print("option3")
                break
            case option4:
                print("option4")
                break
            default:
                break
        }
    }
    
    //loads a new question image into the UIview
    func updateQuestion(){
        questionView.image = UIImage(named: questionBank.list[numbers[questionNumber]].questionImage)
       
    }
    
    //generates an array of random numbers, the size is the amount of questions in a game
    //...like pulling questions randomly from the bank
    func getArrayOfRandomNumbers(repetitions: Int, maxValue: Int) -> [Int]{
        
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
        return numbers
    }
    
    //helper function that generates a random number
    private func random(maxValue: Int) -> Int {
        return Int(arc4random_uniform(UInt32(maxValue)))
    }
    
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
