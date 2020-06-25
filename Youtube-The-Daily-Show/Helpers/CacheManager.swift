//
//  CacheManager.swift
//  Youtube-The-Daily-Show
//
//  Created by DDDD on 25/06/2020.
//  Copyright © 2020 MeerkatWorks. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var cache = [String : Data]()
    
    static func setVideoCache(_ url: String, _ data: Data?) {
        
        // storing the image data and using the url as a key
        cache[url] = data
    }
    
    static func getVideoCache(_ url:String) -> Data? {
        
        //trying to get the data for the specified url
        return cache[url]
    }
}
