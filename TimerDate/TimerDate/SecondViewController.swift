//
//  SecondViewController.swift
//  TimerDate
//
//  Created by Arystan on 27.10.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var firstDateLabel: UILabel!
    @IBOutlet weak var secondDateLabel: UILabel!
    @IBOutlet weak var timerDateLabel: UILabel!
    
    var timer = Timer()
    var firstDate: Date?
    var secondDate: Date?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let startDate = firstDate, let endDate = secondDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .medium
            
            firstDateLabel.text = dateFormatter.string(from: startDate)
            secondDateLabel.text = dateFormatter.string(from: endDate)
            
            
        }
    }
    
    @objc func countTimer() {
        guard let endDate = secondDate else { return }
             
             let currentTime = Date()
             let timeInterval = endDate.timeIntervalSince(currentTime)
             
             if timeInterval <= 0 {
                 timer.invalidate()
                 timerDateLabel.text = "Time's up!"
             } else {
                 let days = Int(timeInterval) / (3600 * 24)
                 let hours = Int(timeInterval) % (3600 * 24) / 3600
                 let minutes = Int(timeInterval) % 3600 / 60
                 let seconds = Int(timeInterval) % 60
                 timerDateLabel.text = String(format: "%02d:%02d:%02d:%02d", days, hours, minutes, seconds)
             }
    }
    
    @IBAction func startButton(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTimer), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
    }
    
    
    @IBAction func restartButton(_ sender: Any) {
        timer.invalidate()
    }
    
    
    
    
}
