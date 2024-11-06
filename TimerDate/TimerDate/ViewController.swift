//
//  ViewController.swift
//  TimerDate
//
//  Created by Arystan on 27.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstDatePicker: UIDatePicker!
    @IBOutlet weak var secondDatePicker: UIDatePicker!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondVC" {
            if let vc = segue.destination as? SecondViewController {
                vc.startDate = firstDatePicker.date
                vc.endDate = secondDatePicker.date
            
            }
        }
    }
    
}

