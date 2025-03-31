//
//  MusicItem.swift
//  MusicApp
//
//  Created by Arystan on 11.03.2025.
//

import Foundation
import SwiftyJSON

struct MusicItem {
    
    var artistName = ""
    var artworkUrl100 = ""
    var trackName = ""
    var previewUrl = ""
    
    init(json: JSON) {
        if let item = json["artistName"].string {
            artistName = item
        }
        if let item = json["artworkUrl100"].string {
            artworkUrl100 = item
        }
        if let item = json["trackName"].string {
            trackName = item
        }
        if let item = json["previewUrl"].string {
            previewUrl = item
        }
    }
    
}
