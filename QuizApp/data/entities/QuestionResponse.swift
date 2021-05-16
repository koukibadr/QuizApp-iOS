//
//  QuestionResponse.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 16/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import Foundation

class QuestionResponse {
    
    let response_code: Int?
    let results: [Question]?
    
    init(data: Dictionary<String,AnyObject>) {
        self.response_code = data["response_code"] as? Int
        self.results = []
        if let listOfQuestions = data["results"] as? [Dictionary<String,AnyObject>] {
            for item in listOfQuestions{
                self.results?.append(Question(data: item))
            }
        }
    }
    
}
