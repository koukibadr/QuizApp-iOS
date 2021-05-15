//
//  LoginViewController.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 13/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onLoginClicked(_ sender: UIButton) {
        let email: String = emailInput.text!
        let password: String = passwordInput.text!
        
        print(email)
        print(password)
    }
    
    @IBAction func passwordForgotten(_ sender: UIButton) {
        
    }
}
