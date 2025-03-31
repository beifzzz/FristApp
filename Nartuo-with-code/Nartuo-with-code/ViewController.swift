import UIKit


class ViewController: UIViewController {
    
    var person = Person()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: person.image)
        nameLabel.text = person.name
        descriptionLabel.text = person.name
        
        setupUI()
        setConstraint()

    }
    
    func setupUI() {
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(descriptionLabel)
    }
    
    func setConstraint() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).inset(50)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(50)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
    }


}

