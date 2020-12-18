//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]

    var secondsPassed = 0
    var totalSeconds = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timerProgressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timerProgressBar.progress = 0
        timer.invalidate()
        secondsPassed = 0
        
        let hardness = sender.currentTitle!
        totalSeconds = eggTimes[hardness]!
        
        titleLabel.text = "Cooking..."
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo:nil, repeats: true)

    }

    @objc func updateTimer(){
        if secondsPassed < totalSeconds{
            
            let percentageProgress = Float(secondsPassed) / Float(totalSeconds)
            
            timerProgressBar.progress = percentageProgress
            
            secondsPassed += 1
        }
        else{
            timerProgressBar.progress = 1.0
            playSound()
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}
