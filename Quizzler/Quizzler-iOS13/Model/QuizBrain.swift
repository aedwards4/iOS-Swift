//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Alexis Edwards on 12/17/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain{
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")

    ]

    //Keeping track of user's progress
    var questionNumber = 0
    var score = 0
    
    
    //Check user's answer against correct answer, and return if they got it right
    mutating func checkAnswer(_ userAnswer: String)  -> Bool{
        if userAnswer == quiz[questionNumber].correctAnswer{
            score += 1
            return true
        }
        else{
            return false
        }
    }
    
    
    //Return question String
    func getQuestionText() -> String{
        return quiz[questionNumber].text
    }
    
    
    //return user's progress
    func getProgress() -> Float{
        return Float(questionNumber+1)/Float(quiz.count)
    }
    
    
    //Advance to the next quiz question
    mutating func nextQuestion(){
        if questionNumber < (quiz.count - 1){
            questionNumber += 1
        }
        else{
            questionNumber = 0
        }
    }
    
    //return user's current score
    mutating func getScore() ->Int{
        if questionNumber == 0{
            score = 0
        }
        
        return score
    }

    
    func getQuestionMC() -> [String]{
        return quiz[questionNumber].answer
    }
}
