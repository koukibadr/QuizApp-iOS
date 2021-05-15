//
//  LoginViewController.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 13/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onLoginClicked(_ sender: UIButton) {
        let email: String = emailInput.text!
        let password: String = passwordInput.text!
        
        if(email.isEmpty || password.isEmpty){
            let informationPopup = createErrorPopup(title: "Erreur", message: "Veuillez saisissez tout les champs",cancelButtonText: "Ok")
            self.present(informationPopup, animated: false, completion: nil)
        }
        
        let loadingPopup = createLoadingPopup(title: "Authentification...", message: nil)
        self.present(loadingPopup, animated: false, completion: nil)
        
        ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
            if let value = snapshot.value as? NSDictionary {
                var userValid = false
                for (_, object) in value {
                    if let data = object as? NSDictionary {
                        let mail = data["email"] as! String
                        let passwordUser = data["password"] as! String
                        if(mail == email && password == passwordUser){
                            userValid = true
                        }
                    }
                }
                loadingPopup.dismiss(animated: true, completion: nil)
                if(userValid){
                    setUserData(mail: email, password: password)
                    
                    //Navigate to home screen
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeView") as! HomeScreenViewController
                    self.present(nextViewController, animated:true, completion:nil)
                    
                }else {
                    let informationPopup = createErrorPopup(title: "Erreur", message: "Utilisateur inconnue!",cancelButtonText: "Ok")
                    self.present(informationPopup, animated: false, completion: nil)
                }
            }
        }) { (error) in
            loadingPopup.dismiss(animated: true, completion: nil)
            print(error.localizedDescription)
        }
    }
    
    @IBAction func passwordForgotten(_ sender: UIButton) {
        
    }
}
