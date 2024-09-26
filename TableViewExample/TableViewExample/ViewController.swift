import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailSurnameLabel: UILabel!
    
    var person = Person()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailNameLabel.text = person.name
        detailSurnameLabel.text = person.surname
        detailImageView.image = UIImage(named: person.image)
        
    }


}

