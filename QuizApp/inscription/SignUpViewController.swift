//
//  SignUpViewController.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 13/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignupClicked(_ sender: UIButton) {
        let email = self.emailInput.text
        let name = self.nameInput.text
        let username = self.usernameInput.text
        let password = self.passwordInput.text
        
        print(email)
        print(name)
        print(username)
        print(password)
        
    }
}
