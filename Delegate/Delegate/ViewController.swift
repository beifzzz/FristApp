//
//  ViewController.swift
//  Delegate
//
//  Created by Arystan on 25.03.2025.
//

import UIKit

class ViewController: UIViewController, SelectCategoryProtocol {
 
    @IBOutlet weak var selectCategoryButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func openModalView(_ sender: Any) {
        
        let modalView = storyboard?.instantiateViewController(identifier: "ModalViewController") as! ModalViewController
        
        modalView.modalPresentationStyle = .overCurrentContext
        
        modalView.categoryArray = ["Food", "Clothing", "Electronics", "Other"]
        
        modalView.delegate = self
        
        present(modalView, animated: true)
    }
    
    
    func setCategory(_ category: String) {
        selectCategoryButton.setTitle(category, for: .normal)
    }
    
}

