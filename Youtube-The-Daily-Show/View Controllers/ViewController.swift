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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Checking if a video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //Getting a reference to the selected video
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //Getting a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        //Setting the video property of the detail view controller
        detailVC.video = selectedVideo
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
         
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //Configure the cell with the data
        
        let video = self.videos[indexPath.row]
        cell.setCell(video)
//
//        //Return the cell for tableView for displaying

        return cell
     }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

