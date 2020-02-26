//
//  ViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-17.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit



class GameVC: UIViewController {
    
    let defaults = UserDefaults(suiteName: "com.Trivia.Game")
    
    let gameQuestions = ["In the Metroid Series, what is the name of the main protagonist?",
                         "Who is the creator of the Super Mario Bros Series?",
                         "As of 2020 who is the current president of Nintendo of America?",]

    let gameAnswers = [["Samus Aran", "Solid Snake", "Séamus Morgan", "Sepiroth"],
                       ["Shigeru Miyamoto", "Hayao Miyazaki", "Hideo Kojima", "Miyamoto Miyazaki"],
                       ["Doug Bowser", "Geoff Keighley", "Reggie Fils-Aimé", "Minoru Arakawa"]]


    let movieQuestions = ["As of 2020 who haven't won a Oscar Academy Award?",
                          "When did Breaking Bad first air?", "With 11 nominations, what's the most nominated movie of 2020?"]

    let movieAnswers = [["Idris Elba", "Leonardo DiCaprio", "Matt Damon", "Christian Bale"],
                        ["2008", "2007", "2013", "2012"],
                        ["Joker", "Irishman", "Avenger's Endgame", "Parasite"]]

    let sportQuestions = ["What is the national sport in Japan?",
                          "In which country were the first Olympic Games held?",
                          "How many matches did Mohammed Ali lose in his career?"]

    let sportAnswers = [["Sumo Wrestling", "Sudoku", "Fencing", "Kendo"],
                        ["Greece", "Italy", "Egypt", "Spain"],
                        ["One", "Zero", "All of them", "7"]]

    let geographyQuestions = ["Which is the most populus country?",
                              "Who many states are there in the U.S.?",
                              "Belfast is the capital of which country?"]

    let geographyAnswers = [["China", "Russia", "USA", "India"],
                            ["50", "51", "52", "49"],
                            ["Northen Ireland", "Hungary", "Romania", "Yemen"]]

    struct Question {
        var question : String!
        var answers : [String]!
        var correctAnswer : Int!
    }
    
    // Variables
    var currentQuestion = 0
    // Right answer placement randomized
    var rightAnswerPlacement:UInt32 = 0
    // Points earn each round
    var points: Int = 0
    // Displays the chosen category
    var displayCategory : String = " "
    // start timer number
    var counter = 10
    //Set the timer
    var gameTimer : Timer?
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBOutlet weak var timerProgressView: CircularProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
        
//        print(defaults?.dictionary(forKey: "savedPoints"))

//        deletePoints()
        
       // getPoints()
        print(points)
        
        // Countdown/Timer Object
        gameTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        // Draws the timer progress circle
        timerProgressView.trackLayer.lineWidth = 5
        timerProgressView.progressLayer.lineWidth = 5
        timerProgressView.trackColor = UIColor.gray
        timerProgressView.progressColor = (categoryLabel.backgroundColor)!
        
