//
//  QuizLogic.swift
//  RiversideIOS
//
//  Created by Mom on 9/17/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import Foundation

//This class serves up all the logic for the Quiz
public class QuizLogic {
    
    //MARK: Class Variables
    public var score: Int = 0
    var numbers: [Int] = []
    let answers:[String] = ["happy", "sad", "angry", "disgust", "surprised", "neutral"]
    
    
    //MARK: Get Score
    func getScore() -> Int {
        return score
    }
    
    //MARK: Correct Answer Score
    func correctAnswerScore() {
       
            score += 100
        
    }
    
    //MARK: Incorrect Answer Score
    func incorrectAnswerScore() {
        
            score -= 20
        
    }
    
    //MARK: Reset Score
    func resetScore() {
        
            score = 0
        
    }
    
    //MARK: Random
    //helper function that generates a random number
    private func random(maxValue: Int) -> Int {
        return Int(arc4random_uniform(UInt32(maxValue)))
    }
    
    //MARK: get Array Of Random Numbers
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
        print("Questions Selected:")
        print(numbers)
    }
    
    //MARK: Get New Choice
    //sets a new choice
    func getNewChoice() -> String {
        let answersIndex = Int(arc4random_uniform(UInt32(answers.count)))
        //print("answersIndex")
        //print(answersIndex)
        let choice = answers[answersIndex]
        return choice
    }
    
}
