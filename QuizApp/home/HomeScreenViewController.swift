//
//  HomeScreenViewController.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 15/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import UIKit
import Firebase

class HomeScreenViewController: UIViewController {

    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIImageView!
    @IBOutlet weak var musicButton: UIView!
    @IBOutlet weak var sportButton: UIView!
    @IBOutlet weak var geoButton: UIView!
    @IBOutlet weak var moviesButton: UIView!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeButtons()
        ref = Database.database().reference()
        displayUserInfo()
    }
    
    func initializeButtons(){
        logoutButton.isUserInteractionEnabled = true
        logoutButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.logout)))
        
        musicButton.isUserInteractionEnabled = true
        musicButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.onMusicTapped)))
        
        sportButton.isUserInteractionEnabled = true
        sportButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.onSportTapped)))
        
        geoButton.isUserInteractionEnabled = true
        geoButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.onGeoTapped)))
        
        moviesButton.isUserInteractionEnabled = true
        moviesButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.onMoviesTapped)))
    }
    
    func displayUserInfo(){
        if let mail = getUserMail() {
            ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
                if let value = snapshot.value as? NSDictionary {
                    for (_, object) in value {
                        if let data = object as? NSDictionary {
                            let email = data["email"] as! String
                            if(mail == email){
                                self.usernameLabel.text = data["username"] as? String
                                self.nameLabel.text = data["name"] as? String
                            }
                        }
                    }
                }
            }) { (error) in
                print(error.localizedDescription)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func logout()
    {
        let logoutConfirmPopup = createInformationPopup(title: "QuizApp", message: "Êtes-vous sûr de vouloir vous déconnecter ?",confirmButtonHandler: disconnect)
        self.present(logoutConfirmPopup, animated: true, completion: nil)
    }
    
    func disconnect(action: UIAlertAction) {
        clearUserData()
        //Navigate to login
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "AuthScreen") as! ViewController
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    @objc func onMusicTapped()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let quizController = storyBoard.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
        quizController.categoryId = MUSIC_CATEGORY_ID
        self.present(quizController, animated:true, completion:nil)
    }
    
    @objc func onSportTapped()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let quizController = storyBoard.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
        quizController.categoryId = SPORT_CATEGORY_ID
        self.present(quizController, animated:true, completion:nil)
    }
    
    @objc func onGeoTapped()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let quizController = storyBoard.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
        quizController.categoryId = GEO_CATEGORY_ID
        self.present(quizController, animated:true, completion:nil)
    }
    
    @objc func onMoviesTapped()
    {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let quizController = storyBoard.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
        quizController.categoryId = MOVIES_CATEGORY_ID
        self.present(quizController, animated:true, completion:nil)
    }
    

}
