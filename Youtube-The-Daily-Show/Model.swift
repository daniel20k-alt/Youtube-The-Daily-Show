//
//  Model.swift
//  Youtube-The-Daily-Show
//
//  Created by DDDD on 01/06/2020.
//  Copyright © 2020 MeerkatWorks. All rights reserved.
//

import Foundation

class Model {
    
    func getVideos() {
        
        // Create an URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else {
            return
        }
        
        // Get a URLSession object
        let session = URLSession.shared
        
        // Get a data task from URLSession object API
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            // check for any errors
            if error != nil || data != nil {
                return
            }
            
            
        }
        // Start the task
        
        dataTask.resume()
   
    }
}
