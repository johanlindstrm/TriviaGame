//
//  ViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-17.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let questions = ["In the Metroid Series, what is the name of the main protagonist?", "Who is the creator of the Super Mario Bros Series?", "As of 2020 who is the current president of Nintendo of America?"]
    
    let answers = [["Samus Aran", "Solid Snake", "Séamus Morgan", "Sepiroth"], ["Shigeru Miyamoto", "Hayao Miyazaki", "Hideo Kojima", "Reggie Fils-Aimé"], ["Doug Bowser", "Geoff Keighley", "Reggie Fils-Aimé", "Minoru Arakawa"]]
    
    let categories = ["Videogames", "Movies/Media", "Literature"]
    
    // Variables
    var currentQuestion = 0
    var rightAnswerPlacement: UInt32 = 0
    var currentCategory = 0
    
    
    // Question Label
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Buttons, linked with tags
    @IBAction func answerButtons(_ sender: UIButton) {
        if (sender.tag == Int(rightAnswerPlacement)){
            print("RIGHT!")
        } else {
            print("WRONG!!!")
        }
        
        if (currentQuestion != questions.count) {
            newQuestion()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
        displayCategory()
    }
    
    func newQuestion() {
        questionLabel.text = questions[currentQuestion]
        
        rightAnswerPlacement = arc4random_uniform(3)+1
        
        var button: UIButton = UIButton()
        
        var x = 1
        
        for i in 1...4 {
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement)) {
                button.setTitle(answers[currentQuestion][0], for: .normal)
            } else {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
        }
        currentQuestion += 1

    }
    
    func displayCategory() {
        categoryLabel.text = categories[currentCategory]
    }

}

