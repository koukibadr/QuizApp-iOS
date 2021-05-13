//
//  ViewController.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 13/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LoginContainer: UIView!
    @IBOutlet weak var SignupContainer: UIView!
    
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SignupContainer.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onLoginClicked(_ sender: UIButton) {
        SignupContainer.isHidden = true
        LoginContainer.isHidden = false
        loginButton.setTitleColor(UIColor.black, for: .normal)
        signupButton.setTitleColor(UIColor.lightGray, for: .normal)
    }
    
    @IBAction func onSignupClicked(_ sender: UIButton) {
        SignupContainer.isHidden = false
        LoginContainer.isHidden = true
        loginButton.setTitleColor(UIColor.lightGray, for: .normal)
        signupButton.setTitleColor(UIColor.black, for: .normal)
    }
    //686868
    
}

