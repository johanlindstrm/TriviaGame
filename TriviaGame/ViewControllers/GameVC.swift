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
    //Arrays that provides Questions and Answers to the game
    let gameQuestions = ["In the Metroid Series, what is the name of the main protagonist?",
                         "Who is the creator of the Super Mario Bros Series?",
                         "As of 2020 who is the current president of Nintendo of America?",
                         "In what year was the first game in the Halo series released?",
                         "What is the best selling videogame of all time?",
                         "Which game won GOTY by The Game Awards in 2019?",
                         "Notch is the world-famous designer of which videogame?",
                         "Solid Snake is a hero in which famous videogame franchise?",
                         "What is the highest level a player can reach in \n\"Pac-Man\"?",
                         "Question 10"]

    let gameAnswers = [["Samus Aran", "Solid Snake", "Séamus Morgan", "Sepiroth"],
                       ["Shigeru Miyamoto", "Hayao Miyazaki", "Hideo Kojima", "Miyamoto Miyazaki"],
                       ["Doug Bowser", "Geoff Keighley", "Reggie Fils-Aimé", "Minoru Arakawa"],
                       ["2001", "2003", "2002", "2000"],
                       ["Tetris", "Minecraft", "Pong", "Fortnite"],
                       ["Sekiro: Shadows Die Twice", "Death Stranding", "Star Wars Jedi: Fallen Order", "Control"],
                       ["Minecraft", "Fortnite", "World of Warcraft", "Tetris"],
                       ["Metal Gear", "Skyrim", "Grand Theft Auto", "The Sims"],
                       ["256", "999", "128", "200"],
                       ["Correct Answer", "Answer", "Answer", "Answer"]]


    let movieQuestions = ["As of 2020 who haven't won a Oscar Academy Award?",
                          "When did Breaking Bad first air?",
                          "With 11 nominations, what's the most nominated movie of 2020?",
                          "Which actor plays the role of Jim Halpert in the US version of The Office?",
                          "In what year did Facebook launch?",
                          "Name the social network that is focused on the sharing of six-second video clips.",
                          "Who is the villain in \"Austin Powers"+"?",
                          "In \"Shrek,"+"what does Shrek compare ogres to?",
                          "In \"The Matrix\" Morphus gives Neo the options of two pills the _ and _ pill.",
                          "Which social media dosen't use hashtags?"]

    let movieAnswers = [["Idris Elba", "Leonardo DiCaprio", "Matt Damon", "Christian Bale"],
                        ["2008", "2007", "2013", "2012"],
                        ["Joker", "Irishman", "Avenger's Endgame", "Parasite"],
                        ["John Krasinski", "Rainn Wilson", "Steve Carell", "Randall Park"],
                        ["2004", "2001", "2014", "2008"],
                        ["Vine", "Tik Tok", "Twitter", "Doobely"],
                        ["Dr. Evil", "Severus Snape", "Goldfinger", "Doc Ock"],
                        ["Onions", "Donkeys", "Blurgs", "Potatoes"],
                        ["Red and Blue", "White and Black", "Weak and Strong", "Purple and Orange"],
                        ["Snapchat", "Facebook", "Instagram", "Twitter"]]

    let sportQuestions = ["What is the national sport in Japan?",
                          "In which country were the first Olympic Games held?",
                          "How many matches did Mohammed Ali lose in his career?",
                          "In which sport can you get a birdie, a bogey or a hole-in-one?",
                          "Which sport is played on the largest pitch?",
                          "Who is the first Indian woman to win an individual Olympic medal?",
                          "The term Dolphin Kick is associated with which sport?",
                          "In which year first Winter Olympics were held?",
                          "Which one of the following countries was the winner of FIFA confederations cup 2017?",
                          "Which of the following tournaments is related to Tennis?"]

    let sportAnswers = [["Sumo Wrestling", "Sudoku", "Fencing", "Kendo"],
                        ["Greece", "Italy", "Egypt", "Spain"],
                        ["One", "Zero", "All of them", "7"],
                        ["Golf", "Tennis", "Bowling", "Archery"],
                        ["Polo", "Soccer", "Rugby", "Golf"],
                        ["Karnam Malleshwari", "Sania Mirza", "P V Sindhu", "Saina Newal"],
                        ["Swimming", "Football", "Cricket", "Polo"],
                        ["1924", "1912", "1956", "1988"],
                        ["Germany", "Chile", "Portugal", "Mexico"],
                        ["Davis Cup", "I-League", "Durand Cup", "Santosh Trophy"]]

    let geographyQuestions = ["Which is the most populus country?",
                              "Who many states are there in the U.S.?",
                              "Belfast is the capital of which country?",
                              "Which country has the largest population in South America?",
                              "What is the northermost capital of an independent nation in the world?",
                              "What is the longest river in Africa?",
                              "What is the most widely spoken language of the world (by first language speakers)?",
                              "What is Earth's second largest continent by surface size?",
                              "What is the longest river in South America?",
                              "What is by area the second smallest independent country on Earth?"]

    let geographyAnswers = [["China", "Russia", "USA", "India"],
                            ["50", "51", "52", "49"],
                            ["Northen Ireland", "Hungary", "Romania", "Yemen"],
                            ["Brazil", "Peru", "Chile", "Colombia"],
                            ["Reykjavik", "Ottawa", "Helsinki", "Ulaanbaatar"],
                            ["Nile", "Congo", "Niger", "Zambezi"],
                            ["Mandarin", "English", "Spanish", "Hindi"],
                            ["Africa", "South America", "Europe", "North America"],
                            ["Amazon", "Parana", "Madeira", "Araguaia"],
                            ["Monaco", "San Marino", "Tuvalu", "Nauru"]]


    
    // Variables
    // sets first question = 0 and adds by 1 with newQuestion() func
    var currentQuestion : Int = 0
    // Right answer placement randomized
    var rightAnswerPlacement:UInt32 = 0
    // Points earn each round
    var points: Int = 0
    // Displays the chosen category
    var displayCategory : String = " "
    // start timer number
    var counter : Int = 10
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

    
    
    // Starts subtracting the counter by -1 and when it reaches 0/-1 it performs a segue to the ScoreVC and terminates/invalidate the timer/gameTimer object
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
        
        if (currentQuestion < gameQuestions.count) {
            print(currentQuestion)
            newQuestion()
        } else if (currentQuestion < movieQuestions.count) {
            newQuestion()
        } else if (currentQuestion < sportQuestions.count) {
            newQuestion()
        } else if (currentQuestion < geographyQuestions.count) {
            newQuestion()
        } else {
            performSegue(withIdentifier: "showScore", sender: self)
        }
    }
    

    
    
    
    // The main game
    //  This function is called at viewDidLoad and takes in the selectedCategory from categoryVC and plays the correct matching case in the switch displayCategory. If the categoryVC send Videogames then that case will run. When a button is pressed a new question is played either for how long the array count is or until the timer runs out.
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

