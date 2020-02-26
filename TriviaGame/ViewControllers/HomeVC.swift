//
//  HomeViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-28.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
//TODO

    let defaults = UserDefaults(suiteName: "com.Trivia.Game")
    // Saving the progress of the points gathered
    var summaryProgressPoints: String = ""
    // Creating a progressbar view circle
    @IBOutlet weak var summaryProgress: CircularProgressView!
    // Puts the points into numbers 
    @IBOutlet weak var summaryProgressLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //summaryProgressLbl.text = summaryProgressPoints + "/100"
                
        summaryProgress.trackColor = UIColor.gray
        summaryProgress.progressColor = UIColor.systemRed
        getProgress()
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        summaryProgress.setProgressWithAnimation(duration: 2, value: 1.0)
//        animatedProgress()

       }
       
    // Getting the points from the ScoreVC to show the sum of the progress
    func getProgress() {
        if let data = defaults?.value(forKey: "savedPoints") as? Int {
       
            summaryProgressPoints = String(data)
            summaryProgressLbl.text = summaryProgressPoints + "/100"
            
        } else {
            print("No points read")
            summaryProgressLbl.text = "0/100"
            
        }
    }
    
    
    // Create and show an info button on the top right corner of the HomeVC
    @IBAction func infoButtonTapped(_ sender: UIButton) {
        
        // create the alert
        let alert = UIAlertController(title: "Trivia Game Info", message: "Welcome Player! \n " + "information about the app... " , preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
   
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
//    func animatedProgress() {
//        if summaryProgressPoints < "20" {
//            summaryProgress.setProgressWithAnimation(duration: 2, value: 0.2)
//            print("20 progress")
//            summaryProgress.progressColor = UIColor.red
//        } else if summaryProgressPoints < "40" {
//            summaryProgress.setProgressWithAnimation(duration: 2, value: 0.4)
//            summaryProgress.progressColor = UIColor.red
//            print("40 Progress")
//        } else if summaryProgressPoints > "60" {
//            summaryProgress.setProgressWithAnimation(duration: 2, value: 0.6)
//            summaryProgress.progressColor = UIColor.red
//            print("60 Progress")
//
//        } else if summaryProgressPoints > "80" {
//            summaryProgress.setProgressWithAnimation(duration: 2, value: 0.8)
//            summaryProgress.progressColor = UIColor.red
//            print("80 Progress")
//
//        } else if summaryProgressPoints == "100" {
//            summaryProgress.setProgressWithAnimation(duration: 2, value: 1.0)
//            summaryProgress.progressColor = UIColor.red
//            print("100 Progress")
//
//
//        } else {
//            summaryProgress.setProgressWithAnimation(duration: 2, value: 0.0)
//
//        }
//    }
    
    
    
}
