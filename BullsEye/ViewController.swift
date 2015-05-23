//
//  ViewController.swift
//  BullsEye
//
//  Created by Brad Gray on 5/18/15.
//  Copyright (c) 2015 Brad Gray. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score: Int = 0
    var round: Int = 0
    
    
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
    }
    
    func startNewRound() {
        round--
        
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        
        if !(round < 0) {
            //
            
        } else {
            //alert("to bad")
            //Make an alert here that says, "Too bad"
            if round > -5{
                //showAlert()
            }

        }
    }
    func startNewGame() {
        score = 0
        round = 6
        startNewRound()
    }
    func updateLabels() {
        targetLabel.text = String(targetValue) //Set the target label = the value of the variable targetValue
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func showAlert() {
        
        if (round > 0){
            bradfunction();
        } else {
            
        }
        
        
    }
    
    @IBAction func startOver() {
        startNewGame()
        updateLabels()
    }
    
        @IBAction func sliderMoved(slider: UISlider) {
            currentValue = lroundf(slider.value)
    }
    
    /**
    This function reduces the number of tries, adds the points, and then shows their total score
    */
     func bradfunction() {
       
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        score += points
        
        // does not work here though
        var title: String
        if  difference == 0 {
            title = "BullsEye"
            points += 100
        } else if difference < 5 {
            title = "very close"
            if difference == 1 {
                points += 50
            }
        } else if difference < 15 {
            title = "close"
        }else { title = "work on your aim"
            
            
            /*var message: Int
            if round > 5 {
            var message = points
            }
            it works here with no errors but doesnt work if I put it above the other if statments. created a local variable as message, not an instance statment. Unfortunatley down below message is already assigned an instance statement. So maybe it can't be changed. */
            
        }
        
        //if score < 5 {
        
        var message = "you scored \(points) points"
            + "\nThe target value is: \(targetValue)"
            + "\nThe difference is \(difference)"
        let alert = UIAlertController(title: title,
            message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default,
            handler: { action in
                self.startNewRound()
                self.updateLabels()
                //part of a closure, will not operate without self. code isn't performed until ok is tapped.
                
        })
        /* }else {
        var message = "your final score is \"points"
        var alert = UIAlertController(title: title,
        message: message, preferredStyle: .Alert)
        var action = UIAlertAction(title: "OK", style: .Default,
        handler: { action in
        self.startNewRound()
        self.updateLabels()*/
        
        
        
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        
        if round == 1 {
            startNewGame()
        }
    
    }
}



