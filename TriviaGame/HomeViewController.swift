//
//  HomeViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-28.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    let defaults = UserDefaults.standard

    
    @IBOutlet weak var nameLabel: UILabel!
    
    var playerName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.text = playerName
        defaults.set(playerName, forKey: "Name")

    }
    
}
