//
//  ViewController.swift
//  Youtube-The-Daily-Show
//
//  Created by DDDD on 31/05/2020.
//  Copyright © 2020 MeerkatWorks. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        //Set itself as the datasource and the delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //set itself as the delegate of the model
        model.delegate = self
        
        model.getVideos() 
    }
    
    //MARK: - Model Delegate methods
    
    func videosFetched(_ videos: [Video]) {
        
        //Set the videos which will be returned to the video property
        self.videos = videos
        
        //Refresh the tableview
        tableView.reloadData()
    }
    
    //MARK: - TableView methods
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
        return videos.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        //Configure the cell with the data
        
        
        //Get the title for the video in question
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        
        //Return the cell for tableView for displaying
        return cell
        
     }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

