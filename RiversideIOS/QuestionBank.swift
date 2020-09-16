//
//  QuestionBank.swift
//  RiversideIOS
//
//  Created by Mom on 9/15/20.
//  Copyright © 2020 Butler University EPICS. All rights reserved.
//

import Foundation

class QuestionBank {
    
    //list (array) of questions
    var list = [Question]()
    
    init(){
        list.append(Question(questionImage: "happy1", correctAnswer: "happy"))
        list.append(Question(questionImage: "happy2", correctAnswer: "happy"))
        list.append(Question(questionImage: "sad1", correctAnswer: "sad"))
        list.append(Question(questionImage: "sad2", correctAnswer: "sad"))
        list.append(Question(questionImage: "angry1", correctAnswer: "angry"))
        list.append(Question(questionImage: "angry2", correctAnswer: "angry"))
        list.append(Question(questionImage: "surprised1", correctAnswer: "surprised"))
        list.append(Question(questionImage: "surprised2", correctAnswer: "surprised"))
        list.append(Question(questionImage: "neutral1", correctAnswer: "neutral"))
        list.append(Question(questionImage: "neutral2", correctAnswer: "neutral"))
        list.append(Question(questionImage: "disgust1", correctAnswer: "disgust"))
        list.append(Question(questionImage: "disgust2", correctAnswer: "disgust"))
    }
}
