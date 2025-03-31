import UIKit
import SnapKit


class CustomTableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var surnameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(nameLabel)
        addSubview(surnameLabel)
        addSubview(image)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraint() {
        image.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(20)
            make.leading.equalTo(contentView).inset(10)
            make.width.equalTo(150)
            make.height.equalTo(100)
        }
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).inset(25)
            make.leading.equalTo(image.snp.trailing).offset(25)
        }
        surnameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(25)
            make.leading.equalTo(image.snp.trailing).offset(25)
          
        }
    }
}
