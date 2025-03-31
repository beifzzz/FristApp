//
//  ViewController.swift
//  calculator-with-code
//
//  Created by Arystan on 29.03.2025.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Введите число"
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var firstTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    lazy var secondTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 50)
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 50)
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        return button
    }()
    
    lazy var multiplyButton: UIButton = {
        let button = UIButton()
        button.setTitle("*", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 50)
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        return button
    }()
    
    lazy var devideButton: UIButton = {
        let button = UIButton()
        button.setTitle("/", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 50)
        button.layer.cornerRadius = 10
        button.backgroundColor = .blue
        button.titleLabel?.textAlignment = .center

        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        constraintUI()
    }
    
    func setupUI() {
        view.addSubview(label)
        view.addSubview(firstTextField)
        view.addSubview(secondTextField)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        view.addSubview(multiplyButton)
        view.addSubview(devideButton)
    }
    
    func constraintUI() {
        label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(100)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        firstTextField.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        secondTextField.snp.makeConstraints { make in
            make.top.equalTo(firstTextField.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(secondTextField.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(65)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        minusButton.snp.makeConstraints { make in
            make.top.equalTo(secondTextField.snp.bottom).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(65)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        devideButton.snp.makeConstraints { make in
            make.top.equalTo(plusButton.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(65)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
        multiplyButton.snp.makeConstraints { make in
            make.top.equalTo(minusButton.snp.bottom).offset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(65)
            make.width.equalTo(100)
            make.height.equalTo(100)
            
        }
        
    
        plusButton.addTarget(self, action: #selector(plus), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minus), for: .touchUpInside)
        devideButton.addTarget(self, action: #selector(devide), for: .touchUpInside)
        multiplyButton.addTarget(self, action: #selector(multiply) , for: .touchUpInside)
      
        
    }
    
    @objc func plus() {
        let a = firstTextField.text!
        let b = secondTextField.text!
        let sum = Int(a)! + Int(b)!
        label.text = String(sum)
    }
    @objc func minus() {
        let a = firstTextField.text!
        let b = secondTextField.text!
        let sum = Int(a)! - Int(b)!
        label.text = String(sum)
    }
    @objc func devide() {
        let a = firstTextField.text!
        let b = secondTextField.text!
        let sum = Int(a)! / Int(b)!
        label.text = String(sum)
    }
    @objc func multiply() {
        let a = firstTextField.text!
        let b = secondTextField.text!
        let sum = Int(a)! * Int(b)!
        label.text = String(sum)
    }
}
