//
//  Question.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-29.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import Foundation

class Question {
    var question : String
    var answer : [String]
    var correctAnswer : Int
    
    init(question: String, answer: [String], correctAnswer: Int) {
        self.question = question
        self.answer = answer
        self.correctAnswer = correctAnswer
    }
    
    
//    var q1 = Question(question: "String", answer: ["String"], correctAnswer: 0)
//    var q2 = Question(question: "String", answer: ["String"], correctAnswer: 0)
//    var q3 = Question(question: "String", answer: ["String"], correctAnswer: 0)
//    var q4 = Question(question: "String", answer: ["String"], correctAnswer: 0)
//    var q5 = Question(question: "String", answer: ["String"], correctAnswer: 0)
    

    
}

// Store questions in array
// Store answers in array
// Call them in GameViewController
