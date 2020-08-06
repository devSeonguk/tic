//
//  Question.swift
//  BVisualNovel
//
//  Created by Seonguk Jeong on 28/07/2020.
//  Copyright © 2020 Seonguk Jeong. All rights reserved.
//

import Foundation

class Question {
    let text: String
    
    let answer: [String]
    
    let rightAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        rightAnswer = correctAnswer
    }
}
