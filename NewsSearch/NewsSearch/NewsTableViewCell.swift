import UIKit
import SDWebImage


class NewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setData(news: NewsItem) {
        nameLabel.text = news.title
        descriptionLabel.text = news.description
        newImageView.sd_setImage(with: URL(string: news.imageUrl))
    }
    
}
