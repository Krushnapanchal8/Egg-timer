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
    
    @IBOutlet weak var progressBar: UIProgressView!
    var timer = Timer()
    var totalTime: Int = 0
    var secondsPassed: Int = 0
    var player: AVAudioPlayer?
    
    let eggTimes: [String:Int] = ["Soft": 3,"Medium": 5, "Hard": 7]
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        textLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player!.play()
                
    }
    @objc func updateTimer(){
        if (secondsPassed<totalTime){
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
            
        }else{
            timer.invalidate()
            textLabel.text = "Done!"
            playSound()
        }
    }
    
}
