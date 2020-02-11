//
//  ScoreViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-23.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var scoreProgressView: CircularProgressView!
    @IBOutlet weak var backButton: UIButton!
//    @IBOutlet weak var trophyImage: UIImageView!
    var sumOfPoints = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = sumOfPoints + "/3"
        print(sumOfPoints)
        
//        if (sumOfPoints == "3") {
//            scoreLabel.text = "Congrats you win a trophy"
//        }
        
        scoreProgressView.trackColor = UIColor.gray
        scoreProgressView.progressColor = UIColor.red
//        trophyWon()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        scoreProgressView.setProgressWithAnimation(duration: 2, value: Float(sumOfPoints)!)
    }
    
    
    
    
    
    
    
//    func trophyWon() {
//
//        if (sumOfPoints == "3") {
//            print("Trophy won!")
//
//            trophyImage.isHidden = false
//            backButton.setTitle("Collect", for: .normal)
//
//        } else {
//            trophyImage.isHidden = true
//        }
//
//    }

}
