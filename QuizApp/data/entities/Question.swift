//
//  Question.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 16/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import Foundation

class Question {
    
    let category: String?
    let type: String?
    let difficulty: String?
    let question: String?
    let correct_answer: String?
    let incorrect_answers: [String]
    
    init(data: Dictionary<String, AnyObject>) {
        self.category = data["category"] as? String
        self.type = data["type"] as? String
        self.difficulty = data["difficulty"] as? String
        self.question = data["question"] as? String
        self.correct_answer = data["correct_answer"] as? String
        self.incorrect_answers = (data["incorrect_answers"] as? [String]) ?? []
    }
    
    public func details() -> String{
        return "Category: \(String(describing: self.category ?? "")) \n Type: \(String(describing: self.type ?? "")) \n Difficulty: \(String(describing: self.difficulty ?? ""))"
    }
    
}
