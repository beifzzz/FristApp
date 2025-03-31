import Foundation
import SwiftyJSON

struct NewsItem {
    var title = ""
    var description = ""
    var url = ""
    var imageUrl = ""
    
    init(json: JSON) {
        if let item = json["title"].string {
            title = item
        }
        if let item = json["description"].string {
            description = item
        }
        if let item = json["url"].string {
            url = item
        }
        if let item = json["urlToImage"].string {
            imageUrl = item
        }
    }
}
