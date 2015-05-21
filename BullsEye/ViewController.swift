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
        startNewRound()
        updateLabels()
    }
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        var title: String
        if  difference == 0 {
            title = "BullsEye"
            points += 100
        } else if difference < 1 {
            title = "very close"
            points += 50
        } else if difference < 15 {
            title = "close"
        } else {
            title = "work on your aim"
            
        }
        score += points
        
        let message = "you scored \(points) points"
        + "\nThe target value is: \(targetValue)"
        + "\nThe difference is \(difference)"
        let alert = UIAlertController(title: title,
        message: message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default,
            handler: { action in
            self.startNewRound()
            self.updateLabels()
    })
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    
             }
        @IBAction func sliderMoved(slider: UISlider) {
            currentValue = lroundf(slider.value)
    }
}



