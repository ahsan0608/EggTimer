//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimer = ["Soft": 3, "Medium": 5, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPass = 0
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    

    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimer[hardness]!
        
        progressBar.progress = 0.0
        secondsPass = 0
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPass < totalTime {
            secondsPass += 1
            progressBar.progress = Float(secondsPass) / Float(totalTime)
        } else {
            timer.invalidate()
            titleLabel.text = "Done"
        }
    }
    
    
}
