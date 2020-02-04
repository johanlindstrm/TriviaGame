//
//  StartViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-28.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class StartViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var exampleName: UILabel!
    
    var name = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exampleName.text = name
                
        // Do any additional setup after loading the view.
    }
    // Sends entered name to HomeVC which displays your "players name"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let HomeViewController = segue.destination as! HomeViewController
        HomeViewController.playerName = exampleName.text!

    }

    @IBAction func confirmNameButton(_ sender: UIButton) {
        exampleName.text = nameTextField.text
    }
    
}
