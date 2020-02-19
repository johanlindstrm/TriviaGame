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
//visa spelarens namn och info
//Display trophies
    
    var summaryProgressPoints: String = ""
//    var geographyProgressPoints: String = ""
//    var sportProgressPoints: String = ""
//    var movieProgressPoints: String = ""

//    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var summaryProgress: CircularProgressView!
    @IBOutlet weak var summaryProgressLbl: UILabel!
    
//    @IBOutlet weak var geographyProgress: CircularProgressView!
//    @IBOutlet weak var geographyProgressLbl: UILabel!
//
//    @IBOutlet weak var sportProgress: CircularProgressView!
//    @IBOutlet weak var sportProgressLbl: UILabel!
//
//    @IBOutlet weak var movieProgress: CircularProgressView!
//    @IBOutlet weak var movieProgressLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        summaryProgressLbl.text = summaryProgressPoints + "/100"
//        geographyProgressLbl.text = geographyProgressPoints + "/100"
//        sportProgressLbl.text = sportProgressPoints + "/100"
//        movieProgressLbl.text = movieProgressPoints + "/100"
//
//        geographyProgress.trackColor = UIColor.gray
//        geographyProgress.progressColor = UIColor.systemGreen
//
//        sportProgress.trackColor = UIColor.gray
//        sportProgress.progressColor = UIColor.black
//
//        movieProgress.trackColor = UIColor.gray
//        movieProgress.progressColor = UIColor.systemPurple
//
        summaryProgress.trackColor = UIColor.gray
        summaryProgress.progressColor = UIColor.systemRed
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        summaryProgress.setProgressWithAnimation(duration: 2, value: 1.0)
//        geographyProgress.setProgressWithAnimation(duration: 2, value: 1.0)
//        sportProgress.setProgressWithAnimation(duration: 2, value: 1.0)
//        movieProgress.setProgressWithAnimation(duration: 2, value: 1.0)

    }
    
    @IBAction func testTapped(_ sender: UIButton) {
        summaryProgress.setProgressWithAnimation(duration: 1, value: 0.90)
//        geographyProgress.setProgressWithAnimation(duration: 1, value: 0.55)
//        sportProgress.setProgressWithAnimation(duration: 1, value: 0.80)
//        movieProgress.setProgressWithAnimation(duration: 1, value: 0.25)
    }
    
    @IBAction func infoButtonTapped(_ sender: UIButton) {
        
        // create the alert
        let alert = UIAlertController(title: "Trivia Game Info", message: "Welcome Player! \n " + "information about the app... " , preferredStyle: UIAlertController.Style.alert)

        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
   
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}
