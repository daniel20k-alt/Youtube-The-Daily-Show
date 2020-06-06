//
//  Constants.swift
//  Youtube-The-Daily-Show
//
//  Created by DDDD on 01/06/2020.
//  Copyright © 2020 MeerkatWorks. All rights reserved.
//

import Foundation

struct Constants {
    
    static var API_KEY = "AIzaSyCy37MxbsP7_ouHCnFtzbI4b-2UejAQvf8"
    static var PLAYLIST_ID = "UU3XTzVzaHQEd30rQbuvCtTQ"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
