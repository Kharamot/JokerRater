//
//  ViewController.swift
//  Joker2
//
//  Created by Kameron Haramoto on 1/20/17.
//  Copyright © 2017 Kameron Haramoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    // Variable declarations.
    var jokesArray = [Joke]()
    var noRepetes: Int? = nil
    var image: UIImage = UIImage(named: "Joker-50.png")!
    var fillImage: UIImage = UIImage(named: "JokerFilled-50.png")!
    var index: Int = 0
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    var starArray = [UIImageView]()
    
    @IBOutlet weak var firstLine: UILabel!
    @IBOutlet weak var jokeNum: UILabel!
    @IBOutlet weak var secondLine: UILabel!
    @IBOutlet weak var thirdLine: UILabel!
    @IBOutlet weak var answerLine: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(handleTap1))
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(handleTap2))
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(handleTap3))
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(handleTap4))
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(handleTap5))
        
        tapGestureRecognizer1.delegate = self
        tapGestureRecognizer2.delegate = self
        tapGestureRecognizer3.delegate = self
        tapGestureRecognizer4.delegate = self
        tapGestureRecognizer5.delegate = self
        
        star1.isUserInteractionEnabled = true
        star2.isUserInteractionEnabled = true
        star3.isUserInteractionEnabled = true
        star4.isUserInteractionEnabled = true
        star5.isUserInteractionEnabled = true
        
//        self.view.addGestureRecognizer(tapGestureRecognizer1)
        self.star1.addGestureRecognizer(tapGestureRecognizer1)
        self.star2.addGestureRecognizer(tapGestureRecognizer2)
        self.star3.addGestureRecognizer(tapGestureRecognizer3)
        self.star4.addGestureRecognizer(tapGestureRecognizer4)
        self.star5.addGestureRecognizer(tapGestureRecognizer5)
        
        initializeJokes()
        chooseJoke()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func handleTap1 (recognizer: UITapGestureRecognizer) {
        setJokeRating(rating: 1)
    }
    func handleTap2 (recognizer: UITapGestureRecognizer) {
        setJokeRating(rating: 2)
    }
    func handleTap3 (recognizer: UITapGestureRecognizer) {
        setJokeRating(rating: 3)
    }
    func handleTap4 (recognizer: UITapGestureRecognizer) {
        setJokeRating(rating: 4)
    }
    func handleTap5 (recognizer: UITapGestureRecognizer) {
        setJokeRating(rating: 5)
    }
    
    
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        
        if(index == 0)
        {
            index = jokesArray.count - 1
        } else{
            index -= 1
        }
        chooseJoke()
    }
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        
        if(index == jokesArray.count - 1)
        {
            index = 0
        } else{
            index += 1
        }
        chooseJoke()
    }
    
    // Initilizes jokes using the Joke class, and stores them in the array.
    func initializeJokes(){
        let joke = Joke(first: "How many programmers", second: "does it take to", third: "change a lightbulb?", answer: "Zero. That's a hardware problem.")
        self.jokesArray.append(joke)
        
        let joke2 = Joke(first: "What prize do", second: "you get for putting", third: "your phone on vibrate?", answer: "The No Bell Prize.")
        self.jokesArray.append(joke2)
        
        let joke3 = Joke(first: "What do you get", second: "when you cross a", third: "stereo and a refrigerator?", answer: "Cool music.")
        self.jokesArray.append(joke3)
        
        let joke4 = Joke(first: "Why do phones ring?", answer: "Because they can't talk.")
        self.jokesArray.append(joke4)
        
        let joke5 = Joke(first: "Hillary Clinton", second: "Spent $1.2 Billion", answer: "And still lost! lol")
        self.jokesArray.append(joke5)
        
        //Initilize array of imageviews
        self.starArray.append(star1)
        self.starArray.append(star2)
        self.starArray.append(star3)
        self.starArray.append(star4)
        self.starArray.append(star5)
    }
    
    // Chooses joke from jokeArray.
    func chooseJoke(){

        firstLine.text = jokesArray[index].firstLine
        secondLine.text = jokesArray[index].secondLine
        thirdLine.text = jokesArray[index].thirdLine
        answerLine.text = jokesArray[index].answerLine
        jokeNum.text = "Joke #\(index + 1)"
        
        setJokeRating(rating: jokesArray[index].rating)
    }
    
    //sets the jokes rating and displays the correct amount of filled images
    func setJokeRating(rating: Int){
        var i: Int = 0
        jokesArray[index].rating = rating
        while i < 5
        {
            if(rating > i)
            {
                self.starArray[i].image = fillImage
            }
            else{
                self.starArray[i].image = image
            }
            i += 1
        }
    }
    
}

