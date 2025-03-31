//
//  ViewController.swift
//  DelegateList
//
//  Created by Arystan on 25.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var tasks: [String] = []
    

    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButtonTapped: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        if tasks.count * 44 < Int(view.frame.height - topConstraint.constant - bottomConstraint.constant) {
            let constantValue = (view.frame.height - CGFloat(tasks.count * 44)) / 2
            
            topConstraint.constant = constantValue
            bottomConstraint.constant = constantValue
        }
    }
    @IBAction func taskAdded(_ sender: Any) {
        let task = textField.text!
        
    }
    

}

