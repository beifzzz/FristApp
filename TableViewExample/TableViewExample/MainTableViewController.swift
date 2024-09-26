//
//  MainTableViewController.swift
//  TableViewExample
//
//  Created by Arystan on 24.09.2024.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var persons: [Person] = [
    Person(name: "Hidan", surname: "Akatsuki", image: "Hidan"),
    Person(name: "Indra", surname: "Ōtsutsuki‎", image: "Indra"),
    Person(name: "Jiraiya", surname: "Gallant", image: "Jiraiya"),
    Person(name: "Kisame", surname: " Hoshigaki ", image: "Kisame"),
    Person(name: "Obito", surname: "Uchiha", image: "Obito"),
    Person(name: "Sasori", surname: "Red Sand", image: "Sasori"),
    Person(name: "Zabuza", surname: "Momochi", image: "Zabuza")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addPerson(_ sender: Any) {
        persons.append(Person(name: "Username", surname: "User", image: "Sasori"))
        
        tableView.reloadData()
    }
    

    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let nameLabel = cell.viewWithTag(1002) as! UILabel
        nameLabel.text = persons[indexPath.row].name
        
        let surnameLabel = cell.viewWithTag(1003) as! UILabel
        surnameLabel.text = persons[indexPath.row].surname
        
        let image = cell.viewWithTag(1001) as! UIImageView
        image.image = UIImage(named: persons[indexPath.row].image)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            persons.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        vc.person = persons[indexPath.row]
        
        navigationController?.show(vc, sender: self)
        
    }
    
    
        
    

}
