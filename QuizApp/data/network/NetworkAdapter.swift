//
//  NetworkAdapter.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 16/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import Foundation
import Alamofire

class NetworkAdapter {
    func fetchQuestions(categoryId: Int,callback: @escaping (NSDictionary?)->Void) {
        Alamofire.request("https://opentdb.com/api.php?amount=\(MAX_QUESTIONS)&type=multiple&category=\(categoryId)").responseJSON{ response in
            if let json: NSDictionary = response.result.value as? NSDictionary {
                callback(json)
            }
            else {
                callback(nil)
            }
        }
    }
}
