import UIKit

class TableViewController: UITableViewController {
    
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
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 150
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
    }


    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let person = persons[indexPath.row]
        cell.nameLabel.text = person.name
        cell.surnameLabel.text = person.surname
        cell.image.image = UIImage(named: person.image)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "ViewController") as? ViewController {
            self.navigationController?.pushViewController(vc, animated: true)
            vc.person = persons[indexPath.row]

        }
    }
}