        // Adds rounded corners to answerbuttons
        for button in answerButtons {
            button.layer.cornerRadius = 8
        }
    }
    // Starts the animation progress for the timer when the view appears
    override func viewDidAppear(_ animated: Bool) {
        timerProgressView.setProgressWithAnimation(duration: 11, value: 1.0)
    }

    
    // skickar vidare points till scoreVC som en string -/3 points
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ScoreViewController = segue.destination as! ScoreVC
        ScoreViewController.sumOfPoints = String(points)
        print("sending points -> ScoreVC")
    }

    
    
    //
    @objc func updateCounter() {

        if counter > -1 {
            timerLabel.text = String(counter)
//            print(counter)
            counter -= 1
        } else {
            performSegue(withIdentifier: "showScore", sender: self)
            gameTimer?.invalidate()
        }
    }
    

    // All answer buttons connected. puts the rightanswerplacement on button tag if that button is pressed points is awarded.
    @IBAction func answerButtonsTapped(_ sender: UIButton) {
        
        if (sender.tag == Int(rightAnswerPlacement)) {
            print("+1 point")
            
            points += 1
            
            
        } else {
            print("no point")
        }        
        
        if (currentQuestion != gameQuestions.count) {
            newQuestion()
        } else if (currentQuestion != movieQuestions.count) {
            newQuestion()
        } else if (currentQuestion != sportQuestions.count) {
            newQuestion()
        } else if (currentQuestion != geographyQuestions.count) {
            newQuestion()
        } else {
            performSegue(withIdentifier: "showScore", sender: self)
        }
    }
    

    
    //
    //
    func newQuestion() {
        
        switch displayCategory {
            
        case "Videogames":
            print("Switch works 1")
            categoryLabel.text = "Videogames"
            questionLabel.text = gameQuestions[currentQuestion]
            categoryLabel.backgroundColor = UIColor.systemBlue
            rightAnswerPlacement = arc4random_uniform(3)+1

            var button: UIButton = UIButton()
            
            var x = 1
            
            for i in 1...4 {
                button = view.viewWithTag(i) as! UIButton
                
                if (i == rightAnswerPlacement) {
                    button.setTitle(gameAnswers[currentQuestion][0], for: .normal)
                } else {
                    button.setTitle(gameAnswers[currentQuestion][x], for: .normal)
                    x += 1
                    
                }
            }
            currentQuestion += 1
            
        case "Film/Media":
            print("Switch works 2")
            categoryLabel.text = "Film/Media"
            questionLabel.text = movieQuestions[currentQuestion]
            rightAnswerPlacement = arc4random_uniform(3)+1
            
            var button: UIButton = UIButton()
            
            var x = 1
            
            for i in 1...4 {
                button = view.viewWithTag(i) as! UIButton
                
                if (i == rightAnswerPlacement) {
                    button.setTitle(movieAnswers[currentQuestion][0], for: .normal)
                } else {
                    button.setTitle(movieAnswers[currentQuestion][x], for: .normal)
                    x += 1
                    
                }
            }
            currentQuestion += 1

        case "Sport":
            print("Switch works 3")
            categoryLabel.text = "Sport"
            questionLabel.text = sportQuestions[currentQuestion]
            rightAnswerPlacement = arc4random_uniform(3)+1
            categoryLabel.backgroundColor = UIColor.black

            var button: UIButton = UIButton()
            
            var x = 1
            
            for i in 1...4 {
                button = view.viewWithTag(i) as! UIButton
                
                if (i == rightAnswerPlacement) {
                    button.setTitle(sportAnswers[currentQuestion][0], for: .normal)
                } else {
                    button.setTitle(sportAnswers[currentQuestion][x], for: .normal)
                    x += 1
                    
                }
            }
            currentQuestion += 1

        case "Geography":
            print("Switch works 4")
            categoryLabel.text = "Geography"
            questionLabel.text = geographyQuestions[currentQuestion]
            rightAnswerPlacement = arc4random_uniform(3)+1
            categoryLabel.backgroundColor = UIColor.systemGreen

            var button: UIButton = UIButton()
            
            var x = 1
            
            for i in 1...4 {
                button = view.viewWithTag(i) as! UIButton
                
                if (i == rightAnswerPlacement) {
                    button.setTitle(geographyAnswers[currentQuestion][0], for: .normal)
                } else {
                    button.setTitle(geographyAnswers[currentQuestion][x], for: .normal)
                    x += 1
                }
                
            }
            currentQuestion += 1

        default:
            
            print("Default selected")
            categoryLabel.text = "Videogames"
            questionLabel.text = gameQuestions[currentQuestion]
            categoryLabel.backgroundColor = UIColor.systemBlue
            rightAnswerPlacement = arc4random_uniform(3)+1
            var button: UIButton = UIButton()
            
            var x = 1
            
            for i in 1...4 {
                button = view.viewWithTag(i) as! UIButton
                
                if (i == rightAnswerPlacement) {
                    button.setTitle(gameAnswers[currentQuestion][0], for: .normal)
                } else {
                    button.setTitle(gameAnswers[currentQuestion][x], for: .normal)
                    x += 1
                    
                }
                
            }
            currentQuestion += 1

        }

    }

}

