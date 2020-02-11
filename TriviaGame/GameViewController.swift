//
//  ViewController.swift
//  TriviaGame
//
//  Created by Johan Lindström on 2020-01-17.
//  Copyright © 2020 Johan Lindström. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
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
    
    // Variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points: Int = 0
    var displayCategory : String = " "
    var pointsThisRound = 0

    
    // Question Label
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    let shapeLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        categoryLabel.text = displayCategory
        newQuestion()
        
        for button in answerButtons {
            button.layer.cornerRadius = 8
        }

        let positionView = CGPoint(x: 30, y: 100)
        let trackLayer = CAShapeLayer()
        
        let progressPath = UIBezierPath(arcCenter: positionView, radius: 20, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        // Create a progress trackershade circle
        trackLayer.path = progressPath.cgPath
        
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 5
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        
        view.layer.addSublayer(trackLayer)
        
        // Create a progress circle
        shapeLayer.path = progressPath.cgPath
        
        shapeLayer.strokeColor = categoryLabel.backgroundColor?.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(activateTap)))

    }
    // Animate the circle
    @objc private func activateTap() {
        print("Attempting stroke animation")
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.duration = 10
        basicAnimation.toValue = 1
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "basicaAnimationKey")
        
    }
    
    // All answer buttons connected. If button is tapped checks right answer and calls for next question
    @IBAction func answerButtonsTapped(_ sender: UIButton) {
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
            print("Switch works 3")
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
            print("Switch works 4")
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

    }
    
    

}

