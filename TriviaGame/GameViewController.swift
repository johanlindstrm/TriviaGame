//
//  ViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-17.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
//    let questions = ["In the Metroid Series, what is the name of the main protagonist?",
//                     "Who is the creator of the Super Mario Bros Series?",
//                     "As of 2020 who is the current president of Nintendo of America?"]
//
//    let answers = [["Samus Aran", "Solid Snake", "Séamus Morgan", "Sepiroth"],
//                   ["Shigeru Miyamoto", "Hayao Miyazaki", "Hideo Kojima", "Reggie Fils-Aimé"],
//                   ["Doug Bowser", "Geoff Keighley", "Reggie Fils-Aimé", "Minoru Arakawa"]]
//
    let gameQuestions = ["In the Metroid Series, what is the name of the main protagonist?",
                         "Who is the creator of the Super Mario Bros Series?",
                         "As of 2020 who is the current president of Nintendo of America?"]
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

//    let categories = ["Videogames", "Movies/Media", "Literature"]
    
    // Variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
//    var currentCategory = 0
    var points: Int = 0
    var displayCategory : String = " "
    var pointsThisRound = 0
//    var q1 = Question(question: "Hello?", answer: ["sup", "yes?", "get lost!"], correctAnswer: 0)
    
    // Question Label
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = displayCategory
        newQuestion()
//        categoryQuestion()
//        countdown()
    }
    
    // Buttons, linked with tags
    @IBAction func answerButtons(_ sender: UIButton) {
        if (sender.tag == Int(rightAnswerPlacement)){
            print("CORRECT!")
            points += 1
        } else {
            print("WRONG!!!")
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let ScoreViewController = segue.destination as! ScoreViewController
        ScoreViewController.sumOfPoints = String(points)
        
    }
    
    
    
    
    
    
    func newQuestion() {
//        questionLabel.text = questions[currentQuestion]
        
        switch displayCategory {
        case "Videogames":
            print("Switch works 1")
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
            print("Switch works 2")
            questionLabel.text = sportQuestions[currentQuestion]
            rightAnswerPlacement = arc4random_uniform(3)+1
            categoryLabel.backgroundColor = UIColor.gray

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
            print("Switch works 2")
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
            print("No category selected")
        }
        
//        rightAnswerPlacement = arc4random_uniform(3)+1
//
//        var button: UIButton = UIButton()
//
//        var x = 1
//
//        for i in 1...4 {
//            button = view.viewWithTag(i) as! UIButton
//
//            if (i == rightAnswerPlacement) {
//                button.setTitle(gameAnswers[currentQuestion][0], for: .normal)
//            } else {
//                button.setTitle(gameAnswers[currentQuestion][x], for: .normal)
//                x += 1
//
//            }
//        }
//        currentQuestion += 1
    }
    

    // func for questions called using a switch/if statements, if the category is selected then call the correct questions
//
//    func categoryQuestion() {
//
//        switch displayCategory {
//        case "Category 1":
//            print("Switch works 1")
//
//        case "Category 2":
//            print("Switch works 2")
//
//        case "Category 3":
//            print("Switch works 2")
//
//        case "Category 4":
//            print("Switch works 2")
//        default:
//            print("No category selected")
//        }
//
////        if (displayCategory == "Category 2") {
////            print("test works")
////        }
//    }
    

}

