//
//  ViewController.swift
//  Youtube-The-Daily-Show
//
//  Created by DDDD on 31/05/2020.
//  Copyright © 2020 MeerkatWorks. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        //Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        
        model.getVideos() 
    }
    //MARK: - TableView methods
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        return videos.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        //Configure the cell with the data
        
        
        //Return the cell for tableView for displaying
        return cell
        
        
     }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}

