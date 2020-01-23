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
    
    var sumOfPoints = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = sumOfPoints
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
