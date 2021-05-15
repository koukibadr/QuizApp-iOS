//
//  SharedPrefController.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 15/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import Foundation

//Shared preferences
func getStorage()->UserDefaults{
    return UserDefaults.standard
}

func setUserData(mail: String, password: String){
    let defaults = getStorage()
    defaults.setValue(mail, forKey: SharedKeys.userMail)
    defaults.setValue(password, forKey: SharedKeys.userPassword)
    defaults.synchronize()
}

func getUserMail() -> String? {
    let defaults = getStorage()
    let mail = defaults.string(forKey: SharedKeys.userMail)
    return mail
}
