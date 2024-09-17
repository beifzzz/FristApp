//
//  ViewController.swift
//  FirstProject
//
//  Created by Arystan on 17.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        
        let a = textField1.text!
        let b = textField2.text!
        
        guard let numberA = Int(a), let numberB = Int(a) else {
            label.text = "Введите 2 числа"
            return
        }
        let plus = numberA + numberB
        label.text = String(plus)
    }
    
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        
        let a = textField1.text!
        let b = textField2.text!
        
        guard let numberA = Int(a), let numberB = Int(b) else {
            label.text = "Введите 2 числа"
            return
        }
        let minus = numberA - numberB
        label.text = String(minus)
    }
    
    @IBAction func multiplyButtonTapped(_ sender: UIButton) {
        
        let a = textField1.text!
        let b = textField2.text!
        
        guard let numberA = Int(a), let numberB = Int(b) else {
            label.text = "Введите 2 числа"
            return
        }
        let multiply = numberA * numberB
        label.text = String(multiply)
    }
    
    
    @IBAction func devideButtonTapped(_ sender: UIButton) {
        
        let a = textField1.text!
        let b = textField2.text!
        
        guard let numberA = Double(a), let numberB = Double(b) else {
            label.text = "Введите 2 числа"
            return
        }
        let devide = numberA / numberB
        label.text = String(devide)
        
    }
    
}




