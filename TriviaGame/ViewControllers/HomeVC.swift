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
    // Creating an instance of UserDefault
    let defaults = UserDefaults(suiteName: "com.Trivia.Game")
    // Saving the progress of the points gathered
    var summaryProgressPoints: String = ""
    // Creating a progressbar view circle
    @IBOutlet weak var summaryProgress: CircularProgressView!
    // Displays the summaryProgressPoints into text in label
    @IBOutlet weak var summaryProgressLbl: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        USE WHEN NEED OF RESET
//        defaults?.set(0, forKey: "savedPoints")
        summaryProgress.trackColor = UIColor.gray
//        summaryProgress.progressColor = UIColor.systemRed
        getProgress()
        print(summaryProgressPoints)
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        summaryProgress.setProgressWithAnimation(duration: 2, value: 1.0)
        animatedProgress()

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
        let alert = UIAlertController(title: "Trivia Game Info", message: "Welcome Player! \n " + "Trivia Game is the hottest quiz game on the market. Challenge yourself by testing your knowledge in four unique categories. Prove your that you are the smartest in subjects such as Videogames, Sport, Geography, Film/Media" , preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
   
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    // Animates the summaryProgress every 25%
    func animatedProgress() {
        if summaryProgressPoints == "0" {
            summaryProgress.setProgressWithAnimation(duration: 2, value: 0.0)
            print("0 progress")
        } else if summaryProgressPoints < "25" {
            summaryProgress.setProgressWithAnimation(duration: 2, value: 0.25)
            summaryProgress.progressColor = UIColor.yellow
            print("25 Progress")
        } else if summaryProgressPoints > "25" && summaryProgressPoints < "50"{
            summaryProgress.setProgressWithAnimation(duration: 2, value: 0.50)
            summaryProgress.progressColor = UIColor.yellow
            print("50 Progress")
        } else if summaryProgressPoints > "50" && summaryProgressPoints < "75" {
            summaryProgress.setProgressWithAnimation(duration: 2, value: 0.75)
            summaryProgress.progressColor = UIColor.green
            print("75 Progress")
        } else if summaryProgressPoints == "100" {
            summaryProgress.setProgressWithAnimation(duration: 2, value: 1.0)
            summaryProgress.progressColor = UIColor.purple
            print("100 Progress")
        } else {
            summaryProgress.setProgressWithAnimation(duration: 2, value: 0.0)

        }
    }
    
    // Used to reset the score but currently only works when you move to a diffrent Viewcontroller and back
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        defaults?.set(0, forKey: "savedPoints")

    }
 
    
}
