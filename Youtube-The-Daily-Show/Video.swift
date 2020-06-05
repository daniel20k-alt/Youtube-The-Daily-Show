//
//  Video.swift
//  Youtube-The-Daily-Show
//
//  Created by DDDD on 01/06/2020.
//  Copyright © 2020 MeerkatWorks. All rights reserved.
//

import Foundation

struct Video {
    
    var videoId = ""
    var title = ""
    var description = ""
    var thumbnail = ""
    var published = ""
    
    
    enum CodingKeys : String, CodingKey {
        
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }

    init (from decoder: Decoder) throws {
         
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // parse title
        
        
        //parse description
        
        
        // parse published date
        
        
        
    }
}
