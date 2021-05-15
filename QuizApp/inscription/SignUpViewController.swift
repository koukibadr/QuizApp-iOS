//
//  SignUpViewController.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 13/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onSignupClicked(_ sender: UIButton) {
        let email: String = self.emailInput.text!
        let name: String = self.nameInput.text!
        let username: String = self.usernameInput.text!
        let password: String = self.passwordInput.text!
    
        if(email.isEmpty || name.isEmpty || username.isEmpty || password.isEmpty){
            let informationPopup = createErrorPopup(title: "Erreur", message: "Veuillez saisissez tout les champs",cancelButtonText: "Ok")
            self.present(informationPopup, animated: false, completion: nil)
        }else{
            let loadingPopup = createLoadingPopup(title: "Inscription...", message: nil)
            self.present(loadingPopup, animated: false, completion: nil)
            
            self.ref.child("users/\(email)\(password)").setValue(["username": username, "email": email, "name": name, "password": password])
            setUserData(mail: email, password: password)
            
            loadingPopup.dismiss(animated: true, completion: nil)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0, execute: {
                //Navigate to home screen
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeView") as! HomeScreenViewController
                self.present(nextViewController, animated:true, completion:nil)
            })
            
            
        }
    }
}
