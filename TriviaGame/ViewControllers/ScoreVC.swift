//
//  ScoreViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-23.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class ScoreVC: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var scoreProgressView: CircularProgressView!
    @IBOutlet weak var backButton: UIButton!
//    @IBOutlet weak var trophyImage: UIImageView!
    var sumOfPoints = String()
//    var moviePoints = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        scoreLabel.text = moviePoints + "/3"
        scoreLabel.text = sumOfPoints + "/3"

        print(sumOfPoints)
    
        scoreProgressView.trackColor = UIColor.gray
//        scoreProgressView.progressColor = UIColor.red
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        scoreProgressView.setProgressWithAnimation(duration: 2, value: Float(sumOfPoints)!)
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let HomeViewController = segue.destination as! HomeVC
        HomeViewController.summaryProgressPoints = String(sumOfPoints)
        print("sending all points -> HomeVC")

    }
    
}
