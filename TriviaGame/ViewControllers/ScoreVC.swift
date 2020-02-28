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
        
        scoreLabel.text = sumOfPoints + "/10"

        print(sumOfPoints)
    
        scoreProgressView.trackColor = UIColor.gray
        
        updatePoints()
        // Delete Points func is used for deleting everyting in the UserDefault "SavedPoints"
        // Now i use the defaults.set and just set the value = 0 which resets it
//         deletePoints()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // calls the checkWin() when the viewAppears and now before the viewDidLoad
        checkWin()
    }
    // A simple progress animation that shows a little circle progress view animation for each of the points you can get 0-10
    func checkWin() {
        if sumOfPoints == "1" {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 0.10 )
            scoreProgressView.progressColor = UIColor.systemRed
        } else if sumOfPoints == "2" {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 0.20 )
            scoreProgressView.progressColor = UIColor.systemRed
        } else if sumOfPoints == "3" {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 0.30 )
            scoreProgressView.progressColor = UIColor.systemRed
        } else if sumOfPoints == "4" {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 0.40 )
            scoreProgressView.progressColor = UIColor.systemYellow
        } else if sumOfPoints == "5" {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 0.50 )
            scoreProgressView.progressColor = UIColor.systemYellow
        } else if sumOfPoints == "6" {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 0.60 )
            scoreProgressView.progressColor = UIColor.systemYellow
        } else if sumOfPoints == "7" {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 0.70 )
            scoreProgressView.progressColor = UIColor.systemGreen
        } else if sumOfPoints == "8" {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 0.80 )
            scoreProgressView.progressColor = UIColor.systemGreen
        } else if sumOfPoints == "9" {
            scoreProgressView.setProgressWithAnimation(duration: 1, value: 0.90 )
            scoreProgressView.progressColor = UIColor.systemGreen
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
