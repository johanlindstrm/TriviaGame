//
//  StartViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-28.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class LoginVC: UIViewController, UITextFieldDelegate {
//TODO
//inloggning
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if UserDefaults.standard.bool(forKey: "ISUSERLOGGEDIN") == true {
            //user is already logged in just navigate him to home screen
            let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.navigationController?.pushViewController(homeVc, animated: false)
        }
    }
        
    @IBAction func authenticateUser(_ sender: UIButton) {
        if (txtUsername.text == "test" && txtPassword.text == "test") {
            
            UserDefaults.standard.set(true, forKey: "ISUSERLOGGEDIN")
            
            let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
            self.navigationController?.pushViewController(homeVc, animated: true)
            
            print("try login")
        }
    }
    
}
