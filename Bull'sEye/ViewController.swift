//
//  ViewController.swift
//  Bull'sEye
//
//  Created by Егор on 08.12.2017.
//  Copyright © 2017 Егор. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentValue = 0
    @IBOutlet weak var slider: UISlider!
    var targetValue = 0
    @IBOutlet weak var targetLabel: UILabel!
    var score = 0
    @IBOutlet weak var scoreLabel: UILabel!
    var round = 0
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //currentValue = lroundf(slider.value)
        startOver()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let leftTrackImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = leftTrackImage?.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let rightTrackImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = rightTrackImage?.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }

    
    @IBAction func startOver () {
        score = 0
        round = 0
        startNewRound()
    }
    
    func startNewRound() {
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    
    func updateLabels () {
        targetLabel.text = String(targetValue)
        scoreLabel.text = "\(score)"
        roundLabel.text = String(round)
    }

    @IBAction func sliderMoved (_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    
    
    @IBAction func showAlert() {
        let difference: Int = abs(currentValue - targetValue)
        var points = 100 - difference
        
    
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        }else if difference < 5 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
         score += points
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: { action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
 }

