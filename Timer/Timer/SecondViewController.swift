//
//  SecondViewController.swift
//  Timer
//
//  Created by Arystan on 25.10.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    var time = 0
    var timer = Timer()
    var savedTime = 0
    var isTimerRunning = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = timeString(time: time)
        savedTime = time
    }
    
    @objc func countTime() {
        if time < 0 {
            timer.invalidate()
            return
        }
        textLabel.text = timeString(time: time)
        time -= 1
    }
    
    @IBAction func startTimer(_ sender: Any) {
        if isTimerRunning {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTime), userInfo: nil, repeats: true)
        
        isTimerRunning = true
        
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
    }
    
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        time = savedTime
        textLabel.text = timeString(time: time)
    }
    
    func timeString(time: Int) -> String {
          let hour = Int(time) / 3600
          let minute = Int(time) / 60 % 60
          let second = Int(time) % 60

          // return formated string
          return String(format: "%02i:%02i:%02i", hour, minute, second)
      }
    
}
