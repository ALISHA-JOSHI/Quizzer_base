//
//  Question.swift
//  Quizzer
//
//  Created by ALISHA JOSHI K on 05/04/21.
//

import Foundation

struct Question {
    var question : String //question
    var answer : String //true or fasle
    
    init(q: String, a: String) {
        self.question = q
        self.answer = a
    }
}
