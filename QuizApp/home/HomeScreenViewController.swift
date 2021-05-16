//
//  HomeScreenViewController.swift
//  QuizApp
//
//  Created by DIOTASOFT  on 15/05/2021.
//  Copyright © 2021 KOUKI_BADR. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var logoutButton: UIImageView!
    @IBOutlet weak var musicButton: UIView!
    @IBOutlet weak var sportButton: UIView!
    @IBOutlet weak var geoButton: UIView!
    @IBOutlet weak var moviesButton: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.isUserInteractionEnabled = true
        logoutButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.logout)))
        
        musicButton.isUserInteractionEnabled = true
        musicButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(HomeScreenViewController.onMusicTapped)))
        
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
        
    }

}
