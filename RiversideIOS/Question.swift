//
//  Question.swift
//  RiversideIOS
//
//  Created by Mom on 9/15/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import Foundation

//Question Object Class
class Question {
    
    //class variables
    let questionImage: String
    let correctAnswer: String
    
    //question constructor
    init(questionImage: String, correctAnswer: String){
        self.questionImage = questionImage
        self.correctAnswer = correctAnswer
    }
    
    
}
