//
//  ScoreViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-23.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class ScoreVC: UIViewController {

    let defaults = UserDefaults(suiteName: "com.Trivia.Game")
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var scoreProgressView: CircularProgressView!
    @IBOutlet weak var backButton: UIButton!
//    @IBOutlet weak var trophyImage: UIImageView!
//    var sumOfPoints = String()
    var sumOfPoints = String()
    
    
//    var moviePoints = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = sumOfPoints + "/3"

        print(sumOfPoints)
    
        scoreProgressView.trackColor = UIColor.gray
        
        updatePoints()
        
//        deletePoints()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkWin()
    }
    
    func checkWin() {
        if sumOfPoints == "1" {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 0.33 )
            scoreProgressView.progressColor = UIColor.systemRed
        } else if sumOfPoints == "2" {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 0.66 )
            scoreProgressView.progressColor = UIColor.systemYellow
        } else if sumOfPoints == "0" {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 0.0 )
            scoreProgressView.progressColor = UIColor.black
        } else {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 1.0 )
            scoreProgressView.progressColor = UIColor.purple

        }
    }
    
        func updatePoints() {
    
            if let progress = defaults?.value(forKey: "savedPoints") as? Int {
                if let sumpoints =  Int(sumOfPoints) {
                    let progressSum = progress + sumpoints
                    defaults?.set(progressSum, forKey: "savedPoints")
                }
                
                
            } else {
                print("Can't get points")
            }
            
        }
    
        func deletePoints() {
            defaults?.removeObject(forKey: "savedPoints")
        }
        

    
}
