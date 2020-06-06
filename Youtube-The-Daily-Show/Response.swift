//
//  Response.swift
//  Youtube-The-Daily-Show
//
//  Created by DDDD on 05/06/2020.
//  Copyright © 2020 MeerkatWorks. All rights reserved.
//

import Foundation

struct Response: Decodable {
    
    var items: [Video]?
    
    enum CodingKeys: String, CodingKey {
        
            case items
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([Video].self, forKey: .items)
    }
}
