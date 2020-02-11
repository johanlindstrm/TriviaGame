//
//  HomeViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-28.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
//TODO
//visa spelarens namn och info
//Display trophies
    
    @IBOutlet weak var circularProgress: CircularProgressView!
    
    @IBOutlet weak var categoryProgress2: CircularProgressView!
    
    @IBOutlet weak var categoryProgress3: CircularProgressView!
    
    @IBOutlet weak var categoryProgress4: CircularProgressView!
    
    @IBOutlet weak var circularProgressLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var playerName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = playerName
        
        categoryProgress2.trackColor = UIColor.gray
        categoryProgress2.progressColor = UIColor.systemGreen
        
        categoryProgress3.trackColor = UIColor.gray
        categoryProgress3.progressColor = UIColor.black
        
        categoryProgress4.trackColor = UIColor.gray
        categoryProgress4.progressColor = UIColor.systemPurple

        circularProgress.trackColor = UIColor.gray
        circularProgress.progressColor = UIColor.systemBlue
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        circularProgress.setProgressWithAnimation(duration: 2, value: 0.90)
        categoryProgress2.setProgressWithAnimation(duration: 2, value: 0.55)
        categoryProgress3.setProgressWithAnimation(duration: 2, value: 0.80)
        categoryProgress4.setProgressWithAnimation(duration: 2, value: 0.25)

    }
    
    @IBAction func testTapped(_ sender: UIButton) {
        circularProgress.setProgressWithAnimation(duration: 1, value: 0.90)
        categoryProgress2.setProgressWithAnimation(duration: 1, value: 0.55)
        categoryProgress3.setProgressWithAnimation(duration: 1, value: 0.80)
        categoryProgress4.setProgressWithAnimation(duration: 1, value: 0.25)
    }
}
