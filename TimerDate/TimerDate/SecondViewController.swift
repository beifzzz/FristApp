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
    var startDate: Date!
    var endDate: Date!
    let dateFormatter = DateFormatter()
    var isTimerRunning = false
    var currentDate: Date!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "dd MMM yyyy, EEE HH:mm"

        if let startDate = startDate, let endDate = endDate {
            currentDate = startDate
            timerDateLabel.text = dateFormatter.string(from: startDate)
            firstDateLabel.text = dateFormatter.string(from: startDate)
            secondDateLabel.text = dateFormatter.string(from: endDate)
        
        }
    }
    
    @objc func countTimer() {
        
        if startDate >= endDate {
            timer.invalidate()
            return
        }
        startDate = startDate.addingTimeInterval(3600)
        timerDateLabel.text = dateFormatter.string(from: startDate)
        
    }
    
    @IBAction func startButton(_ sender: Any) {
        
        if isTimerRunning {
            return
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countTimer), userInfo: nil, repeats: true)
        
        isTimerRunning = true
    }
    
    
    @IBAction func stopButton(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
    }
    
    
    @IBAction func restartButton(_ sender: Any) {
        timer.invalidate()
        isTimerRunning = false
        startDate = currentDate
        timerDateLabel.text = dateFormatter.string(from: startDate)
    }
}
