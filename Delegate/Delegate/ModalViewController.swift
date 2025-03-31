//
//  ModalViewController.swift
//  Delegate
//
//  Created by Arystan on 25.03.2025.
//

import UIKit

protocol SelectCategoryProtocol {
    func setCategory(_ category: String)
}

class ModalViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIGestureRecognizerDelegate {
    

    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var categoryArray: [String] = []
    
    var delegate: SelectCategoryProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        
        tableView.delegate = self
        
        tableView.layer.cornerRadius = 20
        
        if categoryArray.count * 44 < Int(view.frame.height - topConstraint.constant - bottomConstraint.constant) {
            let constraintValue = (view.frame.height - CGFloat(categoryArray.count * 44)) / 2
            
            topConstraint.constant = constraintValue
            bottomConstraint.constant = constraintValue
        }
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        
        tap.delegate = self
        view.addGestureRecognizer(tap)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: tableView))! {
            return false
        } else {
            return true
        }
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = categoryArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.setCategory(categoryArray[indexPath.row])
        dismiss(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
